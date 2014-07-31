<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
    <title>Add field</title>

</head>
<body>

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
            <a class="navbar-brand" href="#"><img src="/resources/images/exadel-logo.png" class="exadel_logo"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="message">
            <span>
                1
            </span>
                    </div>
                </li>
                <li>
                    <span class="currUserName"><c:out value="${account}"></c:out></span>
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#groupAndName" role="tab" data-toggle="tab">Group and Name</a>
    </li>
    <li >
        <a href="#type" role="tab" data-toggle="tab">Type</a>
    </li>

</ul>

<div class="tab-content">

<div class="tab-pane active" id="groupAndName">
    <div class="spoilers">
        
        <div class="floatLeft addTech">
            <input type="radio" id="cg" name="group"/><label for="cg">Existing group:</label><br/>
            <select name="curGrup">
                <option value="common">Common</option>
                <option value="work">Work</option>
                <option value="project">Project</option>
            </select>

        </div>

        <div class="floatRight addTech">
        <input type="radio" id="newg" name="group"/><label for="newg">New Group</label><br/>
        <input type="text"/><br/>

            <label for="status">For Status</label>
            <select name="status" id="status">
                <option value="working">Working</option>
                <option value="studying">Studying</option>
            </select>
        </div>

        <div class="alignCenter paddingTop">
            <label for="fieldname">Field name:</label>
            <input type="text" id="fieldname"/>
        </div>
    </div>
</div>

<div class="tab-pane" id="type">

    <div class="spoilers">

        <div class="alignCenter borderBottom">
            <input type="radio" id="string" name="type" value="string"/><label for="string">String:</label>
            <input type="radio" id="text" name="type" value="text"/><label for="text">Text:</label>
        </div>
        <div class="alignCenter">
            <input type="radio" id="select" name="type"/><label for="select">Select:</label>
            <br/>
            <label for="value">Possible values (via ;)</label><br/>
            <textarea name="value" id="value" cols="30" rows="10" class="textOther"></textarea>
        </div>

    </div>

</div>

</div>

</body>
</html>