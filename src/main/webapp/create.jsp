<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create</title>
  <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
</head>
<body>
    
	<div class="hat">
	<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
	<img src="/resources/images/account.png" class="account_logo">
	<img src="/resources/images/exit.png" class="exit_logo">
	<span class="currUserName"> Username </span>
			
</div>
	<form class="loginAndCreateForm" >
	
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
            <label for="lastname">Lastname:</label>
            <input type="text" id="lastname" class="field">
        </p>
		
		<p>
			<label for="firstname">Firstname:</label>
			<input type="text" id="firstname" class="field">
		</p>

        <div class="allignCenter">
            <div>
			    <input type="submit" class="loginAndCreateButton" value="Create">
                <input type="submit" class="loginAndCreateButton" value="Cancel">
		    </div>
        </div>
		
	</form>
</body>

</html>