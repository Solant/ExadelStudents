
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Choosing table fields</title>
    <link rel="stylesheet" href="/resources/styles/style.css" />
</head>
<body>

	<div class="hat">
		<img src="/resources/images/exadel-logo.png" class="exadel_logo">
			
		<img src="/resources/images/account.png" class="account_logo">
		<img src="/resources/images/exit.png" class="exit_logo">
		<span class="currUserName"> Username </span>
		<img src="/resources/images/loupe.png" class="loupe_logo">
	</div>
	
	<div class="functionsBox">
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
	
	<div align="center" width = "600px">
	<div style="height: 50px"></div>
	<div id="hatSelect">
        <label style="margin-left:2%;float: left;">Field name</label>
        <label style="margin-right:5%;float: right;">Filter parameters</label><label></label>
	</div>
	

    <details class="details" open>
        <summary>Education institution</summary>
        <pre><form>
            <div class="spoilers">
                <div class="group"><label for="university">University</label><input type="checkbox"><input id = "university"></div>
                <div class="group"><label for="faculty">Faculty</label><input type="checkbox"><input id="faculty"></div>
                <div class="group"><label for="specialty">Specialty</label><input type="checkbox"><input id="specialty"></div>
                <div class="group"><label for="group">Group</label><input type="checkbox"><input id="group"></div>
            </div>
        </form>
        </pre>
        <p></p>
    </details>
    <details class="details" open>
        <summary>Before working</summary>
        <pre><form>
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
        </pre>
        <p></p>
    </details>
    <details class="details" open>
        <summary>Current project</summary>
        <pre><form>
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
        </pre>
        <p></p>
    </details>
</div>
</body>
</html>