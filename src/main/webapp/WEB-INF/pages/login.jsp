<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <!--[if lt IE 9]>
  <script
  src="html5shiv.js">
  </script>
  <![endif]-->

  <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
</head>
<body>
    
	<div class="hat">
		<img src="/resources/images/exadel-logo.png" class="exadel_logo">
	</div>
	<form method="post" action="/j_spring_security_check" class="loginAndCreateForm" >
		<h1>Login Form </h1>
		<p>
            <label for="login">Login:</label>
			<input type="text" name="j_username" class="field" id="login">
		</p>
		<p>
            <label for="password">Password:</label>
			<input type="password"  name= "j_password" class="field" id="password">
		</p>
        <p>
            <label for="remember">Remember Me</label>
            <input type="checkbox" name="_spring_security_remember_me" id="remember">
        </p>
		<div class="allignCenter">
			<input type="submit" class="loginAndCreateButton" value="Login">
        </div>
	</form>
</body>

</html>