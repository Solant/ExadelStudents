<%@ page import="com.services.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a href="<c:url value="/admin/${currentUser.login}/account"/> "><img src="/resources/images/account.png"></a>
        <c:out value="${currentUser.firstname}"></c:out>
        <c:out value="${currentUser.lastname}"></c:out>
        <a href="/admin/${currentUser.login}/allFeedbacks">
            All feedbacks
        </a>
    </div>
    <a href="/admin/studentPage/${currentUser.login}/notif">
        <div class="message">
        </div>
    </a>

    <ul class="nav nav-tabs" role="tablist">

        <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groups}" var="groupName" varStatus="index">
            <li class="${isActive}">
                <a href="#${index.count}" role="tab" data-toggle="tab">${groupName}</a>
            </li>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>


    </ul>


    <form:form commandName="groupedValues" class="spoilers">

    <p class="errorText">
        <form:errors path="*" />
    </p>

    <div class="tab-content">

        <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
            <div class="tab-pane ${isActive}" id="${index1.count}">
                <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
                    <div class="group">
                        <label>${attr.attribute} </label>
                        <form:checkbox path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].show" value="yes"
                                       cssStyle="width: 20px"/>
                        <c:if test="${attr.type == 'text'}">
                            <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                        </c:if>
                        <c:if test="${attr.type == 'textarea'}">
                            <form:textarea path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
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
                        <form:input hidden="true"
                                    path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute"/>
                        <form:input hidden="true"
                                    path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].type"/>
                        <form:input hidden="true"
                                    path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].group"/>
                    </div>
                </c:forEach>
            </div>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>
        <button formmethod="post" formaction="/admin/studentPage/${currentUser.login}/saveChanges" type="submit">Save
        </button>

        <button formaction="/admin/studentPage/${currentUser.login}/formTable" type="submit">Form table</button>
    </div>
    </form:form>
</body>
</html>

