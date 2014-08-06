<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>

  <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
</head>
<body>
    <nav class="navbar navbar-blue navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
	<form method="post" action="/j_spring_security_check" class="loginAndCreateForm" >
		<h1>Login Form </h1>
        <p class="errorText">
            <c:out value="${error}"></c:out>
        </p>
		<p>
            <label for="login">Login:</label>
			<input type="text" name="j_username" class="field" id="login" value="admin" placeholder="Login">
		</p>
		<p>
            <label for="password">Password:</label>
			<input type="password"  name= "j_password" class="field" id="password" value="123" placeholder="Password">
		</p>
        <p>
            <label for="remember">Remember Me</label>
            <input type="checkbox" name="_spring_security_remember_me" id="remember">
        </p>
		<div class="alignCenter">
			<input type="submit" class="blue" value="Login">
        </div>
	</form>
</body>

</html>