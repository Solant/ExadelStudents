<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Student's page</title>
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
            $('#reviewsTable').dataTable();
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
                    <li>
                        <button formaction="/admin/createNotif" class="btn">
                            <img src="/resources/images/message1.png" class="adminMenuImages">
                            <span>Create notification</span>
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
                        <a href="<c:url value="/admin"/> ">
                            <img src="/resources/images/loupe.png" class="account_logo">
                        </a>
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

</form>
</div>



<div align="center">
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="${currentUser.firstname}"></c:out>
        <c:out value="${currentUser.lastname}"></c:out>
    </div>
    <a href="/admin/studentPage/${currentUser.login}/notif">
        <div class="message">
        </div>
    </a>

    <ul class="nav nav-tabs" role="tablist">

        <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groups}" var="groupName">
            <li class="${isActive}">
                <a href="#${groupName}" role="tab" data-toggle="tab">${groupName}</a>
            </li>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>


    </ul>


    <form:form commandName="groupedValues" class="spoilers">

    <div class="tab-content">

            <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
        <div class="tab-pane ${isActive}" id="${groupedValues.valuesArray[index1.count-1].gavs[0].getGroup()}">
            <!-- Petya -->
            <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
            <div class="group">
                <label >${attr.attribute} </label>
                <form:checkbox  path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].show" value="yes" cssStyle="width: 20px"/>
                <c:if test="${attr.type == 'text'}">
                    <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                </c:if>
                <c:if test="${attr.type == 'textarea'}">
                    <form:textarea path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                </c:if>
                <form:input hidden="true" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute" />
            </div>
            </c:forEach>
                <button formmethod="post" formaction="/admin/studentPage/${currentUser.login}/saveChanges" type="submit" >Save</button>

        </div>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>
        <button formaction="/admin/studentPage/${currentUser.login}/formTable" type="submit" >Form table</button>
                </div>
                </form:form>
    </body>
</html>

