<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <%--<a href="<c:url--%><%--">--%>
    <img src="/resources/images/account.png" class="account_logo">
    </a>

    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>

</div>
<form class="loginAndCreateForm" >

    <h1>Account Form <%--<c:out value="${pageContext.request.requestURL}" />--%></h1>

    <p>
        <label for="lastname">Lastname:</label>
        <input class="field" type="text" id="lastname" value="Ivanov ${account}" readonly>
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
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
            <button type="submit"  class="loginAndCreateButton">Change</button>
        </div>
    </div>
</form>
</body>

</html>