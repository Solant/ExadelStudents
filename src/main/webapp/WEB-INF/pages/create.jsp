<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
  <title>Create</title>
    <%-- <link href="/resources/styles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="/resources/styles/style.css" />
     <script src="/resources/styles/bootstrap/js/jquery.js"></script>
     <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>--%>
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
</head>
<body>

	<div class="hat">
	<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
	<img src="/resources/images/account.png" class="account_logo">
        <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
        <span class="currUserName"><c:out value="${account}"></c:out></span>

    </div>
    <div class="loginAndCreateForm">
	<form id="Create" class="createForm" action="/worker/createUser/" method="post">
	
		<h1>Adding user Form </h1>
	
		<fieldset id="createFormSet">	
			<p>
				<label for="login">Login:</label>
				<input type="text" id="login" class="field">
			</p>
			
			<p>
				<label for="password">Password:</label>
				<input type="password" id="password" class="field">
			</p>
			<p>
				<label for="person">User's post:</label>
				<select id="person" class="field">
					<option>Student</option>
					<option>Feedbacker</option>
					<option>Personnel officer</option>
				</select>
			</p>
		</fieldset>
	
		
		
		<p>
			<label for="firstname">Firstname:</label>
			<input type="text" id="firstname" name="firstname" class="field">
		</p>
		
		<p>
			<label for="secondname">Secondname:</label>
			<input type="text" id="secondname" class="field">
		</p>
		
		
		<p>
			<label for="lastname">Lastname:</label>
			<input type="text" id="lastname" class="field">
		</p>
			

		
		<div class="button" style="margin-top: 0px">

            <form>
                <button formmethod="get" formaction="/worker" type="submit" class="button">Cancel</button>
            </form>
                    <button form="Create" type="submit" class="button">Create</button>

            </div>

	</form>
    </div>
</body>

</html>