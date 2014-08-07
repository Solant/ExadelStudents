<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Notification</title>
    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/StudentHat.jsp" %>

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