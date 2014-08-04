<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
  <title>Create</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
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

    <form:form commandName="newUser" cssClass="loginAndCreateForm" action="/admin/createUser" method="post">
		<h1>Adding user Form </h1>

            <p>
				<label for="login">Login:</label>
				<form:input path="login" type="text" name="login" id="login" class="field" />
			</p>
			
			<p>
				<label for="password">Password:</label>
				<form:input path="password" type="password" id="password" class="field" />
			</p>


			<p>
				<label for="person">User's post:</label>
				<form:select path="role" id="person" class="field">
                    <form:option value="Student">Student</form:option>
                    <form:option value="Feedbacker">Feedbacker</form:option>
                    <form:option value="Admin">Admin</form:option>
                </form:select>
			</p>
      <%--  <p>
            <label for="person">User's status:</label>
            <form:select path="role" id="person" class="field">
                <form:option value="WORKING">Working</form:option>
                <form:option value="STUDYING">Studying</form:option>
            </form:select>
        </p>--%>

        <p>
            <label for="lastname">Lastname:</label>
            <form:input path="lastname" type="text" id="lastname" class="field" />
        </p>
		
		<p>
			<label for="firstname">Firstname:</label>
			<form:input path="firstname" type="text" id="firstname" class="field" />
		</p>

            <div class="alignCenter">
                <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
			    <button type="submit" class="loginAndCreateButton">Create</button>
		     </div>
		
	</form:form>
</body>

</html>