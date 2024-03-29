<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
            <a class="navbar-brand" href="/"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form method="get">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <button formaction="/curator/myStudents" type="submit" class="btn <c:if test="${feedbackerRole=='asCurator'}">btnActive</c:if>" id="myStudents">
                        <span>My Students</span>
                        </button>
                    </li>
                    <li>
                        <button formaction="/curator/interview" type="submit" class="btn <c:if test="${feedbackerRole=='asInterviewer'}">btnActive</c:if>">
                        <span>Interviews</span>
                        </button>
                    </li>
                    <li>
                        <button formaction="/curator/showChooseTech" type="submit" class="btn <c:if test="${feedbackerRole=='myTechs'}">btnActive</c:if>">
                            <span>My technologies</span>
                        </button>
                    </li>
                    <li>
                        <a href="/notif">
                            <div class="message">
                            <span id="numberOfNotifications" class="disappear">
                            </span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <span class="currUserName"><sec:authentication property="principal.username" /></span>
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

