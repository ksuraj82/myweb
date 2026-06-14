/**
 * 
 */

let number1 = 0;
let number2= 0;
let answer = 0;
let output = 0;


function getRandomNumber (min,max) {
	return Math.floor(Math.random() * (max-min+1)) + min;
}

function generateNewQuestion(){
	number1 = getRandomNumber(1,100);
	number2 = getRandomNumber(1,100);
		document.getElementById('num1').innerHTML= number1;
		document.getElementById('num2').innerHTML= number2;
		
		answer = document.getElementById('userAnswer').value="";
		output = document.getElementById('feedback').innerHTML= "";
		
	
}


function checkAnswer (){
	
	let actualAnswer = number1+number2;
	
	let answer = document.getElementById('userAnswer').value;
	
	let output = document.getElementById('feedback');
	
	if(answer == actualAnswer){
		output.innerHTML = "Corrent Answer. Try next";
		output.style.color = "green";
		setTimeout(generateNewQuestion, 2000); 
	}
	else {
		output.innerHTML = "Wrong Answer. Try again";
		output.style.color = "red";
	}
	
}

//To load the function once the page is loaded:
window.onload = generateNewQuestion;