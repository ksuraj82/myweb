/**
 * 
 */

function speakPhrase(phraseText,event) {
	// 1. Force the browser to completely stop any page reloads or jumps
	    if (event && typeof event.preventDefault === 'function') {
	        event.preventDefault();
	    }

	    // 2. Clear out the type loop trap entirely
	    if (typeof phraseText !== 'string' || phraseText.trim() === "") {
	        console.warn("Blocked non-string event fallthrough.");
	        return;
	    }

    const urlParam = encodeURIComponent(phraseText);
    const servletEndpoint = `/generateAudio?phrase=${urlParam}`;
    
    const audioNode = document.getElementById("ttsAudioPlayer");

    if (audioNode) {
        // Set the remote backend source
        audioNode.src = servletEndpoint;
        
        // Modern approach: Track the play function's promise lifecycle
        const playPromise = audioNode.play();

        if (playPromise !== undefined) {
            playPromise
                .then(() => {
                    console.log(`Audio pipeline unlocked! Playing: "${phraseText}"`);
                })
                .catch(error => {
                    console.warn("Autoplay policy blocked instant sound. Displaying standard overlay context...", error);
                    
                    // FALLBACK: If Chrome blocks it, show a tiny temporary floating "Listen" button 
                    // so the kid can click it and force unlock the audio track natively.
                    showPlaybackFallbackButton(audioNode);
                });
        }
    } else {
        console.error("Core Engine Failure: #ttsAudioPlayer node missing from DOM.");
    }
}

// Helper function to handle fallback interactions if Chrome restricts a child action
//function showPlaybackFallbackButton(audioElement) {
//    // Check if a fallback helper button already exists on the screen
//    if (document.getElementById("audioUnlockBtn")) return;
//
//    const btn = document.createElement("button");
//    btn.id = "audioUnlockBtn";
//    btn.innerHTML = "🔊 Tap to Hear Sound";
//    
//    // Position it clearly on top of the layout screen
//    btn.style.position = "fixed";
//    btn.style.top = "20px";
//    btn.style.left = "50%";
//    btn.style.transform = "translateX(-50%)";
//    btn.style.zIndex = "99999";
//    btn.style.backgroundColor = "#ffc107";
//    btn.style.color = "#000";
//    btn.style.border = "none";
//    btn.style.padding = "12px 24px";
//    btn.style.fontSize = "18px";
//    btn.style.borderRadius = "20px";
//    btn.style.cursor = "pointer";
//    btn.style.fontWeight = "bold";
//
//    btn.onclick = function() {
//        audioElement.play();
//        btn.remove(); // Automatically erase the button once the block clears
//    };
//
//    document.body.appendChild(btn);
//}



//To load the function once the page is loaded:
window.onload = speakPhrase;