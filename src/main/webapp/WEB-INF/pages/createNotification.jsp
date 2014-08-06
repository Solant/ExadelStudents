<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Create Letter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-blue navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search Student">
                </div>
            </form>
            <form method="get">
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Actions
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <li>
                                <button formaction="/admin/returnCreate" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add User</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/showLinkStudent" class="btn">
                                    <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                                    <span>Link Student</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/showDisabled" class="btn">
                                    <img src="/resources/images/fired.png" class="adminMenuImages">
                                    <span>Disabled Students</span>
                                </button>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/createNotif" class="btn">
                                    <img src="/resources/images/message1.png" class="adminMenuImages">
                                    <span>Create notification</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add new Field</span>
                                </button>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/" class="btn">
                                    <img src="/resources/images/loupe.png" class="adminMenuImages">
                                    <span>Filtration</span>
                                </button>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="/notif">
                            <div class="message">
                                <c:if test="${notifNumber > 0}">
                                <span>
                                        ${notifNumber}
                                </span>
                                </c:if>
                            </div>
                        </a>
                    </li>
                    <li>
                        <span class="currUserName"><c:out value="${account}"></c:out></span>
                    </li>

                    <li>
                        <a href="<c:url value="j_spring_security_logout" />">
                            <img src="/resources/images/exit.png" class="exit_logo">
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/account"/> ">
                            <img src="/resources/images/account.png" class="account_logo">
                        </a>
                    </li>
                </ul>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="notifPadding">
    <form:form commandName="createNotifUnit" action="/admin/sendNotif" method="post" class="createNotificationForm">

        <div class="leftList">
            <form:checkbox path="forStudents" id="students"/>
            <label for="students">Students: </label><br/>
                <form:select path="students" name="students" multiple="true">
                    <c:forEach items="${students}" var="student">
                        <form:option value="${student.login}">${student.firstName} ${student.secondName}</form:option>
                    </c:forEach>
                </form:select>
        </div>

        <div class="centerList">
            <form:checkbox path="forFeedbackers" id="feedbackers"/>
            <label for="feedbackers">Feedbackers: </label><br/>
            <form:select path="feedbackers" name="feedbackers" multiple="true">
                <c:forEach items="${feedbackers}" var="feedbacker">
                    <form:option value="${feedbacker.login}">${feedbacker.firstName} ${feedbacker.secondName}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="rightList">
            <form:checkbox path="forWorkers" id="workers"/>
            <label for="workers">Workers: </label><br/>
            <form:select path="workers" name="workers" multiple="true">
                <c:forEach items="${workers}" var="worker">
                    <form:option value="${worker.login}">${worker.firstName} ${worker.secondName}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="subject"><form:input path="title" type="text" id="subject" value="Subject"/></div>
        <div class="letterText">
            <form:textarea path="text" name="text" id="text" cols="30" rows="10"/>
        </div>

        <div class="alignCenter">
            <form:button type="submit" class="loginAndCreateButton">Send</form:button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>
    </form:form>
</div>
</body>
</html>