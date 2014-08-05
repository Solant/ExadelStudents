
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Review</title>
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


<form:form commandName="review" class="reviewForm" action="/curator/${account}/addFeedback" method="post">
<form:input hidden="true" path="student.login" />
    <form:input hidden="true" path="fromInterview" />
        <div class="alignCenter">
            <h1 >Review Form </h1>
        </div>

        <p>
            <label for="lastname">Lastname:</label>
            <form:input readonly="true" path="student.secondName" class="field" type="text" id="lastname" />
        </p>

        <p>
            <label for="firstname">Firstname:</label>
            <form:input class="field" path="student.firstName" type="text" id="firstname" readonly="true"/>
        </p>
    <p>
        <span>Professional suitability:</span>
        <span class="floatright">
            <form:radiobutton path="suitability"  name="feedbacking" value="yes"  id="suitable" /><label for="suitable">Suitable</label>
            <form:radiobutton path="suitability"  name="feedbacking" value="no" id="unsuitable" /><label for="unsuitable">Unsuitable</label>
        </span>
    </p>
    <p>
        <label for="attitude">Attitude to work:</label>
        <form:input path="workAttitude" type="text" id="attitude" class="field"/>
    </p>

    <p>
        <label for="relations">Relations in the collective:</label>
        <form:input path="teamAttitude" type="text" id="relations" class="field"/>
    </p>

    <p>
        <label for="activities">Progress in activities:</label>
        <form:input path="profProgress" type="text" id="activities" class="field"/>
    </p>

    <p>
        Need more hours:
        <span class="floatright">
            <form:radiobutton path="needMoreHours"  name="hours" value="yes" id="hoursYes"/><label for="hoursYes">Yes</label>
            <form:radiobutton path="needMoreHours" name="hours" value="no" id="hoursNo"/><label for="hoursNo">No</label>
        </span>
    </p>

    <p>
    <label for="project">Working on the project:</label>
          <form:select path="workingOnRealProject" name="project" id="project" class="field">
              <form:option value="yes">Yes</form:option>
              <form:option value="futureYes">Can in future</form:option>
              <form:option value="futureNo">Can't in future</form:option>
          </form:select>
    </p>

        <div class="alignCenter">
            <form:radiobutton path="billable"  name="billable" value="yes" id="bilYes"/>
            <label for="bilYes">Billable</label>
            <form:radiobutton path="billable" name="billable" value="no" id="bilNo"/>
            <label for="bilNo">No Billable</label>
        </div>

        <div class="alignCenter">
            <label for="other">Other:</label><br/>
            <form:textarea path="comment" name="other" id="other" cols="30" rows="10" class="textOther"/>
        </div>

        <div class="alignCenter">
            <button type="submit" class="loginAndCreateButton">Save</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>

</form:form>
</body>
</html>
