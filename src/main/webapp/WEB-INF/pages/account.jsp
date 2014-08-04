
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account</title>
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
            <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">




            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/notif">
                        <div class="message">
                            <c:if test="${notifNumber > 0}">
                                <span>
                                        ${notifNumber}
                                </span>
                            </c:if>
                        </div>
                    </a>
                </li>
                <li>
                    <span class="currUserName"><c:out value="${account}"></c:out></span>
                </li>
                <li>
                    <a href="<c:url value="j_spring_security_logout" />">
                        <img src="/resources/images/exit.png" class="exit_logo">
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/account"/> ">
                        <img src="/resources/images/account.png" class="account_logo">
                    </a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<form:form commandName="accountUnit" class="loginAndCreateForm" method="post" action="/changePassword">

    <h1>Account Form</h1>
    <p>
        ${message}
    </p>

    <p>
        <label for="lastname">Lastname:</label>
        <form:input path="secondName" class="field" type="text" id="lastname" readonly="true"/>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <form:input path="firstName" class="field" type="text" id="firstname" readonly="true"/>
    </p>

    <p>
        <label for="skype">Skype:</label>
        <form:input path="skype" class="field" type="text" id="skype" />
    </p>

    <p>
        <label for="email">E-mail:</label>
        <form:input path="email" class="field" type="text" id="email"/>
    </p>

    <p>
        <label for="telephone">telephone:</label>
        <form:input path="telephone" class="field" type="text" id="telephone" />
    </p>


        <p>
            <label for="oldPassword">Password:</label>
            <form:input path="password" type="password" id="oldPassword" class="field"/>
        </p>

        <p>
            <label for="newPassword">New Password:</label>
            <form:input path="newPassword" type="password" id="newPassword" class="field"/>
        </p>

        <p>
            <label for="confirmPassword">Confirm Password:</label>
            <form:input path="confirmedPassword" type="password" id="confirmPassword" class="field"/>
        </p>

        <div class="alignCenter">
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
            <button type="submit"  class="loginAndCreateButton">Change</button>
        </div>
</form:form>
</body>

</html>