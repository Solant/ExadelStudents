<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <title>Notification</title>
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

<div class="notifPadding">
    <div class="notification">

        <h2>${notif.title}</h2>
        <h3>Dear ${notif.user.firstName} ${notif.user.secondName}</h3>

        <div class="text">
            <p>
               <c:out escapeXml="false" value =" ${notif.text}"></c:out>
            </p>
        </div>

        <span class="date">
            ${notif.timeWhenSent.time}
        </span>

        <span class="sender">
            ${notif.sender}
        </span>

    </div>
</div>
</body>
</html>