<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="message">
            <span>
                1
            </span>
                    </div>
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="notifPadding">
    <form class="createNotificationForm">

        <div class="leftList">
            <input type="checkbox" id="students"/>
            <label for="students">Students: </label><br/>
                <select name="students" multiple>
                    <option value="A">A</option>
                    <option value="A">A</option>
                    <option value="A">A</option>
                    <option value="A">A</option>
                    <option value="A">A</option>
                    <option value="A">A</option>
                    <option value="A">A</option>
                </select>
        </div>

        <div class="centerList">
            <input type="checkbox" id="feedbackers"/>
            <label for="feedbackers">Feedbackers: </label><br/>
            <select name="feedbackers" multiple>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
            </select>
        </div>

        <div class="rightList">
            <input type="checkbox" id="workers"/>
            <label for="workers">Workers: </label><br/>
            <select name="workers" multiple>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
                <option value="A">A</option>
            </select>
        </div>

        <div class="subject"><input type="text" id="subject" value="Subject"/></div>
        <div class="letterText">
            <textarea name="text" id="text" cols="30" rows="10"></textarea>
        </div>

        <div class="alignCenter">
            <button type="submit" class="loginAndCreateButton">Send</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>