<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css"/>
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/js/ajaxFunc.js"></script>

    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript"
            src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>

    <title>Admin</title>
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
            <div class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search Student" id="search" autocomplete="off">
                </div>
            </div>
            <form method="get">
                <ul class="nav navbar-nav navbar-right">


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Students
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">

                            <li>
                                <button formaction="/admin/showEnabled" class="btn">
                                    <span>Enabled</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showStudying" class="btn">
                                    <span>Studying</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showWorking" class="btn">
                                    <span>Working</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showDisabled" class="btn">
                                    <span>Disabled</span>
                                </button>
                            </li>

                        </ul>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Actions
                            <span class="caret"></span></a>

                        <ul class="dropdown-menu" role="menu">

                            <li class="dropdown-submenu">
                                <button formaction="#" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <button formaction="/admin/returnCreate" class="btn">
                                            <span>User</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showAddField/true" class="btn">
                                            <span>Field</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showAddField/false" class="btn">
                                            <span>Technology</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/createNotif" class="btn">
                                            <span>Notification</span>
                                        </button>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown-submenu">
                                <button formaction="#" class="btn">
                                    <img src="/resources/images/wrench.png" class="adminMenuImages">
                                    <span>Change</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <button formaction="" class="btn">
                                            <span>Field</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="" class="btn">
                                            <span>Group</span>
                                        </button>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <button formaction="/admin/showLinkStudent" class="btn">
                                    <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                                    <span>Link Student</span>
                                </button>
                            </li>


                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/" class="btn">
                                    <img src="/resources/images/loupe.png" class="adminMenuImages">
                                    <span>Filtration</span>
                                </button>
                            </li>

                            <%--

                            /////////////////////////////////////////////////////////////////////
                                                        <li class="dropdown-submenu"> <a href="#">More..</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="#">Level 3</a>
                                                                </li>
                                                                <li><a href="#">Level 3</a>
                                                                </li>
                                                                <li class="dropdown-submenu"> <a href="#">More..</a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="#">Level 4</a>
                                                                        </li>
                                                                        <li><a href="#">Level 4</a>
                                                                        </li>
                                                                        <li class="dropdown-submenu"> <a href="#">More..</a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a href="#">Level 5</a>
                                                                                </li>
                                                                                <li><a href="#">Level 5</a>
                                                                                </li>
                                                                            </ul>
                                                                        </li>

                                                                    </ul>
                                                                </li>

                                                            </ul>
                                                        </li>
                            //////////////////////////////////////////////////////////////////
                            --%>

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
<div align="center">
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="${secondName}"></c:out>
        <c:out value="${firstName}"></c:out>
    </div>

    <ul class="nav nav-tabs" role="tablist">

        <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groups}" var="groupNameExist" varStatus="index">
            <li class="${isActive}">
                <a href="#${index.count}" role="tab" data-toggle="tab">${groupNameExist}</a>
            </li>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>


</ul>


    <form:form commandName="groupedValues" class="spoilers" method="post" action="/admin/formTable">
<div class="tab-content">

        <%pageContext.setAttribute("isActive", "active");%>
        <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
            <div class="tab-pane ${isActive}" id="${index1.count}">
                <!-- Petya -->

                <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
                    <div class="group">

                        <label>${attr.attribute}</label>
                        <form:checkbox path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].show"
                                       cssStyle="width: 20px"/>
                        <c:if test="${attr.type == 'text'}">
                            <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                        </c:if>
                        <c:if test="${attr.type == 'textarea'}">
                            <div class="alignCenter">
                                <form:textarea cssClass="textOther"
                                               path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                            </div>
                        </c:if>
                        <c:if test="${attr.type == 'select'}">
                            <form:select path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value">
                                <c:forEach items="${attr.possibleValues}" var="token">
                                    <form:option value="${token}">${token}</form:option>
                                </c:forEach>
                            </form:select>
                        </c:if>
                        <c:if test="${attr.type == 'date'}">
                            <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" type="date" />
                        </c:if>
                            <%--<c:if test="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].type == 'radiobutton'}">
                                <c:forTokens items="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].possible" delims=";" var="token">
                                    <form:radiobutton path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"
                                                      value="${token == groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].value}"/>
                                </c:forTokens>
                            </c:if>--%>
                        <form:input hidden="true"
                                    path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute"/>
                    </div>
                </c:forEach>

            </div>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>
        <form:button type="submit" class="blue">Form table</form:button>
        </form:form>
    </div>

