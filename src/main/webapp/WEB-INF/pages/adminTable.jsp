<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <c:if test="${enable == 'enable'}">
            <td class="withImage">
                Disable
            </td>
        </c:if>
        <c:if test="${enable == 'disable'}">
            <td class="withImage">
                Enable
            </td>
        </c:if>
        </thead>
        <tbody>
        <c:forEach items="${tableData}" var="student" begin="1" varStatus="index">
            <tr<c:if test="${enable != 'enable'}"> class="notLinking" </c:if>>
            <c:forEach items="${student}" var="item">
                <td>
                    <c:if test="${enable == 'enable'}">
                    <a href="/admin/studentPage/${student.get(1)}">
                        </c:if>
                            ${item}
                    </a>
                </td>
            </c:forEach>

            <c:if test="${enable == 'enable'}">
                <td class="withImage">
                    <a name="deleteTd" id="${index.count}"
                       href="#myModal"<%--href="/admin/${index.count}/disable" --%> <%--data-toggle="modal" data-target="#myModal" --%>>
                        <img src="/resources/images/fired.png" class="studentStatusImage">
                    </a>
                </td>
            </c:if>
            <c:if test="${enable == 'disable'}">
                <td class="withImage">
                    <a href="/admin/${index.count}/enable">
                        <img src="/resources/images/add.png" class="studentStatusImage">
                    </a>
                </td>
            </c:if>
            </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>


<div id="modal_form">
    <span id="modal_close">&times;</span>
    <div class="alignCenter">
        <form action="/admin/${index.count}/disable">
        <h4>Disable student</h4>
        <label>Reason:</label>
        <div class="group">
            <textarea class="textOther" name="reason"></textarea>
        </div>
        <input type="hidden" name="studentNumber" id="studentNumber"/>
        <button type="button" class="gray" id="close_button">Close</button>
        <button type="submit" class="blue">Save</button>
        </form>
    </div>
</div>
<div id="overlay"></div>

<script>
    $.each(document.getElementsByName('deleteTd'), function (index, krestik) {
        krestik.onclick = function (event) {
            document.getElementById("studentNumber").value = krestik.id;
            event.preventDefault(); // выключаем стандартную роль элемента
            $('#overlay').fadeIn(400, // сначала плавно показываем темную подложку
                    function () { // после выполнения предъидущей анимации
                        $('#modal_form')
                                .css('display', 'block') // убираем у модального окна display: none;
                                .animate({opacity: 1, top: '50%'}, 200); // плавно прибавляем прозрачность одновременно со съезжанием вниз

                    });
            /* Закрытие модального окна, тут делаем то же самое но в обратном порядке */
            $('#modal_close, #overlay').click(function () { // ловим клик по крестику или подложке
                $('#modal_form')
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
    })

</script>