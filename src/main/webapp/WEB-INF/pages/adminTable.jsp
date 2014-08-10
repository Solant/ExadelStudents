<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>

        <title>Admin | Table</title>
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



    <div class="saveTable">
        <h2>Resulting lookup table</h2>
        <a href="/admin/exportWord">
            <img src="/resources/images/word.jpg" alt="word" title="word"/>
        </a>
        <a href="/admin/exportPDF">
            <img src="/resources/images/pdf.jpg" alt="pdf" title="pdf"/>
        </a>
        <a href="/admin/exportExcel">
            <img src="/resources/images/excel.jpg" alt="excel" title="excel"/>
        </a>
    </div>

        <div id="searchTable">
            <table id="example" class="display">
			<thead>
				<c:forEach items="${tableData.get(0)}" var="item">
                    <td>
                    ${item}</td>
				</c:forEach>

                <td class="withImage">
                    <c:if test="${enable == 'enable'}">
                        Disable
                    </c:if>
                    <c:if test="${enable == 'disable'}">
                        Enable
                    </c:if>
                </td>
			</thead>
                <tbody>
                <c:forEach items="${tableData}" var="student" begin="1" varStatus="index">
                        <tr<c:if test="${enable != 'enable'}"> class="notLinking" </c:if>>
                            <c:forEach items="${student}" var="item" >
                                <td>
                                    <c:if test="${enable == 'enable'}">
                                        <a href="/admin/studentPage/${student.get(1)}">
                                    </c:if>
                                    ${item}
                                    </a>
                                </td>
                            </c:forEach>

                                <td class="withImage">
                                    <c:if test="${enable == 'enable'}">
                                        <a href="/admin/${index.count}/disable">
                                            <img src="/resources/images/fired.png" class="studentStatusImage">
                                        </a>
                                    </c:if>
                                    <c:if test="${enable == 'disable'}">
                                        <a href="/admin/${index.count}/enable">
                                            <img src="/resources/images/add.png" class="studentStatusImage">
                                        </a>
                                    </c:if>
                                </td>
                        </tr>
                </c:forEach>
                </tbody>
    </table>
    </div>

    </body>
    </html>