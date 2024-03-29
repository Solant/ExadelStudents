<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Interview</title>

    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<sec:authorize access="hasRole('ROLE_STUDENT')">
    <%@include file="/WEB-INF/pages/commonParts/StudentHat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_CURATOR')">
    <%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_WORKER')">
    <%@include file="/WEB-INF/pages/commonParts/HRWhat.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>
</sec:authorize>



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
    </div>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_WORKER')">
        <div class="alignCenter">
            Feedbacker: ${review.feedbacker.secondName} ${review.feedbacker.firstName} ,
            email: ${review.feedbacker.email}.
        </div>
    </sec:authorize>

    <div class="alignCenter">
        <button class="gray" onclick="history.back(); return false;">Cancel</button>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="submit" class="blue">Save</button>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_CURATOR')">
            <button type="submit" class="blue">Save</button>
        </sec:authorize>

    </div>

</form:form>
</body>
</html>
