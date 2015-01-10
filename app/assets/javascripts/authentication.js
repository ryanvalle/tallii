$(document).ready(function() {
	$('#login-form-btn').click(function() {
		$('.login-form .auth-btn').remove();
		$('#tallii-login-form').show();
	})

	$('#register-form-btn').click(function() {
		$('.login-form .auth-btn').remove();
		$('#tallii-register-form').show();
	})

})