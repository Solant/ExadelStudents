<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>

<div id="table">
    <table id="fblist" class="display">
        <thead>
        <tr>
            <td rowspan="2">Name</td>
            <td colspan="2">Last review</td>
        </tr>
        <tr>
            <td>Date</td>
            <td>Feedbacker</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${studentList}" var="name">
            <tr>
                <td>
                    <a href="/curator/showFeedback/${name.studentLogin}/${feedbackerRole}">${name.studentName}</a>
                </td>
                <td>${name.date}</td>
                <td>${name.feedbackerName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
