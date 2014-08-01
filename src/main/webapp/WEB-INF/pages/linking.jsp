
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>


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
    <form:radiobutton path="curator" name="feedbacking" value="no" id="Interview"/><label for="Interview">Interview</label>
    <form:radiobutton path="curator" name="feedbacking" value="yes" id="Curating"/><label for="Curating">Curating</label>
</div>
        <form:select path="students" multiple="true" class="linkingL">
            <c:forEach items="${students}" var="student">
                <form:option value="${student.login}">${student.firstName} ${student.secondName}</form:option>
            </c:forEach>
        </form:select>

<ul class="nav nav-tabs nav-stacked" role="tablist" style="float:left;">

    <%pageContext.setAttribute("isActive", "active");%>

    <c:forEach items="${technologies}" var="tech">
        <li class="${isActive}">
            <a href="#${tech}" role="tab" data-toggle="tab">${tech}</a>
        </li>
        <%pageContext.setAttribute("isActive", "");%>
    </c:forEach>


</ul>



<div class="tab-content" style="overflow: auto">

            <%pageContext.setAttribute("isActive", "active");%>

    <c:forEach items="${feedbackerMap}" var="tech">
    <div class="tab-pane ${isActive}" id="${tech.key}">
        <form:select path="feedbackers" multiple="true" class="linkingR">
            <c:forEach items="${tech.value}" var="feed">
                <form:option value="${feed.login}">${feed.firstName} ${feed.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>
            <%pageContext.setAttribute("isActive", "");%>
    </c:forEach>



    <div class="button">
        <div>
            <form:button  class="button">Link</form:button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>
    </div>
</form:form>
</body>
</html>

<%--
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
        </select>--%>