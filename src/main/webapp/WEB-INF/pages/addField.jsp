<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Add field</title>

    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/AdminHat.jsp" %>

<ul class="nav nav-tabs" role="tablist">
    <li <c:if test="${!isField}">class="active" </c:if>>
        <a href="#technology"  role="tab" data-toggle="tab">Technology</a>
    </li>
    <li <c:if test="${isField}">class="active" </c:if> >
        <a href="#field" role="tab" data-toggle="tab">Field</a>
    </li>
</ul>

<div class="tab-content" align="center">

    <div class="tab-pane <c:if test="${!isField}">active</c:if>" id="technology">
<form action="/admin/addTechnology" method="post">
        <div class="spoilers">
            <div class="alignCenter">
                <label for="newTech">New technology:</label>
                <input type="text" name="newTech" id="newTech"/>
            </div>


            <div class="alignCenter">
                <button  type="submit" onclick="history.back();return false;" class="gray">Cancel</button>
                <button  type="submit" class="blue">Save</button>
            </div>

        </div>
</form>
    </div>

    <div class="tab-pane <c:if test="${isField}">active</c:if>" id="field">
        <div class="spoilers">

            <form:form commandName="addFieldUnit" action="/admin/addField" method="post">
            <div class="alignCenter">
                <form:radiobutton path="existingGroup" id="cg" value="yes"  onclick="groupVisual()" checked="true"/>
                <label for="cg">Existing group</label>
                <form:radiobutton path="existingGroup" id="newg" value="no" onclick="groupVisual()"/>
                <label for="newg">New Group</label>
            </div>

            <div class="alignCenter" id="existingGroup">
                <form:select path="groupNameExist" name="curGrup" class="addTechField">
                    <c:forEach items="${groups}" var="group">
                        <form:option value="${group}">${group}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="alignCenter" id="newGroup">
                <form:input path="groupNameNew" type="text" class="addTechField"/><br/>

                <label for="status">For Status</label>
                <form:select path="forStatus"  id="status"  class="addTechField">
                    <form:option value="WORKING">Working</form:option>
                    <form:option value="STUDYING">Studying</form:option>
                    <form:option value="for_everybody">For everybody</form:option>
                </form:select>
            </div>

            <div class="alignCenter paddingTop borderBottom">
                <label for="fieldname">Field name:</label>
                <form:input path="fieldName" type="text" id="fieldname"  class="addTechField"/>
            </div>

            <div class="alignCenter ">
                <form:radiobutton path="type" id="string" name="type" value="text" onclick="visual();"/>
                <label for="string">String</label>
                <form:radiobutton path="type" id="text" name="type" value="textarea" onclick="visual();"/>
                <label for="text">Text</label>
            </div>
            <div class="alignCenter">
                <form:radiobutton path="type" id="select" value="select" name="type" onclick="visual();"/>
                <label for="select">Select</label>
                <br/>
                <div id="needOption">
                    <label for="value">Possible values (via ;)</label><br/>
                    <form:textarea path="possibleValues" name="value" id="value" cols="30" rows="10"
                              class="textOther addTechField"/>
                </div>
            </div>


        <div class="alignCenter">
            <button  type="submit" onclick="history.back();return false;" class="gray">Cancel</button>
            <form:button  type="submit" class="blue">Save</form:button>
        </div>
        </form:form>

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
        if (document.getElementsByName('existingGroup')[1].checked){
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