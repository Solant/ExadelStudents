<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
    pageContext.setAttribute("sdf", sdf);
%>


</div>
<div id="table">
    <h2>Feedbacks of ${studentName} </h2>
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
        <td><a href="/admin/showFeedback/${review.student.login}/${review.id}">${sdf.format(review.date.time)}</a></td>
        <td>${review.feedbacker.firstName} ${review.feedbacker.secondName}</td>
    </tr>
</c:forEach>
    </tbody>
    </table>
    </div>
</body>
</html>