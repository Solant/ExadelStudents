
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account</title>
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

    <h1>Account Form</h1>

    <p>
        <span>Lastname:</span> <span class="field">Ivanov</span>
    </p>

    <p>
        <span>Firstname:</span> <span class="field"> Ivan</span>
    </p>


    <fieldset id="createFormSet">
        <p>
            <label for="oldPassword">Password:</label>
            <input type="password" id="oldPassword" class="field">
        </p>

        <p>
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" class="field">
        </p>

        <p>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" class="field">
        </p>
    </fieldset>


    <div class="allignCenter">
        <div>
            <input type="submit" value="Change" class="loginAndCreateButton">
            <input type="submit" value="Cancel" class="loginAndCreateButton">
        </div>
    </div>
</form>
</body>

</html>