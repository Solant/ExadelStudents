<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
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


<div class="hat">
	<img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="<c:url value="/account"/> ">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
	<span class="currUserName"><c:out value="${account}"></c:out></span>
	<img src="/resources/images/loupe.png" class="loupe_logo">
</div>

<div align="center">
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="Ivanov"></c:out>
        <c:out value="Ivan"></c:out>
    </div>

        <ul class="nav nav-tabs" role="tablist">

            <%pageContext.setAttribute("isActive", "active");%>

            <c:forEach items="${groups}" var="groupName">
                <li class="${isActive}">
                    <a href="#${groupName}" role="tab" data-toggle="tab">${groupName}</a>
                </li>
                <%pageContext.setAttribute("isActive", "");%>
            </c:forEach>


        </ul>



    <div class="tab-content">

        <%pageContext.setAttribute("isActive", "active");%>

    <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
    <div class="tab-pane ${isActive}" id="${groupedValues.valuesArray[index1.count-1].gavs[0].getGroup()}">

        <form:form commandName="groupedValues" class="spoilers" method="post" action="/student/${account}/saveChanges">
            <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2">
                <div class="group">
                    <label >${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].attribute} </label>

                    <form:input type="" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                    <form:input hidden="true" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute" />
                </div>
            </c:forEach>
            <form:button type="submit" >Save</form:button>
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