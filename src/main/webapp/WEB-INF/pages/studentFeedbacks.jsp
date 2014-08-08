
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

<%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>

<div id="table">
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

