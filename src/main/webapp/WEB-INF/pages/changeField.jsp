<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Change field</title>

    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>

<ul class="nav nav-tabs" role="tablist">
    <li <c:if test="${!isField}">class="active" </c:if>>
        <a href="#group" role="tab" data-toggle="tab">Group</a>
    </li>
    <li
            <c:if test="${isField}">class="active" </c:if> >
        <a href="#field" role="tab" data-toggle="tab">Field</a>
    </li>
</ul>

<div class="tab-content" align="center">

    <div class="tab-pane <c:if test="${!isField}">active</c:if>" id="group">
        <form:form commandName="changeGroupUnit" action="/admin/changeGroup" method="post">
        <div class="spoilers">

            <h3>Change Group</h3>

            <div class="alignCenter" id="oldGroup">
                <label >Old name of group</label>
                <form:select path="oldGroupName" class="addTechField">
                    <c:forEach items="${groups}" var="group">
                        <form:option value="${group}">${group}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="alignCenter">
                <label for="newNameForGroup">New name:</label>
                <form:input path="newGroupName" id="newNameForGroup"/>
            </div>


            <div class="alignCenter">
                <label for="newGroupStatus">Status (for whom)</label>
                <form:select path="status" id="newGroupStatus" class="addTechField">
                    <form:option value="WORKING">For working students</form:option>
                    <form:option value="STUDYING">For studying students</form:option>
                    <form:option value="for_everybody">For all students</form:option>
                </form:select>
            </div>

            <div class="alignCenter">
                <button type="submit" onclick="history.back();return false;" class="gray">Cancel</button>
                <button type="submit" class="blue">Save</button>
                <button formaction="/admin/deleteGroup" class="gray">Delete</button>
            </div>

        </div>
        </form:form>
    </div>

    <div class="tab-pane <c:if test="${isField}">active</c:if>" id="field">
        <div class="spoilers">


            <form:form commandName="addFieldUnit" action="/admin/changeField" method="post">
                <div class="alignCenter">

                    <h3>Change Field</h3>

                    <div class="alignCenter" id="oldField">
                        <label>Old name of field</label>
                        <form:select path="oldFieldName" class="addTechField">
                            <c:forEach items="${attributes}" var="attribute">
                                <form:option value="${attribute}">${attribute}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>

                <div class="alignCenter">
                    <form:radiobutton path="existingGroup" id="cg" value="yes" onclick="groupVisual()" checked="true"/>
                    <label for="cg">Existing group</label>
                    <form:radiobutton path="existingGroup" id="newg" value="no" onclick="groupVisual()"/>
                    <label for="newg">New Group</label>
                </div>

                <div class="alignCenter" id="existingGroup">

                    <label>Group name</label>
                    <form:select path="groupNameExist" name="curGrup" class="addTechField">
                        <c:forEach items="${groups}" var="group">
                            <form:option value="${group}">${group}</form:option>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="alignCenter" id="newGroup">
                    <label>New group name</label>
                    <form:input path="groupNameNew" type="text" class="addTechField"/><br/>

                    <label for="status">Status (for whom)</label>
                    <form:select path="forStatus" id="status" class="addTechField">
                        <form:option value="WORKING">For working students</form:option>
                        <form:option value="STUDYING">For studying students</form:option>
                        <form:option value="for_everybody">For all students</form:option>
                    </form:select>
                </div>

                <div class="alignCenter paddingTop borderBottom paddingBottom">
                    <label for="fieldname">Field name:</label>
                    <form:input path="fieldName" type="text" id="fieldname" class="addTechField"/>
                </div>

                <div class="alignCenter paddingTop">

                    <h3>Type of input</h3>
                    <form:radiobutton path="type" id="string" name="type" value="text"
                                      onclick="visual(); "/>
                    <label for="string">String</label>
                    <form:radiobutton path="type" id="text" name="type" value="textarea"
                                      onclick="visual();"/>
                    <label for="text">Text</label>
                    <form:radiobutton path="type" id="date" name="type" value="date" onclick="visual();"/>
                    <label for="date">Date</label>
                </div>

                <div class="alignCenter paddingBottom">
                    <form:radiobutton path="type" id="select" value="select" name="type"
                                      onclick="visual();"/>
                    <label for="select">Select</label>
                    <form:radiobutton path="type" id="list" value="list" name="type" onclick="visual();"/>
                    <label for="list">List</label>
                    <br/>

                    <div id="needOption">
                        <label for="value">Possible values (via ;)</label><br/>
                        <form:textarea path="possibleValues" name="value" id="value" cols="30" rows="10"
                                       class="textOther addTechField"/>
                    </div>
                </div>

                <div class="alignCenter paddingTop borderTop">
                    <h3>Restrictions</h3>
                    <label for="valueType">Type of value:</label>
                    <form:select path="valueType" id="valueType">
                        <form:option value="any">Any</form:option>
                        <form:option value="number">Number</form:option>
                        <form:option value="fullName">Full name</form:option>
                        <form:option value="symbolsOnly">Symbols only</form:option>
                    </form:select>
                </div>

                <div class="alignCenter">
                    <button type="submit" onclick="history.back();return false;" class="gray">Cancel</button>
                    <form:button type="submit" class="blue">Save</form:button>
                    <button formaction="/admin/deleteField" class="gray">Delete</button>
                </div>
            </form:form>

        </div>
    </div>

</div>

<script type="text/javascript">
    var remove = {display: "none"}
    var show = {display: "block"}

    function visual() {
        var values = $('#needOption');

        if (document.getElementsByName('type')[3].checked || document.getElementsByName('type')[4].checked) {
            values.css(show);
        }
        else {
            values.css(remove);
        }

        var valueTypeSelect = document.getElementById("valueType")
        if (document.getElementsByName('type')[2].checked ||
                document.getElementsByName('type')[3].checked ||
                document.getElementsByName('type')[4].checked) {
            valueTypeSelect.disabled = true;
            valueTypeSelect.options[0].selected = true;
        }
        else {
            valueTypeSelect.disabled = false;
        }

    }

    function groupVisual() {
        var existingGroup = $('#existingGroup');
        var newGroup = $('#newGroup')
        if (document.getElementsByName('existingGroup')[1].checked) {
            existingGroup.css(remove);
            newGroup.css(show);
            return;
        }

        existingGroup.css(show);
        newGroup.css(remove);
    }
</script>

<script>
    var form=document.createElement("form");
    form.action="/admin/changeField";

</script>

</body>
</html>