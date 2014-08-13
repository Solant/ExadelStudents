<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>

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

<div class="tab-content" align="center">

    <div>
        <form action="/admin/deleteUser" method="post" class="spoilers" style="margin-top:80px">

            <h3>Delete user</h3>

            <div class="alignCenter">
                <label>User role</label>
                <select id="role" class="addTechField">
                    <option value="ROLE_STUDENT">Student</option>
                    <option value="ROLE_CURATOR">Feedbacker</option>
                    <option value="ROLE_WORKER">HRWorker</option>
                    <option value="ROLE_ADMIN">Admin</option>
                </select>
            </div>

            <div class="alignCenter" style="margin-top: 5px">
                <label>Full name (login)</label>
                <select name="userLogin" id="user">
                    <c:forEach items="${users}" var="user">
                        <option value="${user.login}">${user.secondName} ${user.firstName} (${user.login})</option>
                    </c:forEach>
                </select>
            </div>

            <br>

            <div class="alignCenter">
                <button type="button" onclick="history.back();return false;" class="gray">Cancel</button>
                <button type="submit" class="blue">Delete</button>
            </div>

        </form>
    </div>
</div>
</body>
</html>

<script>
    $('#role').change(
            function () {
                var url = "/admin/showUsersToDelete?role=" + document.getElementById("role").value;
                $.get(url, function (data) {

                    var userSelect = document.getElementById("user");
                    removeOptions(userSelect);

                    $.each(data, function (index, user) {
                        var option = document.createElement("option");
                        option.text = user.secondName + " " + user.firstName + " (" + user.login + ")";
                        option.value = user.login;
                        userSelect.add(option);
                    })
                });
            }
    )
</script>