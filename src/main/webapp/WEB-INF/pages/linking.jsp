
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css">
</head>
<body>
<div class="hat">
    <form method="get">
        <img src="/resources/images/exadel-logo.png" class="exadel_logo">
        <a href="<c:url value="/account"/> ">
            <img src="/resources/images/account.png" class="account_logo">
        </a>
        <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
        <span class="currUserName"><c:out value="${account}"></c:out></span>
        <a href="<c:url value="/admin" />"><img src="/resources/images/loupe.png" class="loupe_logo"></a>
        <button formaction="/admin/returnCreate" class="btn">
            <img src="/resources/images/add.png" class="adminMenuImages">
            <span>Add User</span>
        </button>
        <button formaction="/admin/linkStudent" class="btn">
            <img src="/resources/images/yellow-link.png" class="adminMenuImages">
            <span>Link Student</span>
        </button>
    </form>
</div>
<form:form commandName="linkUnit" class="linkingForm" method="post" action="/admin/linkStudent" >
<div class="radio">
    <form:radiobutton path="isCurator" name="feedbacking" value="no" id="Interview"/><label for="Interview">Interview</label>
    <form:radiobutton path="isCurator" name="feedbacking" value="yes" id="Curating"/><label for="Curating">Curating</label>
</div>
        <form:select path="students" multiple="true" class="linkingL">
            <c:forEach items="${linkUnit.students}" var="student">
                <form:option value="${student}">${student}</form:option>
            </c:forEach>
        </form:select>
        <select multiple class="linkingR">
            <option value="A">A</option>
            <option value="A">B</option>
            <option value="A">C</option>
            <option value="A">D</option>
            <option value="A">E</option>
            <option value="A">F</option>
            <option value="A">G</option>
            <option value="A">H</option>
            <option value="A">K</option>
            <option value="A">L</option>
            <option value="A">M</option>
            <option value="A">N</option>
        </select>
    <div class="button">
        <div>
            <button  class="button">Link</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>
    </div>
</form:form>
</body>
</html>