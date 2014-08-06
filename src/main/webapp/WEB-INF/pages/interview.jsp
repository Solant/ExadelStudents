<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Interview</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/style.css" />
    <link rel="stylesheet" href="/resources/styles/style.css" />


    <script type="text/javascript" src="/resources/js/jquery.js"></script>
    <script language="javascript" type="text/javascript" src="/resources/js/jquery.MetaData.js"></script>
    <script language="javascript" type="text/javascript" src="/resources/js/jquery.rating.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/styles/jquery.rating.css" />

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
            <form method="get">
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
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>



</div>
<form:form commandName="review" action="/curator/${account}/addRatingReview" method="post" class="reviewForm" >
    <form:input hidden="true" path="student.login" />
    <form:input hidden="true" path="fromInterview" />
        <div class="alignCenter">
            <h1 >Review Form </h1>
        </div>


    <p>
        <label for="lastname">Lastname:</label>
        <input class="field" type="text" id="lastname" value="Ivanov" readonly>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <input class="field" type="text" id="firstname" value="Ivan" readonly>
    </p>

    <div>
        <label value="English">English:</label>
            <form:input path="ratings[0].technology.technologyName" value="English" hidden="true"/>

        <div class="starRating">
            <form:radiobutton path="ratings[0].rating" name="valueEnglish" class="star" value="1"/>
            <form:radiobutton path="ratings[0].rating" name="valueEnglish" class="star" value="2"/>
            <form:radiobutton path="ratings[0].rating" name="valueEnglish" class="star" value="3"/>
            <form:radiobutton path="ratings[0].rating" name="valueEnglish" class="star" value="4"/>
            <form:radiobutton path="ratings[0].rating" name="valueEnglish" class="star" value="5"/>
        </div>
    </div>
    <c:forEach begin="1" end="4" var="i">

    <div class="interviewGroup">
        <form:select path="ratings[${i}].technology.technologyName" name="criteria2">
            <c:forEach items="${techologies}" var="tech">
                <form:option value="${tech.technologyName}">${tech.technologyName}</form:option>
            </c:forEach>
        </form:select>

         <div class="starRating">
            <form:radiobutton path="ratings[${i}].rating" name="value2" class="star" value="1"/>
            <form:radiobutton path="ratings[${i}].rating" name="value2" class="star" value="2"/>
            <form:radiobutton path="ratings[${i}].rating" name="value2" class="star" value="3"/>
            <form:radiobutton path="ratings[${i}].rating" name="value2" class="star" value="4"/>
            <form:radiobutton path="ratings[${i}].rating" name="value2" class="star" value="5"/>
        </div>
    </div>
    </c:forEach>

    <%--<div class="interviewGroup">
        <form:select path="tech3" name="criteria3">
            <c:forEach items="${techologies}" var="tech">
                <form:option value="${tech.technologyName}">${tech.technologyName}</form:option>
            </c:forEach>
        </form:select>

        <div class="starRating">
            <form:radiobutton path="rating3" name="value3" class="star" value="1"/>
            <form:radiobutton path="rating3" name="value3" class="star" value="2"/>
            <form:radiobutton path="rating3" name="value3" class="star" value="3"/>
            <form:radiobutton path="rating3" name="value3" class="star" value="4"/>
            <form:radiobutton path="rating3" name="value3" class="star" value="5"/>
        </div>
    </div>


    <div class="interviewGroup">
        <form:select path="tech4" name="criteria4">
            <c:forEach items="${techologies}" var="tech">
                <form:option value="${tech.technologyName}">${tech.technologyName}</form:option>
            </c:forEach>
        </form:select>

        <div class="starRating">
            <form:radiobutton path="rating4" name="value4" class="star" value="1"/>
            <form:radiobutton path="rating4" name="value4" class="star" value="2"/>
            <form:radiobutton path="rating4" name="value4" class="star" value="3"/>
            <form:radiobutton path="rating4" name="value4" class="star" value="4"/>
            <form:radiobutton path="rating4" name="value4" class="star" value="5"/>
        </div>
    </div>

--%>

    <div class="alignCenter">
            <label for="other">Other:</label><br/>
            <form:textarea path="comment" name="other" id="other" cols="30" rows="10" class="textOther"/>
            <button type="submit" class="loginAndCreateButton">Save</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>

</form:form>
</body>
</html>


<%--


<div class="interviewGroup">
    <select name="criteria2">
        <option value="html">html</option>
        <option value="css">css</option>
        <option value="java">java</option>
        <option value="hibernate">hibernate</option>
    </select>

    <div class="starRating">
        <input name="valueCriteria2" type="radio" class="star" value="1"/>
        <input name="valueCriteria2" type="radio" class="star" value="2"/>
        <input name="valueCriteria2" type="radio" class="star" value="3"/>
        <input name="valueCriteria2" type="radio" class="star" value="4"/>
        <input name="valueCriteria2" type="radio" class="star" value="5"/>
    </div>
</div>

<div class="interviewGroup">
    <select name="criteria3">
        <option value="html">html</option>
        <option value="css">css</option>
        <option value="java">java</option>
        <option value="hibernate">hibernate</option>
    </select>

    <div class="starRating">
        <input name="valueCriteria3" type="radio" class="star" value="1"/>
        <input name="valueCriteria3" type="radio" class="star" value="2"/>
        <input name="valueCriteria3" type="radio" class="star" value="3"/>
        <input name="valueCriteria3" type="radio" class="star" value="4"/>
        <input name="valueCriteria3" type="radio" class="star" value="5"/>
    </div>
</div>

<div class="interviewGroup">
    <select name="criteria4">
        <option value="html">html</option>
        <option value="css">css</option>
        <option value="java">java</option>
        <option value="hibernate">hibernate</option>
    </select>

    <div class="starRating">
        <input name="valueCriteria4" type="radio" class="star" value="1"/>
        <input name="valueCriteria4" type="radio" class="star" value="2"/>
        <input name="valueCriteria4" type="radio" class="star" value="3"/>
        <input name="valueCriteria4" type="radio" class="star" value="4"/>
        <input name="valueCriteria4" type="radio" class="star" value="5"/>
    </div>
</div>
--%>

