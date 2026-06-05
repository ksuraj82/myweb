

function initializeNavigation() {
	
	var pageprev = document.getElementById('pageprev');
	console.log('pageprev');
	
	pageprev.addEventListener("click", function() {
	    window.location.href = "2"
		});

}
// Run the function when the page loads
window.onload = initializeNavigation;