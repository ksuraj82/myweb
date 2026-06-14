package com.learnitguide.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/generateAudio")
public class GenerateAudioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Direct link to your working Python FastAPI POST endpoint
    private static final String PYTHON_POST_API_URL = "http://localhost:8000/api/v1/tts";

    /**
     * JavaScript calls this via GET. The servlet intercepts the text, 
     * packs it into JSON, and sends a POST request to your existing Python API.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Extract the text query sent from speakPhrase()
        String phrase = request.getParameter("phrase");
        if (phrase == null || phrase.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing phrase parameter");
            return;
        }

        // 2. Format the text parameter into clean JSON to match your Pydantic structure
        // Escape quotes to prevent structural JSON errors with punctuation characters
        String safePhrase = phrase.replace("\"", "\\\""); 
        String jsonPayload = "{\"text\": \"" + safePhrase + "\", \"reference_audio\": \"your_10s_ref_clip.wav\"}";

        HttpURLConnection connection = null;
        OutputStream pythonOutputStream = null;
        InputStream pythonInputStream = null;
        OutputStream browserOutputStream = null;

        try {
            // 3. Configure the outbound HTTP Connection as a POST request
            URL url = new URL(PYTHON_POST_API_URL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json; utf-8");
            connection.setRequestProperty("Accept", "audio/wav");
            connection.setDoOutput(true); // Allows sending a payload body
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(15000); // Give the AI model time to generate waves

            // 4. Write the JSON text parameters into the Python connection stream
            byte[] inputBytes = jsonPayload.getBytes(StandardCharsets.UTF_8);
            pythonOutputStream = connection.getOutputStream();
            pythonOutputStream.write(inputBytes, 0, inputBytes.length);
            pythonOutputStream.flush();
            pythonOutputStream.close(); // Flush and close to signal request completion

            // 5. Read the response from Python
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                
                // Set the browser header to play uncompressed WAV files natively
                response.setContentType("audio/wav");
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

                // 6. Direct Binary Pipe: Stream audio bytes directly back to javascript
                pythonInputStream = connection.getInputStream();
                browserOutputStream = response.getOutputStream();

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = pythonInputStream.read(buffer)) != -1) {
                    browserOutputStream.write(buffer, 0, bytesRead);
                }
                browserOutputStream.flush();
                
            } else {
                // If Python errors out, read the string error response for debugging logs
                System.err.println("Python API Error Response Code: " + responseCode);
                response.sendError(HttpServletResponse.SC_BAD_GATEWAY, "Python model failed to execute generation sequence.");
            }

        } catch (Exception e) {
            System.err.println("Fatal exception in POST Audio Bridge Pipeline: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Audio generation route offline");
        } finally {
            // 7. Securely release connection streams to prevent system freeze ups
            if (pythonInputStream != null) { try { pythonInputStream.close(); } catch (IOException ignored) {} }
            if (browserOutputStream != null) { try { browserOutputStream.close(); } catch (IOException ignored) {} }
            if (connection != null) { connection.disconnect(); }
        }
    }
}
