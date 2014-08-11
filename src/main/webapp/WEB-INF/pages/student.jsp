<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
    <head lang="en">
        <title>Student's page</title>
        <%@ include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
    </head>
    <body>

    <%@ include file="/WEB-INF/pages/commonParts/StudentHat.jsp" %>

    <div align="center">
        <ul class="nav nav-tabs" role="tablist">
            <%pageContext.setAttribute("isActive", "active");%>
            <c:forEach items="${groups}" var="groupName" varStatus="index">
                <li class="${isActive}">
                    <a href="#${index.count}" role="tab" data-toggle="tab">${groupName}</a>
                </li>
                <%pageContext.setAttribute("isActive", "");%>
            </c:forEach>
        </ul>

        <form:form commandName="groupedValues" class="spoilers" method="post" action="/student/saveChanges">

            <div class="tab-content">
            <p class="errorText">
                <form:errors path="*"/>
            </p>

            <%pageContext.setAttribute("isActive", "active");%>

            <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
                <div class="tab-pane ${isActive}" id="${index1.count}">
                    <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
                        <div class="group">
                            <label>${groupedValues.valuesArray[index1.count-1].gavs[index2.count-1].attribute} </label>
                            <c:if test="${attr.type == 'text'}">
                                <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                            </c:if>
                            <c:if test="${attr.type == 'textarea'}">
                                <form:textarea path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                            </c:if>
                            <c:if test="${attr.type == 'select'}">
                                <form:select path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value">
                                    <form:option value=""></form:option>
                                    <form:options items="${attr.possibleValues}"></form:options>
                                </form:select>
                            </c:if>

                            <c:if test="${attr.type == 'date'}">
                                <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"  type="date"/>
                            </c:if>
                            <c:if test="${attr.type == 'list'}">
                                <form:select multiple="true" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].values">
                                    <form:options items="${attr.possibleValues}" />
                                </form:select>
                            </c:if>
                            <form:input class="hidden" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute"/>
                            <form:input class="hidden" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].type"/>
                            <form:input class="hidden" path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].group"/>
                        </div>
                    </c:forEach>
                    <form:button type="submit" class="blue">Save</form:button>

                </div>
                <%pageContext.setAttribute("isActive", "");%>
            </c:forEach>
        </div>

        </form:form>

    </body>
</html>

