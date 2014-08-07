<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="java.util.List" %>
<%@ page import="persistance.model.Notification" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Student's page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/bootstrap.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.1/css/jquery.dataTables.css">

    <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" class="init">
        $(document).ready(function() {
            $('#reviewsTable').dataTable();
        } );
    </script>

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
            <ul class="nav navbar-nav navbar-right">
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div align="center">
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="${secondName}"></c:out>
        <c:out value="${firstName}"></c:out>
    </div>

        <ul class="nav nav-tabs" role="tablist">

            <%pageContext.setAttribute("isActive", "active");%>

            <c:forEach items="${groups}" var="groupName" varStatus="index">
                <li class="${isActive}">
                    <a href="#${index.count}" role="tab" data-toggle="tab">${groupName}</a>
                </li>
                <%pageContext.setAttribute("isActive", "");%>
            </c:forEach>


        </ul>



    <div class="tab-content">

        <%pageContext.setAttribute("isActive", "active");%>

    <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
    <div class="tab-pane ${isActive}" id="${index1.count}">
<!-- Petya -->
        <form:form commandName="groupedValues" class="spoilers" method="post" action="/student/${account}/saveChanges">
            <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
                <div class="group">
                    <label >${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].attribute} </label>
                    <c:if test="${attr.type == 'text'}">
                        <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                    </c:if>
                    <c:if test="${attr.type == 'textarea'}">
                        <form:textarea path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                    </c:if>
                    <c:if test="${attr.type == 'select'}">
                        <form:select path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" >
                        <c:forEach items="${attr.possibleValues}"  var="token">
                            <form:option value="${token}">${token}</form:option>
                        </c:forEach>
                        </form:select>
                    </c:if>

                    <c:if test="${attr.type == 'date'}">
                        <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" type="date" />
                    </c:if>
                    <%--<c:if test="${attr.type == 'date'}">
                        <form:input typ path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                    </c:if>--%>
                    <%--<c:if test="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].type == 'select'}">
                        <form:select path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                        <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].possibleValues" var="token">
                            <form:option value="${token}">${token}</form:option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].type == 'radiobutton'}">
                        <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].possibleValues" var="token">
                            <form:radiobutton path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"
                                              value="${token == groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].value}"/>
                        </c:forEach>
                    </c:if>--%>
                    <form:input hidden="true" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute" />
                </div>
            </c:forEach>
            <form:button type="submit" class="blue">Save</form:button>
        </form:form>

    </div>
                <%pageContext.setAttribute("isActive", "");%>
    </c:forEach>

       <%-- <form:form commandName="groupedValues" class="spoilers" method="post" action="/student/${account}/saveChanges">
            <form:input path="test" />
            <form:button type="submit">Save</form:button>
        </form:form>
--%>


</body>
</html>


<%----%>

<%--<li class="active">
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
    <a href="#reviews" role="tab" data-toggle="tab">Reviews</a>
