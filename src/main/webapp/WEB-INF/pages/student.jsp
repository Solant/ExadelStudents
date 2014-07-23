<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Student's page</title>
    <link rel="stylesheet" href="/resources/styles/style.css" />
</head>
<body>
<div class="hat">
	<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
	<img src="/resources/images/account.png" class="account_logo">
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <sec: >
	<span class="currUserName"><c:out value="${account}"></c:out></span>
	<img src="/resources/images/loupe.png" class="loupe_logo">
			
</div>
<div align="center" width = "600px">
    <div style="height: 50px"></div>
    <div class="profile" align="center">
        <img src="/resources/images/account.png" style="zoom: 2;float:left; margin-top: 5px;">
        <div style="margin-top:20px;" >
            <label for="firstName" class="spoilers label">First name</label><input id="firstName"><br>
            <label for="lastName" class="spoilers label">Last name</label><input id="lastName"><br>
        </div>
    </div>
    <details class="details">
        <summary>Education institution</summary>
        <pre><form>
            <div class="spoilers">
                <div class="group"><label for="university">University</label><input id = "university"></div>
                <div class="group"><label for="faculty">Faculty</label><input id="faculty"></div>
                <div class="group"><label for="specialty">Specialty</label><input id="specialty"></div>
                <div class="group"><label for="group">Group</label><input id="group"></div>
                <button style="display: block" type="submit">Save</button>
            </div>
        </form>
        </pre>
        <p></p>
    </details>
    <details class="details">
        <summary>Before working</summary>
        <pre><form>
            <div class="spoilers">
                <div class="group"><label for="dateOfEmployng">Date of employing</label><input id = "dateOfEmployng" type="date"></div>
                <div class="group"><label for="trainingExadel">Have you been training in Exadel before working?</label>
                    <select id="trainingExadel">
                    <option>Yes</option>
                        <option>No</option>
                    </select></div>
                <div class="group"><label for="finishTraining">What year you finished training?</label><input id="finishTraining"></div>
                <div class="group">
                    <label for="whatYearStartedTrain">What year you was when started training in Exadel?</label>
                    <select id="whatYearStartedTrain">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
                <button style="display: block" type="submit">Save</button>
            </div>
        </form>
        </pre>
        <p></p>
    </details>
    <details class="details">
        <summary>Current project</summary>
        <pre><form>
            <div class="spoilers">
                <div class="group"><label for="teamLead">Team Leader</label><input id="teamLead"></div>
                <div class="group"><label for="PM">Project Manager</label><input id="PM"></div>
                <div class="group"><label for="curator">Curator</label><input id="curator"></div>
                <div class="group"><label for="currProj">Current project</label><input id="currProj"></div>
                <div class="group"><label for="currRole">Your current role</label>
                <select id="currRole">
                    <option>Junior</option>
                    <option>Developer</option>
                    <option>Tester</option>
                </select></div>
                <div class="group"><label for="currTechnologies">Technologies using in the current project</label>
                    <select id="currTechnologies" multiple style="width: 200px; height: 60px">
                        <option>JS</option>
                        <option>CSS</option>
                        <option>HTML</option>
                        <option>QT</option>
                    </select></div>
                <button style="display: block" type="submit">Save</button>
            </div>
        </form>
        </pre>
        <p></p>
    </details>
</div>
</body>
</html>