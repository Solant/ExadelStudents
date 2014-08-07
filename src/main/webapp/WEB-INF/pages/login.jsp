<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/EmptyHat.jsp" %>

	<form method="post" action="/j_spring_security_check" class="loginAndCreateForm" >
		<h1>Login Form </h1>
		<p>
            <label for="login">Login:</label>
			<input type="text" name="j_username" class="field" id="login" value="admin">
		</p>
		<p>
            <label for="password">Password:</label>
			<input type="password"  name= "j_password" class="field" id="password" value="123">
		</p>
        <p>
            <label for="remember">Remember Me</label>
            <input type="checkbox" name="_spring_security_remember_me" id="remember">
        </p>
		<div class="alignCenter">
			<input type="submit" class="loginAndCreateButton" value="Login">
        </div>
	</form>
</body>

</html>