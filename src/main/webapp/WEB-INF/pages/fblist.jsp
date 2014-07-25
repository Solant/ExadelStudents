
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
<div class="hat">
    <img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="<c:url value="/account"/> ">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>
    <img src="/resources/images/loupe.png" class="loupe_logo">

    <%--<span class="bookmarks">
        <a href="<c:url value="/curator/myStudents"/> "> My Students </a>
    </span>--%>
    <a href="<c:url value="/curator/myStudents"/> ">
        <button  class="btn">
            <span>My Students</span>
        </button>
    </a>

    <%--<a href="<c:url value="/curator/allStudents"/> ">
        <button  class="btn">
            <span>All Students</span>
        </button>
    </a>--%>

    <a href="<c:url value="/curator/interview"/> ">
        <button  class="btn">
            <span>Interviews</span>
        </button>
    </a>
    <%--<span class="bookmarks">
        <a href="<c:url value="/curator/allStudents"/> "> All Students </a>
    </span>
    <span class="bookmarks">
        <a href="<c:url value="/curator/interview"/> "> Interviews  </a>
    </span>--%>


</div>
<div id="table">
        <table id="fblist" border="1px">
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
                <tr>
                    <td><a href="review.jsp">Ivanov Ivan</a></td>
                    <td>23.07.2013</td>
                    <td>Curator</td>
                </tr>
                <tr>
                    <td><a href="review.jsp">Ivanov Alex</a></td>
                    <td>23.07.2014</td>
                    <td>Curator</td>
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
                </tr>
            </tbody>
        </table>
</div>
</body>
</html>
