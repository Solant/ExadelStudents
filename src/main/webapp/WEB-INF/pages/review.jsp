<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Review</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<sec:authorize access="hasRole('ROLE_STUDENT')">
    <%@include file="/WEB-INF/pages/commonParts/StudentHat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_CURATOR')">
    <%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_WORKER')">
    <%@include file="/WEB-INF/pages/commonParts/HRWhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>
</sec:authorize>

<form:form commandName="review" class="reviewForm" action="/curator/addFeedback" method="post">
    <form:input hidden="true" path="student.login"/>
    <form:input hidden="true" path="fromInterview"/>
    <div class="alignCenter">
        <h1>Review Form </h1>
    </div>

    <p>
        <label for="lastname">Lastname:</label>
        <form:input readonly="true" path="student.secondName" class="field" type="text" id="lastname"/>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <form:input class="field" path="student.firstName" type="text" id="firstname" readonly="true"/>
    </p>

    <p>
        <span>Professional suitability:</span>
        <span class="floatright">
            <form:radiobutton path="suitability" name="feedbacking" value="yes" id="suitable"/><label for="suitable">Suitable</label>
            <form:radiobutton path="suitability" name="feedbacking" value="no" id="unsuitable"/><label for="unsuitable">Unsuitable</label>
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
            <form:radiobutton path="needMoreHours" name="hours" value="yes" id="hoursYes"/><label
                for="hoursYes">Yes</label>
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
        <form:radiobutton path="billable" name="billable" value="yes" id="bilYes"/>
        <label for="bilYes">Billable</label>
        <form:radiobutton path="billable" name="billable" value="no" id="bilNo"/>
        <label for="bilNo">No Billable</label>
    </div>

    <div class="alignCenter">
        <label for="other">Other:</label><br/>
        <form:textarea path="comment" name="other" id="other" cols="30" rows="10" class="textOther"/>
    </div>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_WORKER')">
        <div class="alignCenter">
            Feedbacker: ${review.feedbacker.secondName} ${review.feedbacker.firstName} ,
            email: ${review.feedbacker.email}.
        </div>
    </sec:authorize>

    <div class="alignCenter">
        <button class="gray" onclick="history.back(); return false;">Cancel</button>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="submit" class="blue">Save</button>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_CURATOR')">
            <button type="submit" class="blue">Save</button>
        </sec:authorize>

    </div>

</form:form>
</body>
</html>
