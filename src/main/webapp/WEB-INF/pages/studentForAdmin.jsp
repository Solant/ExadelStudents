<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Student's page</title>
    <%@include file="/WEB-INF/pages/allIncluded.jsp" %>
</head>
<body>

<%@include file="/WEB-INF/pages/AdminHat.jsp" %>

<div align="center">
    <div class="profile">
        <img src="/resources/images/account.png">
        <c:out value="${currentUser.firstname}"></c:out>
        <c:out value="${currentUser.lastname}"></c:out>
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


    <form:form commandName="groupedValues" class="spoilers">

    <div class="tab-content">

            <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
        <div class="tab-pane ${isActive}" id="${groupedValues.valuesArray[index1.count-1].gavs[0].getGroup()}">
            <!-- Petya -->
            <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2">
            <div class="group">
                <label >${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].attribute} </label>
                <form:checkbox  path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].show" value="yes" cssStyle="width: 20px"/>
                <c:if test="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].type == 'text'}">
                    <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                </c:if>
                <c:if test="${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].type == 'textarea'}">
                    <form:textarea path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value" />
                </c:if>
                <form:input hidden="true" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute" />
            </div>
            </c:forEach>
                <button formmethod="post" formaction="/admin/studentPage/${currentUser.login}/saveChanges" type="submit" >Save</button>

        </div>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>
        <button formaction="/admin/studentPage/${currentUser.login}/formTable" type="submit" >Form table</button>
                </div>
                </form:form>
    </body>
</html>

