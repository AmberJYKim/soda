//회원가입 javascript
$(function(){
	
    //로그인%회원가입 기능
    var signUpButton = document.getElementById('signUp');
    var signInButton = document.getElementById('signIn');
    var container = document.getElementById('login_container');
    console.log('signUpButton='+signUpButton);
    signUpButton.addEventListener('click', function(event) {
        login_container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', function(event) {
        login_container.classList.remove("right-panel-active");
    });
});