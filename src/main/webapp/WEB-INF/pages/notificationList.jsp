<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Notification list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.1/css/jquery.dataTables.css">

    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" class="init">
        $(document).ready(function() {
            $('#messageTable').dataTable();
        } );
    </script>

</head>
<body>

<%--<div class="hat">
    <img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="<c:url value="/account"/> ">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>
    <div class="message">
            <span>
                1
            </span>
    </div>
</div>--%>

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

<div align="center" id="table">

    <table id="messageTable" class="display">
        <thead>
        <td>Subject</td>
        <td>Sender</td>
        <td>Date</td>
        </thead>
        <tbody>
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
            </tr>


        </tbody>
    </table>

</div>

</body>
</html>