<html>
<head>
  <title>Login</title>
  <!--[if lt IE 9]>
  <script
  src="html5shiv.js">
  </script>
  <![endif]-->
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/styles/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>
    
	<div class="hat">
		<img src="/resources/images/exadel-logo.png" class="/resources/exadel_logo">
	</div>
	<form method="post" action="Login" class="loginAndCreateForm" >
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
            <div class="conteiner">
			    <button type="submit" class=" btn-success btn-sm " >Login</button>
            </div>
		</p>
	</form>
</body>

</html>