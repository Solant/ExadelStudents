
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/FBhat.jsp" %>

<form class="linkingForm" >
<div class="radio">
    <input type="radio" name="feedbacking" value="Interview" id="Interview"><label for="Interview">Interview</label>

    <input type="radio" name="feedbacking" value="Curating" id="Curating"><label for="Curating">Curating</label>
</div>
    <div class="linkingL">
        <label for="students">Students</label><br/>
            <select multiple id="students">
                <option value="A">A</option>
                <option value="A">B</option>
                <option value="A">C</option>
                <option value="A">D</option>
                <option value="A">E</option>
                <option value="A">F</option>
                <option value="A">G</option>
                <option value="A">H</option>
                <option value="A">K</option>
                <option value="A">L</option>
                <option value="A">M</option>
                <option value="A">N</option>
            </select>
    </div>

    <div  class="linkingR">
        <label for="feedbackers">Feedbackers</label><br/>
            <select multiple id="feedbackers">

            </select>
    </div>

    <div class="technology">
        <label for="techList">Technology:</label><br/>
        <select name="technology" id="techList">
            <option value="none">None</option>
            <option value="all">All</option>
            <option value="html">HTML</option>
            <option value="css">CSS</option>
            <option value="hibernate">hibernate</option>
        </select>
    </div>

    <div class="button">
            <button  class="button">Link</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
    </div>

</form>
</body>
</html>
