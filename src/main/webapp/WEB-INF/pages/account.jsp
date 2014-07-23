
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
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
        <label for="lastname">Lastname:</label>
        <input class="field" type="text" id="lastname" value="Ivanov" readonly>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <input class="field" type="text" id="firstname" value="Ivan" readonly>
    </p>


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


    <div class="allignCenter">
        <div>
            <input type="submit" value="Change" class="loginAndCreateButton">
            <input type="submit" value="Cancel" class="loginAndCreateButton">
        </div>
    </div>
</form>
</body>

</html>