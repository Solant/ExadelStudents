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
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Login Form </h1>
                </div>
            </div>
            <p>
                <div class="row">
                    <div class="col-lg-6">
                            <span>Login:</span>
                    </div>
                    <div class="col-lg-6">
                        <input type="text"  name= "login" class="field" >
                    </div>
                </div>
            </p>
            <p>
            <div class="row">
                <div class="col-lg-6">
                     <span>Password:</span>
                </div>
                <div class="col-lg-6">
                    <input type="password"  name= "password" class="field">
                </div>
            </div>
            </p>
            <p>
            <div class="row">
                <div class="col-lg-12">
                    <div class="container">
                        <input type="submit" id="loginAndCreateButton" value="Login">
                    </div>
                </div>
            </div>
            </p>
        </div>
	</form>

</body>

</html>