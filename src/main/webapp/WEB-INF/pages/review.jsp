
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

    <a href="account.jsp">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <img src="/resources/images/exit.png" class="exit_logo">
    <span class="currUserName"> Username </span>

</div>

<form class="reviewForm" >

    <h1 class="alignCenter">Review Form </h1>

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

    <p class="alignCenter">
        <input type="radio" name="billable" value="yes" id="bilYes"><label for="bilYes">Billable</label>
        <input type="radio" name="billable" value="no" id="bilNo"><label for="bilNo">Not Billable</label>
    </p>

    <p class="alignCenter">
        <label for="other">Other:</label><br/>
        <textarea name="other" id="other" cols="30" rows="10" class="textOther"></textarea>
    </p>

    <div class="allignCenter">
        <div>
            <input type="submit" class="loginAndCreateButton" value="Create">
            <input type="submit" class="loginAndCreateButton" value="Cancel">
        </div>
    </div>

</form>
</body>
</html>
