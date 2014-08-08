<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>

        <title>Admin | Table</title>
        <%@include file="/WEB-INF/pages/allIncluded.jsp" %>

    </head>
	<body>

    <c:if test="${role == 'STUDENT'}">
        <%@include file="/WEB-INF/pages/StudentHat.jsp" %>
    </c:if>
    <c:if test="${role == 'CURATOR'}">
        <%@include file="/WEB-INF/pages/FBhat.jsp" %>
    </c:if>
    <c:if test="${role == 'WORKER'}">
        <%@include file="/WEB-INF/pages/HRWhat.jsp" %>
    </c:if>
    <c:if test="${role == 'ADMIN'}">
        <%@include file="/WEB-INF/pages/AdminHat.jsp" %>
    </c:if>

    <div class="saveTable">
        Save as: <br/>
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
                <%--<tbody>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                <tr>
                    <td>Ivanov Ivan</td>
                    <td>22.07.2014</td>
                    <td>FAMCS</td>
                    <td>3/3</td>
                    <td>2017</td>
                    <td>30</td>
                    <td>Billable</td>
                    <td>Developer(20.07.2014)</td>
                    <td>Java, Hibernate</td>
                    <td>Intermediate</td>
                </tr>
                </tbody>
            <tfoot>
                <td> Name </td>
                <td> Hire date </td>

                <td> Faculty </td>
                <td> Course/Group </td>

                <td> Year of graduation </td>
                <td> Number of hours </td>

                <td> Billable </td>
                <td> Role on Project </td>

                <td> Technology </td>
                <td> English </td>
            </tfoot>--%>
