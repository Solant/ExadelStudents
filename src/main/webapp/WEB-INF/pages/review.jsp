
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <button formaction="/admin/linkStudent" class="btn">My students</button>
    <button formaction="/admin/linkStudent" class="btn"> Interviews  </button>


</div>
<form class="reviewForm" >

        <div class="alignCenter">
            <h1 >Review Form </h1>
        </div>

    <p>
        <label for="lastname">Lastname:</label>
        <input class="field" type="text" id="lastname" value="Ivanov" readonly>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <input class="field" type="text" id="firstname" value="Ivan" readonly>
    </p>
    <p>
        <span>Professional suitability:</span>
        <span class="floatright">
            <input type="radio" name="feedbacking" value="suitable" id="suitable" ><label for="suitable">Suitable</label>
            <input type="radio" name="feedbacking" value="unsuitable" id="unsuitable" ><label for="unsuitable">Unsuitable</label>
        </span>
    </p>
    <p>
        <label for="attitude">Attitude to work:</label>
        <input type="text" id="attitude" class="field">
    </p>

    <p>
        <label for="relations">Relations in the collective:</label>
        <input type="text" id="relations" class="field">
    </p>

    <p>
        <label for="activities">Progress in activities:</label>
        <input type="text" id="activities" class="field">
    </p>

    <p>
        Need more hours:
        <span class="floatright">
            <input type="radio" name="hours" value="yes" id="hoursYes"><label for="hoursYes">Yes</label>
            <input type="radio" name="hours" value="no" id="hoursNo"><label for="hoursNo">No</label>
        </span>
    </p>

    <p>
    <label for="project">Working on the project:</label>
          <select name="project" id="project" class="field">
              <option value="yes">Yes</option>
              <option value="futureYes">Can in future</option>
              <option value="futureNo">Can't in future</option>
          </select>
    </p>

        <div class="alignCenter">
            <input type="radio" name="billable" value="yes" id="bilYes">
            <label for="bilYes">Billable</label>
            <input type="radio" name="billable" value="no" id="bilNo">
            <label for="bilNo">No Billable</label>
        </div>

        <div class="alignCenter">
            <label for="other">Other:</label><br/>
            <textarea name="other" id="other" cols="30" rows="10" class="textOther"></textarea>
        </div>

        <div class="alignCenter">
            <button type="submit" class="loginAndCreateButton">Save</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>

</form>
</body>
</html>
