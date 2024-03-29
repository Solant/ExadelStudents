<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Admin</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>

</head>
<body>

<%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>

<div align="center">
    <ul class="nav nav-tabs" role="tablist">

        <%pageContext.setAttribute("isActive", "active");%>

        <c:forEach items="${groups}" var="groupNameExist" varStatus="index">
            <li class="${isActive}">
                <a href="#${index.count}" role="tab" data-toggle="tab">${groupNameExist}</a>
            </li>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>


    </ul>

    <h2>Filtering options</h2>

    <div id="hatSelect">
        <div class="hsFloatLeft">Field name</div>
        <div class="inTable">
            <span class="dropt">?
                <span>Show this column in generated table</span>
            </span>
        </div>
        <div class="hsFloatRight">Filter parameters</div>
    </div>
    <form:form commandName="groupedValues" class="spoilers" method="post" action="/admin/formTable">
    <div class="tab-content">


        <%pageContext.setAttribute("isActive", "active");%>
        <c:forEach items="${groupedValues.valuesArray}" varStatus="index1">
            <div class="tab-pane ${isActive}" id="${index1.count}">
            <%--<input type="checkbox" name="allChecks" id="allChecks${index1.count}">--%>

                <c:forEach items="${groupedValues.valuesArray[index1.count-1].gavs}" varStatus="index2" var="attr">
                    <div class="group">

                        <label>${attr.attribute}</label>
                        <c:if test="${attr.type == 'text'}">
                            <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                        </c:if>
                        <c:if test="${attr.type == 'textarea'}">
                            <form:textarea cssClass="textOther"
                                           path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"/>
                        </c:if>
                        <c:if test="${attr.type == 'select'}">
                            <form:select path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value">
                                <form:option value=""></form:option>
                                <form:options items="${attr.possibleValues}"></form:options>
                            </form:select>
                        </c:if>
                        <c:if test="${attr.type == 'date'}">
                            <form:input path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].value"
                                        type="date"/>
                        </c:if>
                        <c:if test="${attr.type == 'list'}">
                            <form:select multiple="true"
                                         path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].values">
                                <form:options items="${attr.possibleValues}"/>
                            </form:select>
                        </c:if>
                        <div class="checkboxAligning"><form:checkbox class="check${index1.count-1}"
                                                                     path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].show"
                                                                     cssStyle="width: 20px; margin-left: 5px;"/></div>
                        <form:input class="hidden"
                                    path="valuesArray[${index1.count-1}].gavs[${index2.count-1}].attribute"/>
                    </div>
                </c:forEach>

            </div>
            <%pageContext.setAttribute("isActive", "");%>
        </c:forEach>
        <form:button type="submit" class="blue">Form table</form:button>
        </form:form>
    </div>

</body>
</html>


<%--
<script>
    $(document).ready(function () {
        $.each(document.getElementsByName('allChecks'), function (index1, elem1) {
            elem1.onclick = function (event) {
                $.each(document.getElementsByClassName('check' + index1), function (index, elem) {
                    elem.checked = !elem.checked;
                })
            }
        })
    })

</script>
--%>

