<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
    <title>Choosing table fields</title>
    <link rel="stylesheet" href="/resources/styles/style.css" />
</head>
<body>

	<div class="hat">
		<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
		<img src="/resources/images/account.png" class="account_logo">
        <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
		<span class="currUserName"><c:out value="${account}"></c:out></span>
		<img src="/resources/images/loupe.png" class="loupe_logo">
	</div>

    <div style="height: 50px"></div>
    <a href="#modal" role="button" class="btn" data-toggle="modal" style="float: left;">&#9658;</a>

    <div id="modal" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h2>Menu</h2>
        </div>
        <div class="modal-body">
                <a href><p>
                    <img src="/resources/images/add.png" class="add_logo" width="25px">
                    <span>Add User</span>
                </p></a>
                <a href><p>
                    <img src="/resources/images/yellow-link.png"  height="23px">
                    <span>Link Student</span>
                </p></a>
                <a href><p>
                    <img src="/resources/images/interview.png"  width="25px">
                    <span>Interview</span>
                </p></a>
                <a href><p>
                    <img src="/resources/images/fired.png"  width="25px">
                    <span>Fired Students</span>
                </p></a>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </div>



    <div class="tabbable " style="overflow: auto">
    <ul class="nav nav-tabs pull-right" role="tablist" id="myTab">
        <li class="active"><a href="#education" role="tab" data-toggle="tab">Education institution</a></li>
        <li><a href="#beforeWorking" role="tab" data-toggle="tab">Before working</a></li>
        <li><a href="#currProject" role="tab" data-toggle="tab">Current project</a></li>
    </ul>
        </div>
	
	<div align="center" width = "600px">
	<div id="hatSelect">
        <label style="margin-left:2%;float: left;">Field name</label>
        <label style="margin-right:5%;float: right;">Filter parameters</label><label></label>
	</div>



<div class="tab-content">
    <div class="tab-pane active" id="education">
        <form>
            <div class="spoilers">
                <div class="group"><label for="university">University</label><input type="checkbox"><input id = "university"></div>
                <div class="group"><label for="faculty">Faculty</label><input type="checkbox"><input id="faculty"></div>
                <div class="group"><label for="specialty">Specialty</label><input type="checkbox"><input id="specialty"></div>
                <div class="group"><label for="group">Group</label><input type="checkbox"><input id="group"></div>
            </div>
        </form>
    </div>

    <div class="tab-pane" id="beforeWorking">
        <form>
            <div class="spoilers">
                <div class="group"><label for="dateOfEmployng">Date of employing</label><input type="checkbox"><input id = "dateOfEmployng" type="date"></div>
                <div class="group"><label for="trainingExadel">Have you been training in Exadel before working?</label>
                    <input type="checkbox">
                    <select id="trainingExadel">
                    <option>Yes</option>
                        <option>No</option>
                    </select></div>
                <div class="group"><label for="finishTraining">What year you finished training?</label>
                    <input type="checkbox"><input id="finishTraining"></div>
                <div class="group">
                    <label for="whatYearStartedTrain">What year you was when started training in Exadel?</label>
                    <input type="checkbox">
                    <select id="whatYearStartedTrain">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
        <div class="tab-pane" id="currProject">
            <form>
            <div class="spoilers">
                <div class="group"><label for="teamLead">Team Leader</label><input type="checkbox"><input id="teamLead"></div>
                <div class="group"><label for="PM">Project Manager</label><input type="checkbox"><input id="PM"></div>
                <div class="group"><label for="curator">Curator</label><input type="checkbox"><input id="curator"></div>
                <div class="group"><label for="currProj">Current project</label><input type="checkbox"><input id="currProj"></div>
                <div class="group" style="height: 60px"><label for="currTechnologies">Technologies using in the current project</label>
                    <input type="checkbox">
                    <select id="currTechnologies" multiple style="width: 180px; height: 60px">
                        <option>JS</option>
                        <option>CSS</option>
                        <option>HTML</option>
                        <option>Qt</option>
                    </select></div>
                <div class="group"><label for="currRole">Role in the current project</label>
                    <input type="checkbox">
                    <select id="currRole">
                    <option>Junior</option>
                    <option>Developer</option>
                    <option>Tester</option>
                </select></div>

            </div>
        </form>
            </div>
</div>
</body>
</html>