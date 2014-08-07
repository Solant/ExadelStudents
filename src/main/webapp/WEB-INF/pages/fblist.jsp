
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/FBhat.jsp" %>

</div>
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
                    <td><a href="/curator/${account}/showFeedback/${name.studentLogin}/${feedbackerRole}">${name.studentName}</a></td>
                    <td>${name.date}</td>
                    <td>${name.feedbackerName}</td>
                </tr>
            </c:forEach>
                <%--<tr>
                    <td><a href="/curator/${account}/addFeedback/${feedbackerRole}">Ivanov Ivan</a></td>
                    <td>23.07.2013</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="/curator/${account}/addFeedback/${feedbackerRole}">Ivanov Alex</a></td>
                    <td>23.07.2014</td>
                    <td>Interviewer</td>
                </tr>--%>
                <%--<tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2014</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Alex</a></td>
                    <td>23.07.2013</td>
                    <td>Feedbacker</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2014</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2013</td>
                    <td>Feedbacker</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2014</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Alex</a></td>
                    <td>23.07.2013</td>
                    <td>Feedbacker</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2014</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2014</td>
                    <td>Feedbacker</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Alex</a></td>
                    <td>23.07.2013</td>
                    <td>Curator</td>
                </tr>--%>
            </tbody>
        </table>
</div>
</body>
</html>
