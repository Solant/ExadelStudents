<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin | Student's account</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<sec:authorize access="hasRole('ROLE_STUDENT')">
    <%@include file="/WEB-INF/pages/commonParts/StudentHat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_CURATOR')">
    <%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_WORKER')">
    <%@include file="/WEB-INF/pages/commonParts/HRWhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>
</sec:authorize>

<form:form commandName="accountUnit" class="loginAndCreateForm" action="/admin/studentPage/${accountUnit.login}/changeCommon" method="post">

    <h1>Account Form</h1>

    <p class="errorText">
        <form:errors path="*"/>
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
        <form:input path="skype" class="field" type="text" id="skype"/>
    </p>

    <p>
        <label for="email">E-mail:</label>
        <form:input path="email" class="field" type="text" id="email"/>
    </p>

    <p>
        <label for="telephone">Telephone:</label>
        <form:input path="telephone" class="field" type="text" id="telephone"/>
    </p>

    <p>
        <label for="newPassword">New Password:</label>
        <form:input path="newPassword" type="password" id="newPassword" class="field"/>
    </p>
    <p>
        <label for="confirmPassword">Confirm Password:</label>
        <form:input path="confirmedPassword" type="password" id="confirmPassword" class="field"/>
    </p>

    <p>
        <label for="status">Status:</label>
        <select id="status" name="status" class="field">
            <option value="WORKING" <c:if test="${status == 'WORKING'}">selected</c:if>>Working</option>
            <option value="STUDYING" <c:if test="${status == 'STUDYING'}">selected</c:if>>Studying</option>
        </select>
    </p>
    <div class="alignCenter">
        <a href="/admin/studentPage/${accountUnit.login}" class="gray">Cancel</a>
        <button type="submit" class="blue">Change</button>
    </div>
</form:form>
</body>

</html>