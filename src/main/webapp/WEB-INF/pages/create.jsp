<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
    <title>Create</title>

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
<sec:authorize access="hasRole('ROLE_ADMIN')">
<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#user" role="tab" data-toggle="tab">User</a>
    </li>
    <li>
        <a href="/admin/showAddField/true">Field</a>
    </li>
    <li>
        <a href="/admin/showAddField/false">Technology</a>
    </li>
    <li>
        <a href="/admin/createNotif">Notification</a>
    </li>
</ul>
</sec:authorize>


<div class="tab-content" align="center">

    <div class="tab-pane active" id="user">
        <form:form commandName="newUser" cssClass="spoilers" action="/admin/addUser" method="post">
        <h1>Adding user Form </h1>

        <p class="errorText">
            <form:errors path="*"/>
        </p>

        <p>
            <label for="login">Login:</label>
            <form:input path="login" type="text" name="login" id="login" class="field"/>
        </p>

        <p>
            <label for="password">Password:</label>
            <form:input path="password" type="password" id="password" class="field"/>
        </p>


        <p>
            <label for="person">User's post:</label>
            <form:select path="role" id="person" class="field">
                <form:option value="Student">Student</form:option>
                <form:option value="Feedbacker">Feedbacker</form:option>
                <form:option value="HRWorker">HR worker</form:option>
                <sec:authorize access="hasRole('ROLE_ADMIN')"><form:option value="Admin">Admin</form:option></sec:authorize>
            </form:select>
        </p>
            <%--  <p>
                  <label for="person">User's status:</label>
                  <form:select path="role" id="person" class="field">
                      <form:option value="WORKING">Working</form:option>
                      <form:option value="STUDYING">Studying</form:option>
                  </form:select>
              </p>--%>

        <p>
            <label for="lastname">Lastname:</label>
            <form:input path="lastname" type="text" id="lastname" class="field"/>
        </p>

        <p>
            <label for="firstname">Firstname:</label>
            <form:input path="firstname" type="text" id="firstname" class="field"/>
        </p>

        <div class="alignCenter">
            <button class="gray" onclick="history.back(); return false;">Cancel</button>
            <button type="submit" class="blue">Create</button>
        </div>

        </form:form>
</body>

</html>