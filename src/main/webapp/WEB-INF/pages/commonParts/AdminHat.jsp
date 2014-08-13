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
            <div class="navbar-form navbar-left" role="search">
                <div class="form-group relative">
                    <input type="text" class="form-control" placeholder="Search Student" id="search" autocomplete="off">
                    <div id="searchResult" class="list-group"></div>
                </div>
            </div>
            <form method="get">
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Students
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">

                            <li>
                                <button formaction="/admin/showEnabled" class="btn">
                                    <span>Enabled</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showStudying" class="btn">
                                    <span>Studying</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showWorking" class="btn">
                                    <span>Working</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showDisabled" class="btn">
                                    <span>Disabled</span>
                                </button>
                            </li>

                        </ul>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Actions
                            <span class="caret"></span></a>

                        <ul class="dropdown-menu" role="menu">

                            <li class="dropdown-submenu">
                                <button formaction="#" class="btn">
                                    <img src="/resources/images/add.png" class="adminMenuImages">
                                    <span>Add</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <button formaction="/admin/returnCreate" class="btn">
                                            <span>User</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showAddField/true" class="btn">
                                            <span>Field</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showAddField/false" class="btn">
                                            <span>Technology</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/createNotif" class="btn">
                                            <span>Notification</span>
                                        </button>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown-submenu">
                                <button formaction="#" class="btn">
                                    <img src="/resources/images/wrench.png" class="adminMenuImages">
                                    <span>Change</span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <button formaction="/admin/showChangeField/field" class="btn">
                                            <span>Field</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showChangeField/group" class="btn">
                                            <span>Group</span>
                                        </button>
                                    </li>
                                    <li>
                                        <button formaction="/admin/showChangeField/tech" class="btn">
                                            <span>Technology</span>
                                        </button>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <button formaction="/admin/deleteUser" class="btn">
                                    <img src="/resources/images/fired.png" class="adminMenuImages">
                                    <span>Delete User</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showLinkStudent" class="btn">
                                    <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                                    <span>Link Student</span>
                                </button>
                            </li>

                            <li>
                                <button formaction="/admin/showUnlink" class="btn">
                                    <img src="/resources/images/yellow-unlink.png" class="adminMenuImages">
                                    <span>Unlink Student</span>
                                </button>
                            </li>


                            <li class="divider"></li>
                            <li>
                                <button formaction="/admin/" class="btn">
                                    <img src="/resources/images/loupe.png" class="adminMenuImages">
                                    <span>Filtration</span>
                                </button>
                            </li>

                            <%--

                            /////////////////////////////////////////////////////////////////////
                                                        <li class="dropdown-submenu"> <a href="#">More..</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="#">Level 3</a>
                                                                </li>
                                                                <li><a href="#">Level 3</a>
                                                                </li>
                                                                <li class="dropdown-submenu"> <a href="#">More..</a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="#">Level 4</a>
                                                                        </li>
                                                                        <li><a href="#">Level 4</a>
                                                                        </li>
                                                                        <li class="dropdown-submenu"> <a href="#">More..</a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a href="#">Level 5</a>
                                                                                </li>
                                                                                <li><a href="#">Level 5</a>
                                                                                </li>
                                                                            </ul>
                                                                        </li>

                                                                    </ul>
                                                                </li>

                                                            </ul>
                                                        </li>
                            //////////////////////////////////////////////////////////////////
                            --%>

                        </ul>
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

