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

	window.speechSynthesis.cancel();

	// 2. Create the speech object with your sentence
	const utterance = new SpeechSynthesisUtterance(phraseText);

	// 3. Configure natural voice settings for children
	utterance.lang = 'en-US';  // Clear American English accent
	utterance.rate = 0.8;      // 10% slower than normal for easy listening
	utterance.pitch = 1.1;     // Friendly, slightly warmer tone

	// 4. Play the full sentence instantly
	window.speechSynthesis.speak(utterance);
}

// Keep your showPlaybackFallbackButton(audioElement) function active below this 
// if you want to handle Chrome's native touch-to-unlock audio policy!




//To load the function once the page is loaded:
window.onload = speakPhrase;