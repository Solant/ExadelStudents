
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Linking</title>
    <link href="/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/styles/style.css" />
    <script src="/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/resources/styles/bootstrap/js/bootstrap.min.js"></script>
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
                    <button formaction="/admin/returnCreate" class="btn">
                        <img src="/resources/images/add.png" class="adminMenuImages">
                        <span>Add User</span>
                    </button>
                </li>
                <li>
                    <button formaction="/admin/linkStudent" class="btn">
                        <img src="/resources/images/yellow-link.png" class="adminMenuImages">
                        <span>Link Student</span>
                    </button>
                </li>
                <li>
                    <button formaction="#" class="btn">
                        <img src="/resources/images/fired.png" class="adminMenuImages">
                        <span>Disabled Students</span>
                    </button>
                </li>
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


<form class="linkingForm" >
<div class="radio">
    <input type="radio" name="feedbacking" value="Interview" id="Interview"><label for="Interview">Interview</label>

    <input type="radio" name="feedbacking" value="Curating" id="Curating"><label for="Curating">Curating</label>
</div>
    <div class="linkingL">
        <label for="students">Students</label><br/>
            <select multiple id="students">
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
    </div>

    <div  class="linkingR">
        <label for="feedbackers">Feedbackers</label><br/>
            <select multiple id="feedbackers">

            </select>
    </div>

    <div class="technology">
        <label for="techList">Technology:</label><br/>
        <select name="technology" id="techList"
                onchange="adding();">
            <option value="none">None</option>
            <option value="all">All</option>
            <option value="html">HTML</option>
            <option value="css">CSS</option>
            <option value="hibernate">hibernate</option>
        </select>
    </div>

    <div class="button">
            <button  class="button">Link</button>
            <button class="loginAndCreateButton" onclick="history.back(); return false;">Cancel</button>
    </div>

    <script>
        $(document).ready(function(){
           $('#techList').change(
                   function(){
                       $.ajax({
                           type: GET,
                           url:'someController',
                           data: $("#techList option:selected").value,
                           dataType: "json",
                           success: function (data){
                               var select=document.getElementById("feedbackers");
                               removeOptions(select);

                               var obj= $.parseJSON(data);

                               $.each("feedbackers",function(index, feedbacker){
                                   $.each(feedbacker,function (key, value){
                                       var option = document.createElement("option");
                                       option.text=feedbacker.lastName;
                                       option.value=feedbacker.login;
                                   })
                               })
                           }
                       });
                   }
           )
        });
    </script>

    <script type="text/javascript">

      function removeOptions(selectbox)
      {
          var i;
          for(i=selectbox.options.length-1;i>=0;i--)
          {
              selectbox.remove(i);
          }
      }

     /* function adding() {
          var txt = '{"feedbackers":[' +
                  '{"firstName":"John","lastName":"Doe","login":"jd","technology":"html" },' +
                  '{ "firstName":"Anna", "lastName":"Smith","login":"as","technology":"hibernate" },' +
                  '{ "firstName":"Peter", "lastName":"Jones","login":"pj","technology": "css" }]}';

          var select=document.getElementById("feedbackers");
          removeOptions(select);

          var obj = JSON.parse(txt);
          var number=obj.feedbackers.length;

          for (var i=0;i<number;i++){
              var option = document.createElement("option");
              option.text=obj.feedbackers[i].lastName;
              option.value=obj.feedbackers[i].login;
              select.add(option);
          }
      }*/
    </script>

</form>
</body>
</html>