
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account</title>

    <%@include file="/WEB-INF/pages/allIncluded.jspllIncluded.jsp" %>

</head>
<body>

<%@include file="/WEB-INF/pages/AdminHat.jsps/AdminHat.jsp" %>

<form:form commandName="accountUnit" class="loginAndCreateForm" method="post" action="/changePassword">

    <h1>Account Form</h1>
    <p class="errorText">
        <form:errors path="*" />
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
            <button class="gray" onclick="history.back(); return false;">Cancel</button>
            <button type="submit"  class="blue">Change</button>
        </div>
</form:form>
</body>

</html>