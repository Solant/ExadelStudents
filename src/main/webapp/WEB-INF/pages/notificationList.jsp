<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <title>Notification list</title>
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
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm dd.MM.yyyy");
    pageContext.setAttribute("sdf", sdf);
%>

<div align="center" id="table">

    <h2>Notifications of ${name}</h2>

    <table id="messageTable" class="display">
        <thead>
        <td>Subject</td>
        <td>Sender</td>
        <td class="sorting_desc">Date when sent</td>
        <c:if test="${role == 'ADMIN' || role=='WORKER'}">
            <td>
                Date when read
            </td>
        </c:if>

        </thead>
        <tbody>
        <c:forEach items="${notifs}" var="notif">
            <tr>
                <td>
                    <a href="/notif/${notif.id}" class="<c:if test="${!notif.read}">unreadNotif</c:if>">${notif.title}</a>
                </td>
                <td>
                    ${notif.sender}
                </td>
                <td>
                    ${sdf.format(notif.timeWhenSent.time)}
                </td>

                <c:if test="${role == 'ADMIN'|| role=='WORKER'}">
                    <td>
                            ${sdf.format(notif.timeWhenRead.time)}
                    </td>
                </c:if>
            </tr>
        </c:forEach>


        </tbody>
    </table>

</div>

</body>
</html>