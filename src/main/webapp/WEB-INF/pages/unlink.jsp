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
        <form:form commandName="unlinkUnit" cssClass="unlinkingForm" method="post" action="/admin/unlink">

            <h1>Unlinking Form</h1>

            <div>
                <label for="studentSelect">Student:</label><br/>
                <form:select path="student" id="studentSelect">
                    <form:option value=""></form:option>
                    <c:forEach items="${students}" var="student">
                        <form:option value="${student.login}">${student.firstName} ${student.secondName}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="leftMultiple">
                <label for="curators">Curators:</label><br/>
                <form:select path="curators" multiple="true" id="curators"/>
            </div>

            <div class="rightMultiple">
                <label for="interviewers">Interviewers:</label><br/>
                <form:select path="interviewers" multiple="true" id="interviewers"/>
            </div>

            <div class="buttons">
                <button class="gray" onclick="history.back(); return false;">Cancel</button>
                <button class="blue">Unlink</button>
            </div>
        </form:form>
    </div>

    <div class="tab-pane " id="feed">
        <form:form commandName="unlinkUnit" cssClass="unlinkingForm" method="post" action="/admin/unlink">

            <h1>Unlinking Form</h1>

            <div >
                <label for="feedSelect">Feedbacker:</label><br/>
                <form:select path="student" id="feedSelect">
                    <form:option value=""></form:option>
                    <c:forEach items="${feeds}" var="feed">
                        <form:option
                                value="${feed.login}">${feed.firstName} ${feed.secondName}</form:option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="leftMultiple">
                <label for="curators">Curated:</label>
                <form:select path="curators" multiple="true" id="curated"/>
            </div>

            <div class="rightMultiple">
                <label for="interviewers">Interviewed:</label>
                <form:select path="interviewers" multiple="true" id="interviewed"/>
            </div>

            <div class="buttons">
                <button class="gray" onclick="history.back(); return false;">Cancel</button>
                <button class="blue">Unlink</button>
            </div>
        </form:form>
    </div>

</div>
<script>

    $(document).ready(function () {
        $('#studentSelect').change(
                function () {
                    var url = "/admin/unlink/curatorsForStudent?student=" + document.getElementById("studentSelect").value;
                    $.get(url, function (data) {
                        var select = document.getElementById("curators");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName+' '+feedbacker.firstName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });

                    var url2 = "/admin/unlink/interviewersForStudent?student=" + document.getElementById("studentSelect").value;
                    $.get(url2, function (data) {
                        var select = document.getElementById("interviewers");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName+' '+feedbacker.firstName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });
                }
        )
    });


    $(document).ready(function () {
        $('#feedSelect').change(
                function () {
                    var url = "/admin/unlink/curatedForFeed?student=" + document.getElementById("feedSelect").value;
                    $.get(url, function (data) {
                        var select = document.getElementById("curated");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName+' '+feedbacker.firstName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });

                    var url2 = "/admin/unlink/interviewedForFeed?student=" + document.getElementById("feedSelect").value;
                    $.get(url2, function (data) {
                        var select = document.getElementById("interviewed");
                        removeOptions(select);

                        var obj = data;

                        $.each(data, function (index, feedbacker) {
                            var option = document.createElement("option");
                            option.text = feedbacker.secondName+' '+feedbacker.firstName;
                            option.value = feedbacker.login;
                            select.add(option);
                        })
                    });
                }
        )
    });

</script>