/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById('normalForm').addEventListener('submit', function(event) {

    let password = document.getElementById('password').value;
    let confirmPassword = document.getElementById('confirmPassword').value;
    let OTP = document.getElementById('OTP');
    let TOTP = document.getElementById('trueOTP');
    let errorMessage = document.getElementById('error-message');

    if (password !== confirmPassword) {
        errorMessage.style.display = 'block';
        event.preventDefault();
    } else if(OTP !== TOTP) {
        errorMessage.style.display = 'block';
        event.preventDefault();
    }   else
        errorMessage.style.display = 'none';
});

