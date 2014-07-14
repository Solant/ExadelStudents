<html>
<head>
  <title>Login</title>
  <!--[if lt IE 9]>
  <script
  src="html5shiv.js">
  </script>
  <![endif]-->
  <link rel="stylesheet" type="text/css" href="styles/style.css" />
</head>
<body>
    
	<div class="hat">
		<img src="images/exadel-logo.png" class="exadel_logo">
	</div>
	<form method=post action="login" class="loginAndCreateForm" >
		<h1>Login Form </h1>
		<p>
			<span>Login:</span>
			<input type="text"  name= "login" class="field" >
		</p>
		<p>
			<span>Password:</span>
			<input type="password"  name= "password" class="field">
		</p>
		<p>
			<input type="submit" id="loginAndCreateButton" value="Login">
		</p>
	</form>
</body>

</html>