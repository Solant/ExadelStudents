
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Student's page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="hat">
	<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
	<a href="account.jsp">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
	<span class="currUserName"><c:out value="${account}"></c:out></span>
	<img src="/resources/images/loupe.png" class="loupe_logo">
</div>

<div align="center" width = "600px">
    <div style="height: 50px"></div>
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="Ivanov"></c:out>
        <c:out value="Ivan"></c:out>
    </div>

   <%-- <div class="tabbable tabs-left" style="float: left">--%>
        <ul class="nav nav-tabs" role="tablist" id="myTab">
            <li class="active"><a href="#education" role="tab" data-toggle="tab">Education institution</a></li>
            <li><a href="#beforeWorking" role="tab" data-toggle="tab">Before working</a></li>
            <li><a href="#currProject" role="tab" data-toggle="tab">Current project</a></li>
        </ul>
   <%-- </div>--%>

    <div class="tab-content">
        <div class="tab-pane active" id="education">
            <form>
                <div class="spoilers">
                    <div class="group"><label for="university">University</label><input id = "university"></div>
                    <div class="group"><label for="faculty">Faculty</label><input id="faculty"></div>
                    <div class="group"><label for="specialty">Specialty</label><input id="specialty"></div>
                    <div class="group"><label for="group">Group</label><input id="group"></div>
                    <button style="display: block" type="submit">Save</button>
                </div>
            </form>
        </div>

        <div class="tab-pane" id="beforeWorking">
            <form>
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
        </div>

        <div class="tab-pane" id="currProject">
            <form>
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
                            <option>Qt</option>
                        </select></div>
                    <button style="display: block" type="submit">Save</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>