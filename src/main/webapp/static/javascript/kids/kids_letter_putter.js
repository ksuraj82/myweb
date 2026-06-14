/**
 * 
 */

function speakPhrase(phraseText, event) {
    // 1. Stop any page reloads or link jumps
    if (event && typeof event.preventDefault === 'function') {
        event.preventDefault();
    }

    // 2. Clear out empty inputs
    if (typeof phraseText !== 'string' || phraseText.trim() === "") {
        console.warn("Blocked empty audio request.");
        return;
    }

    console.log(`Sending text to Puter AI: "${phraseText}"`);

    // 3. Call Puter's free Text-to-Speech directly in the browser
    puter.ai.txt2speech(phraseText, testMode= true)
        .then((audio) => {
            // Puter returns a standard HTML5 Audio object automatically
            audio.play()
                .then(() => {
                    console.log("Audio track playing successfully via Puter!");
                })
                .catch((playError) => {
                    console.warn("Autoplay block. Showing standard backup button...", playError);
                    // Call your fallback UI button if Chrome blocks instant sound
                    showPlaybackFallbackButton(audio);
                });
        })
        .catch((error) => {
            console.error('Puter AI Engine Error:', error);
        });
}

// Keep your showPlaybackFallbackButton(audioElement) function active below this 
// if you want to handle Chrome's native touch-to-unlock audio policy!




//To load the function once the page is loaded:
window.onload = speakPhrase;