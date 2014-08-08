<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Notification</title>
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

<div class="notifPadding">
    <div class="notification">

        <h2>${notif.title}</h2>

        <div class="text">
            <p>
               ${notif.text}
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