</body>
</html>

<%--
<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#common" role="tab" data-toggle="tab">Common</a>
    </li>
    <li >
        <a href="#education" role="tab" data-toggle="tab">Education institution</a>
    </li>
    <li>
        <a href="#work" role="tab" data-toggle="tab">Work</a>
    </li>
    <li>
        <a href="#project" role="tab" data-toggle="tab">Project</a>
    </li>

    <li>
        <a href="#other" role="tab" data-toggle="tab">Other</a>
    </li>

    <li>
        <a href="<c:url value="/admin/formTable"/> ">Form table</a>
    </li>

</ul>

<div id="hatSelect">
    <div class="hsFloatLeft">Field name</div>
    <div class="inTable">In<br/>table</div>
    <div class="hsFloatRight">Filter parameters</div>
</div>

<div class="tab-content">

<div class="tab-pane active" id="common">
    <form class="spoilers">
        <div class="adminGroup">
            <label for="lastname">Lastname:</label>
            <input type="checkbox"/>
            <input type="text" id="lastname">
        </div>

        <div class="adminGroup">
            <label for="firstname">Firstname:</label>
            <input type="checkbox"/>
            <input type="text" id="firstname">
        </div>

        <div class="adminGroup">
            <label for="pNumber">Phone number:</label>
            <input type="checkbox"/>
            <input type="text" id="pNumber" >
        </div>

        <div class="adminGroup">
            <label for="email">Email:</label>
            <input type="checkbox"/>
            <input type="text" id="email" >
        </div>

        <div class="adminGroup">
            <label for="skype">Skype:</label>
            <input type="checkbox"/>
            <input type="text" id="skype" >
        </div>
    </form>
</div>

<div class="tab-pane" id="education">
    <form class="spoilers">
        <div class="adminGroup">
            <label for="university">University:</label>
            <input type="checkbox"/>
            <input type="text" id = "university" >
        </div>

        <div class="adminGroup">
            <label for="faculty">Faculty:</label>
            <input type="checkbox"/>
            <input type="text" id="faculty" >
        </div>

        <div class="adminGroup">
            <label for="specialty">Specialty:</label>
            <input type="checkbox"/>
            <input type="text" id="specialty" >
        </div>

        <div class="adminGroup">
            <label for="course">Course:</label>
            <input type="checkbox"/>

            <select name="course" id="course" >
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select>
        </div>

        <div class="adminGroup">
            <label for="group">Group:</label>
            <input type="checkbox"/>
            <input type="text" id="group">
        </div>

        <div class="adminGroup">
            <label for="year">Year graduation:</label>
            <input type="checkbox"/>
            <input type="text" id="year" >
        </div>
    </form>
</div>

