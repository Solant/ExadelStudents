<%@ page import="java.text.SimpleDateFormat" %>
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
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
    pageContext.setAttribute("sdf", sdf);
%>

<div id="table">
    <h3>Reviews of students</h3>
    <table id="curatorReviews" class="display">
        <thead><%--
        <tr>
            <td rowspan="2">Name</td>
            <td colspan="2">Last review</td>
        </tr>--%>
        <tr>
            <td>Name</td>
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
                <td>
                    <c:if test="${name.date != null}">
                        ${sdf.format(name.date)}<%--sdf.format(name.date)--%>
                    </c:if>
                </td>
                <td>${name.feedbackerName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="/resources/js/trAnchors.js"></script>
</body>
</html>
