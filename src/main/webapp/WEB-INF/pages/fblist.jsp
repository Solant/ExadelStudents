
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css">
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.1/css/jquery.dataTables.css">

    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" class="init">
        $(document).ready(function() {
            $('#fblist').dataTable();
        } );
    </script>
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
            <form method="get">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <button formaction="/curator/${account}/myStudents" type="submit" class="btn <c:if test="${feedbackerRole=='asCurator'}">btnActive</c:if>">
                            <span>My Students</span>
                        </button>
                    </li>
                    <li>
                        <button formaction="/curator/${account}/interview" type="submit" class="btn <c:if test="${feedbackerRole=='asInterviewer'}">btnActive</c:if>">
                            <span>Interviews</span>
                        </button>
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
