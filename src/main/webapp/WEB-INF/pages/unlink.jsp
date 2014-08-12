<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Unlinking</title>
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

</body>
</html>


<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#student" role="tab" data-toggle="tab">Feedbackers for student</a>
    </li>
    <li>
        <a href="#feed" role="tab" data-toggle="tab">Students for feedbacker</a>
    </li>

</ul>
<div class="tab-content" align="center">

        <div class="tab-pane active" id="student">
            <form:form commandName="unlinkUnit" method="post" action="/admin/unlink">
            <div class="spoilers">
                <div class="alignCenter">
                    <div class="group">
                        <label for="studentSelect">Student:</label>
                        <form:select path="student" id="studentSelect">
                            <form:option value=""></form:option>
                            <c:forEach items="${students}" var="student">
                                <form:option
                                        value="${student.login}">${student.firstName} ${student.secondName}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="group">
                        <label for="curators">Curators:</label>
                        <form:select path="curators" multiple="true" id="curators"/>
                    </div>
                    <div class="group">
                        <label for="interviewers">Interviewers:</label>
                        <form:select path="interviewers" multiple="true" id="interviewers"/>
                    </div>
                    <div class="buttons">
                        <button class="gray" onclick="history.back(); return false;">Cancel</button>
                        <button class="blue">Unlink</button>
                    </div>
                </div>
            </div>
            </form:form>
        </div>

        <div class="tab-pane " id="feed">
            <form:form>
            <div class="spoilers">
                <select>
                    <c:forEach items="${feeds}" var="feed">
                        <option value="${feed.login}">${feed.firstName} ${feed.secondName}</option>
                    </c:forEach>
                </select>
            </div>
            </form:form>
        </div>

</div>
<script>

    $(document).ready(function () {
        $('#studentSelect').change(
                function () {
                    var url = "curatorsForStudent?student=" + document.getElementById("studentSelect").value;
                    $.get(url, function (data) {
                        var select = document.getElementById("curators");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });

                    var url2 = "interviewersForStudent?student=" + document.getElementById("studentSelect").value;
                    $.get(url2, function (data) {
                        var select = document.getElementById("interviewers");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });
                }
        )
    });

</script>