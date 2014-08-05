
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
            <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form method="get">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <button formaction="/curator/${account}/myStudents" type="submit" class="btn <c:if test="${feedbackerRole=='asCurator'}">btnActive</c:if>">
                            <span>My Students</span>
                        </button>
                    </li>
                    <li>
                        <button formaction="/curator/${account}/interview" type="submit" class="btn <c:if test="${feedbackerRole=='asInterviewer'}">btnActive</c:if>">
                            <span>Interviews</span>
                        </button>
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

</div>
<form class="reviewForm" >

        <div class="alignCenter">
            <h1 >Interview Form </h1>
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
        <label >English:</label>

        <div class="starRating">
            <input name="valueEnglish" type="radio" class="star" value="1"/>
            <input name="valueEnglish" type="radio" class="star" value="2"/>
            <input name="valueEnglish" type="radio" class="star" value="3"/>
            <input name="valueEnglish" type="radio" class="star" value="4"/>
            <input name="valueEnglish" type="radio" class="star" value="5"/>
        </div>
    </div>

    <div class="interviewGroup">
        <select name="criteria1">
            <option value="html">html</option>
            <option value="css">css</option>
            <option value="java">java</option>
            <option value="hibernate">hibernate</option>
        </select>

        <div class="starRating">
            <input name="valueCriteria1" type="radio" class="star" value="1"/>
            <input name="valueCriteria1" type="radio" class="star" value="2"/>
            <input name="valueCriteria1" type="radio" class="star" value="3"/>
            <input name="valueCriteria1" type="radio" class="star" value="4"/>
            <input name="valueCriteria1" type="radio" class="star" value="5"/>
        </div>
    </div>

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

        <div class="alignCenter">
            <label for="other">Other:</label><br/>
            <textarea name="other" id="other" cols="30" rows="10" class="textOther"></textarea>
            <button type="submit" class="loginAndCreateButton">Save</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
        </div>

</form>
</body>
</html>
