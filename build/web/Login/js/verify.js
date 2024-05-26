/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById('OTPcheck').addEventListener('submit', function(event) {

            let inputText = document.getElementById('OTPinput').value;
            let storedText = '<%= OTP %>';
            let errorMessage = document.getElementById('error-message');
            let successMessage = document.getElementById('success-message');

            if (inputText !== storedText) {
                errorMessage.style.display = 'block';
                successMessage.style.display = 'none';
                event.preventDefault(); 
            } else {
            }
        });

