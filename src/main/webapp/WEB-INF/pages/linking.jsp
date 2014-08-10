<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<c:if test="${role == 'STUDENT'}">
    <%@include file="/WEB-INF/pages/commonParts/StudentHat.jsp" %>
</c:if>
<c:if test="${role == 'CURATOR'}">
    <%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>
</c:if>
<c:if test="${role == 'WORKER'}">
    <%@include file="/WEB-INF/pages/commonParts/HRWhat.jsp" %>
</c:if>
<c:if test="${role == 'ADMIN'}">
    <%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>
</c:if>

<form class="linkingForm">
    <div class="radio">
        <form:radiobutton path="linkUnit.curator" name="feedbacking" value="true" id="suitable"/>
        <label for="suitable">Curating</label>
        <form:radiobutton path="linkUnit.curator" name="feedbacking" value="false" id="unsuitable"/>
        <label for="unsuitable">Interview</label>
    </div>
    <div class="linkingL">
        <label for="students">Students</label><br/>

        <form:select path="linkUnit.students" id="students" multiple="true">
            <c:forEach items="${students}" varStatus="index">
                <form:option value="${studentLogins[index.count-1]}">${students[index.count-1]}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="linkingR">
        <label for="feedbackers">Feedbackers</label><br/>
        <form:select multiple="true" id="feedbackers" path="linkUnit.feedbackers">

        </form:select>
    </div>

    <div class="technology">
        <label for="techList">Technology:</label><br/>
        <form:select name="technology" id="techList" path="linkUnit.technology">
            <form:option value="Any"></form:option>
            <c:forEach items="${technologies}" var="token">
                <form:option value="${token}">${token}</form:option>
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
