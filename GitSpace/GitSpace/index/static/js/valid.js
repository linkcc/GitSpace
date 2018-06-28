function validate() {
	var pw1 = document.getElementById("js_pw1").value;
	var pw2 = document.getElementById("js_pw2").value;
	if(pw1 != "") {
		if(pw1 == pw2) {
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var em = document.getElementById("js_email").value;
			if(filter.test(em)){
				return true;
			}
			else{
				alert("邮箱格式错误");
				return false;
			}	
		}
		else {
			alert("两次密码不同");
			return false;
			}	
	}
	else {
		alert("输入密码为空");
		return false;
	}
}