<div class="tab-pane" id="work">
    <form class="spoilers">
        <div class="adminGroup">
            <label for="dateOfEmployng">Date of employing:</label>
            <input type="checkbox"/>
            <input id = "dateOfEmployng" type="date">
        </div>
        <div class="adminGroup">
            <label for="trainingExadel">Training in Exadel before working?</label>
            <input type="checkbox"/>
            <select id="trainingExadel">
                <option value="yes">Yes</option>
                <option value="no">No</option>
            </select>
        </div>
        <div class="adminGroup">
            <label for="whatYearStartedTrain">What year was when started training in Exadel?</label>
            <input type="checkbox"/>
            <select id="whatYearStartedTrain">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select>
        </div>

        <div class="adminGroup">
            <label for="hoursNow">Hours now:</label>
            <input type="checkbox"/>
            <input type="text" id="hoursNow" >
        </div>

        <div class="adminGroup">
            <label for="hoursFuture">Hours in future:</label>
            <input type="checkbox"/>
            <input type="text" id="hoursFuture" >
        </div>

        <div class="adminGroup">
            <label for="futureTechnologies">Technologies using in the Future:</label>
            <input type="checkbox"/>
            <input type="text" id="futureTechnologies"/>
        </div>

        <div class="alignCenter">
            <div>
                <label for="pastProject">Past projects:</label>
                <input type="checkbox"/><br/>
                <textarea name="pastProject" id="pastProject" cols="30" rows="10" class="textOther"></textarea>
            </div>
        </div>

            <div class="alignCenter">
                Is Billable:
                <input type="checkbox"/><br/>
                <input type="radio" name="billable" value="yes" id="bilYes">
                <label for="bilYes">Billable</label>
                <input type="radio" name="billable" value="no" id="bilNo">
                <label for="bilNo">No Billable</label>
            </div>

        <div class="adminGroup">
            <div>
                <label for="holiday">Holyday(period):</label>
                <input type="checkbox"/>
                <input type="text" id="holiday" >
            </div>
        </div>


    </form>
</div>

<div class="tab-pane" id="project">
    <form class="spoilers">
        <div class="adminGroup">
            <label for="currProj">Current project</label>
            <input type="checkbox"/>
            <input type="text" id="currProj">
        </div>
        <div class="adminGroup">
            <label for="teamLead">Team Leader</label>
            <input type="checkbox"/>
            <input type="text" id="teamLead">
        </div>
        <div class="adminGroup">
            <label for="PM">Project Manager</label>
            <input type="checkbox"/>
            <input type="text" id="PM">
        </div>

        <div class="adminGroup">
            <div>
                <label for="curator">Curator:</label>
                <input type="checkbox"/>
                <input type="text" id="curator" >
            </div>
        </div>

        <div class="adminGroup">
            <label for="currRole">Current role</label>
            <input type="checkbox"/>
            <select id="currRole">
                <option>Junior</option>
                <option>Developer</option>
                <option>Tester</option>
            </select>
        </div>
        <div class="adminGroup">
            <label for="currTechnologies">Technologies using in the current project</label>
            <input type="checkbox"/>
            <input type="text" id="currTechnologies"/>
        </div>
        <div class="alignCenter">
            <div>
                Change Project:
                <input type="checkbox"/> <br/>
                <input type="radio" name="changeProject" value="yes" id="chPrYes">
                <label for="chPrYes">Want change Project</label>
                <input type="radio" name="changeProject" value="no" id="chPrNo">
                <label for="chPrNo">Dont want change Project</label>
            </div>
        </div>

    </form>
</div>

<div class="tab-pane" id="other">
    <form class="spoilers">

        <div class="adminGroup">
            <label for="english">English level:</label>
            <input type="checkbox"/>
            <select id="english">
                <option value="begginer">Begginer</option>
                <option value="elementary">Elementary</option>
                <option value="preinter">Pre-Intermediate</option>
                <option value="inter">Intermediate</option>
                <option value="upinter">Upper-Intermediate</option>
                <option value="adv">Advanced</option>
            </select>
        </div>

        <div class="adminGroup">
            <label for="engCourse">English courses:</label>
            <input type="checkbox"/>
            <input type="text" id="engCourse">
        </div>

        <div class="alignCenter">
            <div>
                <label for="trainings">Trainings:</label>
                <input type="checkbox"/><br/>
                <textarea name="certificates" id="trainings" cols="30" rows="10" class="textOther"></textarea>
            </div>
        </div>

        <div class="alignCenter">
            <div>
                <label for="certificates">Certificates:</label>
                <input type="checkbox"/><br/>
                <textarea name="certificates" id="certificates" cols="30" rows="10" class="textOther"></textarea>
            </div>
        </div>

    </form>
</div>

</div>
</div>--%>