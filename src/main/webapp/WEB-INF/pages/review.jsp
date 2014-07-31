
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


<div class="hat">
    <img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="<c:url value="/account"/> ">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>
    <img src="/resources/images/loupe.png" class="loupe_logo">

    <span class="bookmarks"> <a href="fblist.jsp"> My Students </a> </span>
    <span class="bookmarks"> <a href="fblist.jsp"> All Students </a> </span>
    <span class="bookmarks">  <a href="fblist.jsp"> Interviews  </a> </span>


</div>
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
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
            <button type="submit" class="loginAndCreateButton">Create</button>
        </div>

</form:form>
</body>
</html>