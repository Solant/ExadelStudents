<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Choose technology</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/commonParts/FBhat.jsp" %>
<div align="center">
<form:form commandName="chooseTechUnit" class="loginAndCreateForm" action="/curator/chooseTech" method="post">

        <div class="largeSelect alignCenter
        ">
            <h4 for="myTechs">My technologies:</h4>
            <form:select path="myTechs" type="text"  id="myTechs" multiple="true">
                <form:options items="${techs}"/>
            </form:select>
        </div>


        <div class="alignCenter">
            <button type="submit" onclick="history.back();return false;" class="gray">Cancel</button>
            <button type="submit" class="blue">Save</button>
        </div>

</form:form>

</div>