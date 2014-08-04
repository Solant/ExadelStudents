<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>Admin | Table</title>
	<head>

        <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="/resources/styles/style.css">
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.1/css/jquery.dataTables.css">

        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" class="init">
            $(document).ready(function() {
                $('#example').dataTable();
            } );
        </script>

    </head>
	<body>

    <nav class="navbar navbar-blue navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form method="get">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <button formaction="/admin/returnCreate" class="btn">
                                <img src="/resources/images/add.png" class="adminMenuImages">
                                <span>Add User</span>
                            </button>
                        </li>
                        <li>
                            <button formaction="/admin/showLinkStudent" class="btn">
                                <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                                <span>Link Student</span>
                            </button>
                        </li>
                        <li>
                            <button formaction="/admin/showDisabled" class="btn">
                                <img src="/resources/images/fired.png" class="adminMenuImages">
                                <span>Disabled Students</span>
                            </button>
                        </li>
                        <li>
                            <button formaction="/admin/createNotif" class="btn">
                                <img src="/resources/images/message1.png" class="adminMenuImages">
                                <span>Create notification</span>
                            </button>
                        </li>
                        <li>
                            <a href="/notif">
                                <div class="message">
                                    <c:if test="${notifNumber > 0}">
                                <span>
                                        ${notifNumber}
                                </span>
                                    </c:if>
                                </div>
                            </a>
                        </li>
                        <li>
                            <span class="currUserName"><c:out value="${account}"></c:out></span>
                        </li>
                        <li>
                            <a href="<c:url value="/admin"/> ">
                                <img src="/resources/images/loupe.png" class="account_logo">
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="j_spring_security_logout" />">
                                <img src="/resources/images/exit.png" class="exit_logo">
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/account"/> ">
                                <img src="/resources/images/account.png" class="account_logo">
                            </a>
                        </li>
                    </ul>
                </form>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>


    <div class="saveTable">
        Save as: <br/>
        <a href="/admin/exportWord">
            <img src="/resources/images/word.jpg" alt="word" title="word"/>
        </a>
        <a href="/admin/exportPDF">
            <img src="/resources/images/pdf.jpg" alt="pdf" title="pdf"/>
        </a>
        <a href="/admin/exportExcel">
            <img src="/resources/images/exel.jpg" alt="exel" title="exel"/>
        </a>
    </div>

        <div id="searchTable">
            <table id="example" class="display">
			<thead>
				<c:forEach items="${tableData.get(0)}" var="item">
                    <td>
                    ${item}</td>
				</c:forEach>
			</thead>
                <tbody>
                <c:forEach items="${tableData}" var="student" begin="1">
                        <tr>
                            <c:forEach items="${student}" var="item">
                                <td>
                                    <a href="/admin/studentPage/${student.get(1)}">${item}</a></td>
                            </c:forEach>
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
