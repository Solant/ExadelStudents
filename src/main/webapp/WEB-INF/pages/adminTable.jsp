
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
    <div class="hat">
        <form method="get">
            <img src="/resources/images/exadel-logo.png" class="exadel_logo">
            <a href="<c:url value="/account"/> ">
                <img src="/resources/images/account.png" class="account_logo">
            </a>
            <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
            <span class="currUserName"><c:out value="${account}"></c:out></span>
            <a href="<c:url value="/admin"/> "><img src="/resources/images/loupe.png" class="loupe_logo"></a>

            <button formaction="/admin/returnCreate" class="btn">
                <img src="/resources/images/add.png" class="add_logo" width="25px">
                <span>Add User</span>
            </button>
            <button formaction="/admin/linkStudent" class="btn">
                <img src="/resources/images/yellow-link.png"  height="23px">
                <span>Link Student</span>
            </button>
            <button formaction="#" class="btn">
                <img src="/resources/images/fired.png"  width="25px">
                <span>Fired Students</span>
            </button>
        </form>
    </div>

    </form>
    </div>


		<div class="skyBox"></div>
        <div id="table">
            <table border = 1 id="example">
			<thead>
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
			</thead>
                <tbody>
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
            </tfoot>
		</table>
		</div>
		
	</body>
</html>