</li>
--%>



       <%-- <div class="tab-pane active" id="common">
            <form class="spoilers">
                <div class="gavs">
                    <label for="lastname">Lastname:</label>
                    <input type="text" id="lastname" value="Ivanov" readonly>
                </div>

                <div class="gavs">
                    <label for="firstname">Firstname:</label>
                    <input type="text" id="firstname" value="Ivan" readonly>
                </div>

                <div class="gavs">
                    <label for="pNumber">Phone number:</label>
                    <input type="text" id="pNumber" >
                </div>

                <div class="gavs">
                    <label for="email">Email:</label>
                    <input type="text" id="email" >
                </div>

                <div class="gavs">
                    <label for="skype">Skype:</label>
                    <input type="text" id="skype" >
                </div>

                <div class="displayFlex">
                    <div class="alignCenter">
                        <button  type="submit" class="loginAndCreateButton">Save</button>
                    </div>
                </div>

            </form>
        </div>

        <div class="tab-pane" id="education">
            <form class="spoilers">
                    <div class="gavs">
                        <label for="university">University:</label>
                        <input type="text" id = "university" >
                    </div>

                    <div class="gavs">
                        <label for="faculty">Faculty:</label><input type="text" id="faculty" >
                    </div>

                    <div class="gavs">
                        <label for="specialty">Specialty:</label><input type="text" id="specialty" >
                    </div>

                    <div class="gavs">
                        <label for="course">Course:</label>

                        <select name="course" id="course" >
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                    </div>

                    <div class="gavs">
                        <label for="gavs">Group:</label><input type="text" id="gavs">
                    </div>

                    <div class="gavs">
                        <label for="year">Year graduation:</label><input type="text" id="year" >
                    </div>
                    &lt;%&ndash;
                    <div class="gavs"><label for="university">University</label><input id = "university"></div>
                    <div class="gavs"><label for="faculty">Faculty</label><input id="faculty"></div>
                    <div class="gavs"><label for="specialty">Specialty</label><input id="specialty"></div>
                    <div class="gavs"><label for="gavs">Group</label><input id="gavs"></div>&ndash;%&gt;
                <div class="displayFlex">
                    <div class="alignCenter">
                    <button  type="submit" class="loginAndCreateButton">Save</button>
                        </div>
                    </div>
            </form>
        </div>

        <div class="tab-pane" id="work">
            <form class="spoilers">
                    <div class="gavs">
                        <label for="dateOfEmployng">Date of employing:</label>
                        <input id = "dateOfEmployng" type="date">
                    </div>
                    <div class="gavs">
                        <label for="trainingExadel">Have you been training in Exadel before working?</label>
                        <select id="trainingExadel">
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <div class="gavs">
                        <label for="whatYearStartedTrain">What year you was when started training in Exadel?</label>
                        <select id="whatYearStartedTrain">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                    </div>

                    <div class="gavs">
                        <label for="hoursNow">Hours now:</label><input type="text" id="hoursNow" >
                    </div>

                    <div class="gavs">
                        <label for="hoursFuture">Hours in future:</label>
                        <input type="text" id="hoursFuture" >
                    </div>

                    <div class="gavs">
                        <label for="futureTechnologies">Technologies using in the Future:</label>
                        <input type="text" id="futureTechnologies"/>
                    </div>

                    <div class="allignCenter">
                        <div>
                            <label for="pastProject">Past projects:</label><br/>
                            <textarea name="pastProject" id="pastProject" cols="30" rows="10" class="textOther"></textarea>
                        </div>
                    </div>

                    <div class="displayFlex">
                        <div class="alignCenter">
                            <input type="radio" name="billable" value="yes" id="bilYes">
                            <label for="bilYes">Billable</label>
                            <input type="radio" name="billable" value="no" id="bilNo">
                            <label for="bilNo">No Billable</label>
                        </div>
                    </div>

                    <div class="gavs">
                        <div>
                            <label for="curatorCompany">Curator in Company:</label>
                            <input type="text" id="curatorCompany" >
                        </div>
                    </div>

                    <div class="gavs">
                        <div>
                            <label for="holiday">Holyday(period):</label>
                            <input type="text" id="holiday" >
                        </div>
                    </div>

                <div class="displayFlex">
                    <div class="alignCenter">
                            <button  type="submit" class="loginAndCreateButton">Save</button>
                        </div>
                    </div>
            </form>
           &lt;%&ndash; <form>
                <div class="spoilers">
                    <div class="gavs"><label for="dateOfEmployng">Date of employing</label><input id = "dateOfEmployng" type="date"></div>
                    <div class="gavs"><label for="trainingExadel">Have you been training in Exadel before working?</label>
                        <select id="trainingExadel">
                            <option>Yes</option>
                            <option>No</option>
                        </select></div>
                    <div class="gavs"><label for="finishTraining">What year you finished training?</label><input id="finishTraining"></div>
                    <div class="gavs">
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
            </form>&ndash;%&gt;
        </div>

        <div class="tab-pane" id="project">
            <form class="spoilers">
                    <div class="gavs">
                        <label for="currProj">Current project</label>
                        <input type="text" id="currProj">
                    </div>
                    <div class="gavs">
                        <label for="teamLead">Team Leader</label>
                        <input type="text" id="teamLead">
                    </div>
                    <div class="gavs">
                        <label for="PM">Project Manager</label>
                        <input type="text" id="PM">
                    </div>

                    <div class="gavs">
                        <label for="currRole">Your current role</label>
                        <select id="currRole">
                            <option>Junior</option>
                            <option>Developer</option>
                            <option>Tester</option>
                        </select>
                    </div>
                    <div class="gavs">
                        <label for="currTechnologies">Technologies using in the current project</label>
                        <input type="text" id="currTechnologies"/>
                    </div>
                    <div class="allignCenter">
                        <div>
                            <input type="radio" name="changeProject" value="yes" id="chPrYes">
                            <label for="chPrYes">I want change Project</label>
                            <input type="radio" name="changeProject" value="no" id="chPrNo">
                            <label for="chPrNo">I dont want change Project</label>
                        </div>
                    </div>

                <div class="displayFlex">
                    <div class="alignCenter">
                        <button  type="submit" class="loginAndCreateButton">Save</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="tab-pane" id="other">
            <form class="spoilers">

                <div class="gavs">
                    <label for="english">English level:</label>
                    <select id="english">
                        <option value="begginer">Begginer</option>
                        <option value="elementary">Elementary</option>
                        <option value="preinter">Pre-Intermediate</option>
                        <option value="inter">Intermediate</option>
                        <option value="upinter">Upper-Intermediate</option>
                        <option value="adv">Advanced</option>
                    </select>
                </div>

                <div class="gavs">
                    <label for="engCourse">English courses:</label>
                    <input type="text" id="engCourse">
                </div>

                <div class="allignCenter">
                    <div>
                        <label for="trainings">Trainings:</label><br/>
                        <textarea name="certificates" id="trainings" cols="30" rows="10" class="textOther"></textarea>
                    </div>
                </div>

                <div class="allignCenter">
                    <div>
                        <label for="certificates">Certificates:</label><br/>
                        <textarea name="certificates" id="certificates" cols="30" rows="10" class="textOther"></textarea>
                    </div>
                </div>

                <div class="displayFlex">
                    <div class="alignCenter">
                        <button  type="submit" class="loginAndCreateButton">Save</button>
                    </div>
                </div>

            </form>
        </div>

        <div class="tab-pane" id="reviews">
            <div class="spoilers">

                    <table border="1px" id="reviewsTable">
                        <thead>
                            <td>Curator</td>
                            <td>Date</td>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2013</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Alex</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2013</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Alex</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Alex</a></td>
                                <td>23.07.2013</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Alex</a></td>
                                <td>23.07.2013</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2014</td>
                            </tr>
                            <tr>
                                <td><a href>Curator Alex</a></td>
                                <td>23.07.2014</td>
                            </tr><tr>
                                <td><a href>Curator Ivan</a></td>
                                <td>23.07.2013</td>
                            </tr>


                        </tbody>
                    </table>
            </div>
        </div>

</div>--%>
<%--</div>--%>