
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


<div class="hat">
    <img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="<c:url value="/account"/> ">
    <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>
    <img src="/resources/images/loupe.png" class="loupe_logo">

    <button class="btn"> My Students </button>
    <button class="btn"> Interviews </button>


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
            <option value="java">java</option>
            <option value="css">css</option>
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
            <option value="java">java</option>
            <option value="css">css</option>
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
            <option value="java">java</option>
            <option value="css">css</option>
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
            <option value="java">java</option>
            <option value="css">css</option>
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
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
            <button type="submit" class="loginAndCreateButton">Create</button>
        </div>

</form>
</body>
</html>
