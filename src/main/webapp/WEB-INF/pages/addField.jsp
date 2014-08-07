<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>Admin | Add field</title>
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
            <a class="navbar-brand" href="/"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search Student">
                </div>
            </form>
            <form method="get">
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Actions
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">

                            <li>
                                <button formaction="/admin/returnCreate" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add User</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/showLinkStudent" class="btn">
                                    <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                                    <span>Link Student</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/showDisabled" class="btn">
                                    <img src="/resources/images/fired.png" class="adminMenuImages">
                                    <span>Disabled Students</span>
                                </button>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/createNotif" class="btn">
                                    <img src="/resources/images/message1.png" class="adminMenuImages">
                                    <span>Create notification</span>
                                </button>
                            </li>
                            <li>
                                <button formaction="/admin/showAddField" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add new Field</span>
                                </button>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/" class="btn">
                                    <img src="/resources/images/loupe.png" class="adminMenuImages">
                                    <span>Filtration</span>
                                </button>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="/notif">
                            <div class="message">
                                <c:if test="${notifNumber > 0}">
                                <span>
                                        ${notifNumber}
                                </span>
                                </c:if>
                            </div>
                        </a>
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
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div id="searchResult" class="list-group"></div>

<ul class="nav nav-tabs" role="tablist">
    <li <c:if test="${!isField}">class="active" </c:if>>
        <a href="#technology"  role="tab" data-toggle="tab">Technology</a>
    </li>
    <li <c:if test="${isField}">class="active" </c:if> >
        <a href="#field" role="tab" data-toggle="tab">Field</a>
    </li>
</ul>




<div class="tab-content">

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