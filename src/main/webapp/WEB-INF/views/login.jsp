
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>欢迎登录XDU体育用品租赁系统</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <script>
        function login() {
            var username = $('#inputAccount').val();
            var password = $('#inputPassword').val();
            $.post({
                url:"${pageContext.request.contextPath}/user/login",
                data:{username:username,password:password},
                success:function (data) {
                   if (data == -1)    $('#userNotExists').modal('show');
                   if (data == 0)   $('#failLogin').modal('show');
                   if (data == 1)   window.location="${pageContext.request.contextPath}/user/userIndex";
                   if (data == 2)   window.location="${pageContext.request.contextPath}/user/adminIndex";
                }
            })

        }
    </script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">XDU体育用品租赁系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
                <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div style="padding-top: 200px">

    <form class="form-horizontal col-xs-offset-3" method="post" >
        <div class="form-group">
            <label for="inputAccount" class="col-xs-2 control-label">账号</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" id="inputAccount" placeholder="请输入账号" name="id">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-xs-2 control-label">密码</label>
            <div class="col-xs-5">
                <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" name="password">
                <span id="checkuser"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="button" class="btn btn-default" onclick="login()">登录</button>
                <button type="button" class="btn btn-default" onclick="window.location='${pageContext.request.contextPath}/register'" >注册</button>
            </div>
        </div>
    </form>

</div>


<div class="modal fade" id="failLogin">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">登录失败</h4>
            </div>
            <div class="modal-body">
                <p>用户名或密码输入错误，请返回重试。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="userNotExists">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">登录失败</h4>
            </div>
            <div class="modal-body">
                <p>您输入的账号不存在</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>