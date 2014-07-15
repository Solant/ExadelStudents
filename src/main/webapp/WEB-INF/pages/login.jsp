<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Login</title>
  <!--[if lt IE 9]>
  <script
  src="html5shiv.js">
  </script>
  <![endif]-->
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
</head>
<body>
    
	<div class="hat">
		<img src="/resources/images/exadel-logo.png" class="exadel_logo">
	</div>
	<form method="post" action="/j_spring_security_check" class="loginAndCreateForm" >
		<h1>Login Form </h1>
		<p>
			<span>Login:</span>
			<input type="text" name="j_username" class="field" >
		</p>
		<p>
			<span>Password:</span>
			<input type="password"  name= "j_password" class="field">
		</p>
        <p>
            <span>Remember Me</span>
            <input type="checkbox" name="_spring_security_remember_me">
        </p>
		<p>
			<input type="submit" id="loginAndCreateButton" value="Login">
		</p>
	</form>
</body>

</html>