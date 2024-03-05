/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var x = document.getElementById("login").addEventListener("onclick", login);
var y = document.getElementById("signup").addEventListener("onclick",signup);

function login(){
    x.style.left= "-500px";
    y.style.left = "100px";
}

function signup(){
    x.style.left = "100px";
    y.style.left = "-500px";
}

