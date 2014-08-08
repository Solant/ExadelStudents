
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin | Student's account</title>
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


</div>
<div id="table">
    <h2>Feedbacks of ${review.student.firstname} ${review.student.lastname}</h2>
<table id="fblist" class="display">
<thead>
<tr>
    <td>Date</td>
    <td>Feedbacker</td>
</tr>
</thead>
<tbody>
<c:forEach items="${reviews}" var="review">
    <tr>
        <td><a href="/admin/showFeedback/${review.student.login}/${review.id}">${review.date.time}</a></td>
        <td>${review.feedbacker.firstName}</td>
    </tr>
</c:forEach>
    </tbody>
    </table>
    </div>
</body>
</html>