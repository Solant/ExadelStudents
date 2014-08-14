<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Create Letter</title>
    <%@include file="/WEB-INF/pages/commonParts/allIncluded.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/pages/commonParts/AdminHat.jsp" %>
<ul class="nav nav-tabs" role="tablist">
    <li >
        <a href="/admin/showAddUser">User</a>
    </li>
    <li>
        <a href="/admin/showAddField/true">Field</a>
    </li>
    <li>
        <a href="/admin/showAddField/false">Technology</a>
    </li>
    <li class="active">
        <a href="/admin/createNotif" role="tab" data-toggle="tab">Notification</a>
    </li>
</ul>
<form:form commandName="createNotifUnit" action="/admin/sendNotif" method="post" class="createNotificationForm">
<h1>Create notification</h1>
    <div class="leftList">
        <form:checkbox path="forStudents" id="students"/>
        <label for="students">All students: </label><br/>
        <form:select path="students" name="students" multiple="true">
            <c:forEach items="${students}" var="student">
                <form:option value="${student.login}">${student.firstName} ${student.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="centerList">
        <form:checkbox path="forFeedbackers" id="feedbackers"/>
        <label for="feedbackers">All feedbackers: </label><br/>
        <form:select path="feedbackers" name="feedbackers" multiple="true">
            <c:forEach items="${feedbackers}" var="feedbacker">
                <form:option value="${feedbacker.login}">${feedbacker.firstName} ${feedbacker.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="rightList">
        <form:checkbox path="forWorkers" id="workers"/>
        <label for="workers">All workers: </label><br/>
        <form:select path="workers" name="workers" multiple="true">
            <c:forEach items="${workers}" var="worker">
                <form:option value="${worker.login}">${worker.firstName} ${worker.secondName}</form:option>
            </c:forEach>
        </form:select>
    </div>

    <div class="subject"><form:input path="title" type="text" id="subject" value="Subject"/></div>
    <div class="letterText">
        <form:textarea path="text" name="text" id="text" cols="30" rows="10"/>
    </div>

    <div class="alignCenter">
        <button class="gray" onclick="history.back(); return false;">Cancel</button>
        <button class="blue" id="send">Send</button>
    </div>
    <div id="confirm_password">
        <span id="modal_close">&times;</span>

        <div class="alignCenter">
            <h4>Confirm email password</h4>
            <div class="confPassInput">
                <form:input id="password" type="password" path="password" placeholder="Password"/>
            </div>
                <button type="button" class="gray" id="cancel_button">Cancel</button>
                <form:button class="blue" id="sendButton">Send</form:button>
        </div>
    </div>

</form:form>

<div id="overlay"></div>

<script>
    document.getElementById("send").onclick = function (event) {
        event.preventDefault();
        $('#overlay').fadeIn(400, // сначала плавно показываем темную подложку
                function () { // после выполнения предыдущей анимации
                    $('#confirm_password')
                            .css('display', 'block') // убираем у модального окна display: none;
                            .animate({opacity: 1, top: '50%'}, 200); // плавно прибавляем прозрачность одновременно со съезжанием вниз

                });
        /* Закрытие модального окна, тут делаем то же самое но в обратном порядке */
        $('#modal_close, #overlay, #cancel_button, #save_button').click(function () { // ловим клик по крестику или подложке
            $('#confirm_password')
                    .animate({opacity: 0, top: '45%'}, 200,  // плавно меняем прозрачность на 0 и одновременно двигаем окно вверх
                    function () { // после анимации
                        $(this).css('display', 'none'); // делаем ему display: none;
                        $('#overlay').fadeOut(400); // скрываем подложку
                    }
            );
        });
        event = event || window.event; // Кроссбраузерно получить событие
        if (event.stopPropagation) { // существует ли метод?
            // Стандартно:
            event.stopPropagation();
        } else {
            event.cancelBubble = true;
        }
    }
</script>
</body>
</html>