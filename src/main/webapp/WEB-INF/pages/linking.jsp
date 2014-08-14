<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
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

<form class="linkingForm">
    <h1>Linking form</h1>
    <div class="radio">
        <form:radiobutton path="linkUnit.curator" name="feedbacking" value="true" id="suitable"/>
        <label for="suitable">Curating</label>
        <form:radiobutton path="linkUnit.curator" name="feedbacking" value="false" id="unsuitable"/>
        <label for="unsuitable">Interview</label>
    </div>
    <div class="linkingL">
        <label for="students">Students</label><br/>

        <form:select path="linkUnit.students" id="students" multiple="true">
            <c:forEach items="${students}" var="student">
                <form:option value="${student.login}">${student.firstName} ${student.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="linkingR">
        <label for="feedbackers">Feedbackers</label><br/>
        <form:select multiple="true" id="feedbackers" path="linkUnit.feedbackers">
            <c:forEach items="${feedbackers}" var="feed">
                <form:option value="${feed.login}">${feed.firstName} ${feed.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="technology">
        <label for="techList">Technology:</label><br/>
        <form:select name="technology" id="techList" path="linkUnit.technology">
            <form:option value="Any"></form:option>
            <c:forEach items="${technologies}" var="tech">
                <form:option value="${tech.technologyName}">${tech.technologyName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="buttons">
        <button class="gray" onclick="history.back(); return false;">Cancel</button>
        <button class="blue" formmethod="post" formaction="/admin/linkStudent">Link</button>
    </div>

</form>
</body>
</html>
