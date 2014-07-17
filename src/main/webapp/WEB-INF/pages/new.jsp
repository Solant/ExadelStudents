<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Вкладки &middot; Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/webapp/resources/styles/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style>
        .container { margin-top:80px; }
        .nav-tabs li a:focus { outline:none; }
    </style>
    <script src="/webapp/resources/styles/bootstrap/js/jquery.js"></script>
    <script src="/webapp/resources/styles/bootstrap/js/bootstrap.min.js"></script>
    <script src="/webapp/resources/styles/bootstrap/js/bootstrap-tab.js"></script>
    <!-- Чтобы старые версии IE "понимали" HTML5: -->
    <!--[if lt IE 9]>
    <script src="/webapp/resources/styles/bootstrap/js/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">

            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#s1" data-toggle="tab">Первая секция</a></li>
                    <li><a href="#s2" data-toggle="tab">Вторая секция</a></li>
                    <li><a href="#s3" data-toggle="tab">Третья секция</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="s1">
                        <p>Сейчас вы просматриваете содержимое первой секции.</p>
                    </div>
                    <div class="tab-pane" id="s2">
                        <p>Сейчас вы просматриваете содержимое второй секции.</p>
                    </div>
                    <div class="tab-pane" id="s3">
                        <p>Сейчас вы просматриваете содержимое третьей секции.</p>
                    </div>
                </div>
            </div><!-- /.tabbable -->

        </div><!-- /.span12 -->
    </div><!-- /.row -->
</div><!-- /.container -->
</body>
</html>