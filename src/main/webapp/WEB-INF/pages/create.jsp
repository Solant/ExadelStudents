<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
  <title>Create</title>

    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
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


<form:form commandName="newUser" cssClass="loginAndCreateForm" action="/admin/createUser" method="post">
		<h1>Adding user Form </h1>
        <p class="errorText">
            <form:errors path="*" />
        </p>
            <p>
				<label for="login">Login:</label>
				<form:input path="login" type="text" name="login" id="login" class="field" />
			</p>
			
			<p>
				<label for="password">Password:</label>
				<form:input path="password" type="password" id="password" class="field" />
			</p>


			<p>
				<label for="person">User's post:</label>
				<form:select path="role" id="person" class="field">
                    <form:option value="Student">Student</form:option>
                    <form:option value="Feedbacker">Feedbacker</form:option>
                    <form:option value="HRWorker">HR worker</form:option>
                    <c:if test="${role == 'ADMIN'}"><form:option value="Admin">Admin</form:option></c:if>
                </form:select>
			</p>
      <%--  <p>
            <label for="person">User's status:</label>
            <form:select path="role" id="person" class="field">
                <form:option value="WORKING">Working</form:option>
                <form:option value="STUDYING">Studying</form:option>
            </form:select>
        </p>--%>

        <p>
            <label for="lastname">Lastname:</label>
            <form:input path="lastname" type="text" id="lastname" class="field" />
        </p>
		
		<p>
			<label for="firstname">Firstname:</label>
			<form:input path="firstname" type="text" id="firstname" class="field" />
		</p>

            <div class="alignCenter">
                <button class="gray" onclick="history.back(); return false;">Cancel</button>
			    <button type="submit" class="blue">Create</button>
		     </div>
		
	</form:form>
</body>

</html>