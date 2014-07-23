
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css"><%--
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">--%>
</head>
<body>
<div class="hat">
    <img src="/resources/images/exadel-logo.png" class="exadel_logo">

    <a href="account.jsp">
        <img src="/resources/images/account.png" class="account_logo">
    </a>
    <a href="<c:url value="j_spring_security_logout" />"><img src="/resources/images/exit.png" class="exit_logo"></a>
    <span class="currUserName"><c:out value="${account}"></c:out></span>
    <img src="/resources/images/loupe.png" class="loupe_logo">

    <span class="bookmarks"> <a href="../../linking.jsp"> My Students </a> </span>
    <span class="bookmarks"> <a href> All Students </a> </span>
    <span class="bookmarks"> <a href> Interviews  </a> </span>
</div>
<form class="linkingForm" >
<div class="radio">
    <input type="radio" name="feedbacking" value="Interview" id="Interview"><label for="Interview">Interview</label>

    <input type="radio" name="feedbacking" value="Curating" id="Curating"><label for="Curating">Curating</label>
</div>
        <select multiple class="linkingL">
            <option value="A">A</option>
            <option value="A">B</option>
            <option value="A">C</option>
            <option value="A">D</option>
            <option value="A">E</option>
            <option value="A">F</option>
            <option value="A">G</option>
            <option value="A">H</option>
            <option value="A">K</option>
            <option value="A">L</option>
            <option value="A">M</option>
            <option value="A">N</option>
        </select>
        <select multiple class="linkingR">
            <option value="A">A</option>
            <option value="A">B</option>
            <option value="A">C</option>
            <option value="A">D</option>
            <option value="A">E</option>
            <option value="A">F</option>
            <option value="A">G</option>
            <option value="A">H</option>
            <option value="A">K</option>
            <option value="A">L</option>
            <option value="A">M</option>
            <option value="A">N</option>
        </select>
    <div class="button">
        <div>
            <button  class="button">Linking</button>
            <button  class="button">Cancel</button>
        </div>
    </div>
</form>
</body>
</html>