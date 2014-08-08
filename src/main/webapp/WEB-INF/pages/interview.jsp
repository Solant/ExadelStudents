<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Interview</title>

    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>



</div>
<form:form commandName="review" action="/curator/${account}/addRatingReview" method="post" class="reviewForm" >
    <form:input hidden="true" path="student.login" />
    <form:input hidden="true" path="fromInterview" />
        <div class="alignCenter">
            <h1 >Review Form </h1>
        </div>


    <p>
        <label for="lastname">Lastname:</label>
        <input class="field" type="text" id="lastname" value="${review.student.secondName}" readonly>
    </p>

    <p>
        <label for="firstname">Firstname:</label>
        <input class="field" type="text" id="firstname" value="${review.student.firstName}" readonly>
    </p>


    <c:forEach begin="0" end="4" var="i">

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

    <div class="alignCenter">
        <label for="other">Other:</label><br/>
        <form:textarea path="comment" name="other" id="other" cols="30" rows="10" class="textOther"/>
        <button type="submit" class="loginAndCreateButton">Save</button>
        <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
    </div>

</form:form>
</body>
</html>
