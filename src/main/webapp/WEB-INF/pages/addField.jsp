<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
    <title>Add field</title>

</head>
<body>

<nav class="navbar navbar-blue navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="message">
            <span>
                1
            </span>
                    </div>
                </li>
                <li>
                    <span class="currUserName"><c:out value="${account}"></c:out></span>
                </li>
                <li>
                    <a href="<c:url value="j_spring_security_logout" />">
                        <img src="/resources/images/exit.png" class="exit_logo">
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/account"/> ">
                        <img src="/resources/images/account.png" class="account_logo">
                    </a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

    <div class="spoilers marginTop">
        <form:form commandName="addFieldUnit" action="/admin/addField" method="post">
        
        <div class="floatLeft addTech">
            <form:radiobutton path="existingGroup" value="yes" id="cg" name="group"/>
            <label for="cg">Existing group:</label><br/>
            <form:select path="groupNameExist" name="curGrup" class="addTechField">
                <c:forEach items="${groups}" var="group">
                    <form:option value="${group}">${group}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="floatRight addTech">
        <form:radiobutton path="existingGroup" value="no" id="newg" name="group" />
            <label for="newg">New Group</label><br/>
        <form:input path="groupNameNew" type="text" class="addTechField"/><br/>

            <label for="status">For Status</label>
            <form:select path="forStatus" name="status" id="status"  class="addTechField">
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
            <form:radiobutton path="type" value="select" id="select" name="type" onclick="visual();"/>
            <label for="select">Select</label>
            <br/>
            <div id="needOption">
                <label for="value">Possible values (via ;)</label><br/>
                <form:textarea path="possibleValues" name="value" id="value" cols="30" rows="10"
                          class="textOther addTechField"></form:textarea>
            </div>
        </div>

        <div class="alignCenter">
            <form:button  type="submit" class="loginAndCreateButton">Save</form:button>
            <button  type="submit" onclick="history.back();return false;" class="loginAndCreateButton">Cancel</button>
        </div>
        </form:form>
    </div>



<script type="text/javascript">
    function visual(){
        values=document.getElementById("needOption");

        if (document.getElementsByName('type')[2].checked){
            values.style.display="block";
        }
        else {
            values.style.display="none";
        }
    }
</script>

</body>
</html>