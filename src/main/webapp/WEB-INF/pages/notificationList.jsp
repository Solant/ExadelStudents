<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Notification list</title>
    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/StudentHat.jsp" %>

<div align="center" id="table">

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
                    ${notif.timeWhenSent.time}
                </td>

                <c:if test="${role == 'ADMIN'|| role=='WORKER'}">
                    <td>
                            ${notif.timeWhenRead.time}
                    </td>
                </c:if>
            </tr>
        </c:forEach>


        </tbody>
    </table>

</div>

</body>
</html>



<%--<tr>
                <td><a href="">Session</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Alert</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Session</a></td>
                <td>Admin</td>
                <td>30.07.2014</td>
            </tr>
            <tr>
                <td><a href="">Session</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Alert</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Session</a></td>
                <td>Admin</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Alert</a></td>
                <td>System</td>
                <td>30.07.2014</td>
            </tr>
            <tr>
                <td><a href="">Session</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>
            <tr>
                <td><a href="">Session</a></td>
                <td>System</td>
                <td>30.07.2013</td>
            </tr>--%>