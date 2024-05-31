document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('normalForm');
    form.addEventListener('submit', function(event) {
        var trueOTP = document.getElementById('trueOTP').value;
        var userOTP = document.getElementById('OTP').value;
        var otpErrorMessage = document.getElementById('otp-error-message');

        if (userOTP !== trueOTP) {
            otpErrorMessage.style.display = 'block';
            event.preventDefault(); // Prevent form submission
        } else {
            otpErrorMessage.style.display = 'none';
        }
    });
});