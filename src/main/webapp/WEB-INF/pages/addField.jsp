<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Add field</title>

    <%@include file="/WEB-INF/pages/allIncluded.jspllIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/AdminHat.jsps/AdminHat.jsp" %>

<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#technology" role="tab" data-toggle="tab">Technology</a>
    </li>
    <li >
        <a href="#field" role="tab" data-toggle="tab">Field</a>
    </li>
</ul>

<div class="tab-content">

    <div class="tab-pane active" id="technology">

        <div class="spoilers">
            <div class="alignCenter">
                <label for="newTech">New technology:</label>
                <input type="text" id="newTech"/>
            </div>

            <div class="button">
                    <button  class="button">Link</button>
                    <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
            </div>

        </div>

    </div>

    <div class="tab-pane" id="field">
<!-- kljfsdjklf -->
        <div class="spoilers">

            <div class="alignCenter">
                <input type="radio" id="cg" name="group" onclick="groupVisual()" checked/>
                <label for="cg">Existing group</label>
                <input type="radio" id="newg" name="group" onclick="groupVisual()"/>
                <label for="newg">New Group</label>
            </div>

            <div class="alignCenter" id="existingGroup">
                <select name="curGrup" class="addTechField">
                    <option value="common">Common</option>
                    <option value="work">Work</option>
                    <option value="project">Project</option>
                </select>
            </div>

            <div class="alignCenter" id="newGroup">
                <input type="text" class="addTechField"/><br/>

                <label for="status">For Status</label>
                <select name="status" id="status"  class="addTechField">
                    <option value="working">Working</option>
                    <option value="studying">Studying</option>
                </select>
            </div>

            <div class="alignCenter paddingTop borderBottom">
                <label for="fieldname">Field name:</label>
                <input type="text" id="fieldname"  class="addTechField"/>
            </div>

            <div class="alignCenter ">
                <input type="radio" id="string" name="type" value="string" onclick="visual();"/>
                <label for="string">String</label>
                <input type="radio" id="text" name="type" value="text" onclick="visual();"/>
                <label for="text">Text</label>
            </div>
            <div class="alignCenter">
                <input type="radio" id="select" name="type" onclick="visual();"/>
                <label for="select">Select</label>
                <br/>
                <div id="needOption">
                    <label for="value">Possible values (via ;)</label><br/>
                    <textarea name="value" id="value" cols="30" rows="10"
                              class="textOther addTechField"></textarea>
                </div>
            </div>

            <div class="alignCenter">
                <button  type="submit" class="loginAndCreateButton">Save</button>
                <button  type="submit" class="loginAndCreateButton">Cancel</button>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript">
    var remove={display: "none"}
    var show={display: "block"}

    function visual(){
        var values=$('#needOption');

        if (document.getElementsByName('type')[2].checked){
            values.css(show);
        }
        else {
            values.css(remove);
        }
    }

    function groupVisual(){
        var existingGroup=$('#existingGroup');
        var newGroup=$('#newGroup')
        if (document.getElementsByName('group')[1].checked){
            existingGroup.css(remove);
            newGroup.css(show);
            return;
        }

        existingGroup.css(show);
        newGroup.css(remove);
    }
</script>

</body>
</html>