<%--
  Created by IntelliJ IDEA.
  User: 徐健波
  Date: 2019/5/28
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
        var cUsername = false ;
        var cPassword = false ;
        var cNickname = false ;
        var cLeasingPassword = false ;
        function register() {
            //检查验证码
            var code = $('#kaptchaCode').val();
            code = code.toLowerCase();
            $.post({
                url:'${pageContext.request.contextPath}/checkKaptcha',
                data:{kaptcha:code},
                success:function (data) {
                    if (data=='false'){
                        $('#checkKaptcha').text('验证码错误');
                        $('#checkKaptcha').css('color','red');
                        $('#kaptchaImg').attr('src','${pageContext.request.contextPath}/kaptcha?time='+new Date().getTime());
                    }else if (data=='true'){
                        $('#checkKaptcha').text('验证码正确');
                        $('#checkKaptcha').css('color','green');
                        //检查是什么类型的用户注册
                        var isAdmin = $("input[name='isAdmin']:checked").val();
                        var username = $('#username').val();
                        var password = $('#password').val();
                        var nickname = $('#nickname').val();
                        var leasingPassword = $('#leasingPassword').val();

                        //管理员注册
                        if (isAdmin==1){
                            if (cUsername&&cPassword&&cNickname){
                                $.post({
                                    url:'${pageContext.request.contextPath}/user/register',
                                    data:{username:username,password:password,nickname:nickname,isAdmin:isAdmin},
                                });
                                alert("注册成功，按确定返回登录");
                                window.location='${pageContext.request.contextPath}/login';
                            }else{
                                alert('请正确填写表单信息');
                            }
                        }
                        if (isAdmin==0){
                            if (cUsername&&cPassword&&cNickname&&cLeasingPassword){
                                $.post({
                                    url:'${pageContext.request.contextPath}/user/register',
                                    data:{username:username,password:password,nickname:nickname,leasingPassword:leasingPassword,isAdmin:isAdmin},
                                });
                                alert("注册成功，按确定返回登录");
                                window.location='${pageContext.request.contextPath}/login';
                            }else{
                                alert('请正确填写表单信息');
                            }
                        }
                    }

                }
            })

        }
        function checkLeasingPassword() {
            var p1 = $('#leasingPassword').val();
            var p2 = $('#leasingPassword2').val();
            if (p1 ==''||p2 ==''){
                $('#checkLeasingPassword').text('输入不能为空');
                $('#checkLeasingPassword').css('color','red');
                cLeasingPassword = false;
                return  cLeasingPassword;
            }
            if (p1 == p2){
                $('#checkLeasingPassword').text('密码输入正确');
                $('#checkLeasingPassword').css('color','green');
                cLeasingPassword = true;
            }
            if (p1 != p2){
                $('#checkLeasingPassword').text('两次密码输入不一致');
                $('#checkLeasingPassword').css('color','red');
                cLeasingPassword = false;
            }
            return cLeasingPassword;
        }

        function checkNickname() {
            var val = $('#nickname').val();
            if (val == ''){
                $('#checkNickname').text('昵称不能为空');
                $('#checkNickname').css('color','red');
                cNickname=false;
                return cNickname;
            }
            cNickname=true;
            $('#checkNickname').text('');
            return cNickname;
        }

        function checkPassword() {
            var p1 = $('#password').val();
            var p2 = $('#password2').val();
            if (p1 ==''||p2 ==''){
                $('#checkPassword').text('输入不能为空');
                $('#checkPassword').css('color','red');
                cPassword = false;
                return  cPassword;
            }
            if (p1 == p2){
                $('#checkPassword').text('密码输入正确');
                $('#checkPassword').css('color','green');
                cPassword = true;
            }
            if (p1 != p2){
                $('#checkPassword').text('两次密码输入不一致');
                $('#checkPassword').css('color','red');
                cPassword = false;
            }
            return cPassword;
        }

        function disableInput() {
            $('#leasingPassword').val("");
            $('#leasingPassword').attr("disabled","disabled");
            $('#leasingPassword2').val("");
            $('#leasingPassword2').attr("disabled","disabled");
            $('#checkLeasingPassword').text('');
        }

        function enableInput() {
            $('#leasingPassword').removeAttr("disabled");
            $('#leasingPassword2').removeAttr("disabled");
        }

        function checkUsername() {
            var username = $('#username').val();

            if (username == ''){
                $('#checkUsername').text("用户名不能为空");
                $('#checkUsername').css('color','red');
                cUsername=false;
                return cUsername;
            }

            $.post({
                url:'${pageContext.request.contextPath}/user/checkUserExists',
                data:{username:username},
                success:function (data) {
                    if (data == 1){
                        $('#checkUsername').text("用户名已存在");
                        $('#checkUsername').css('color','red');
                        cUsername = false;
                    }
                    if (data == 0){
                        $('#checkUsername').text("用户名可用");
                        $('#checkUsername').css('color','green');
                        cUsername = true;
                    }
                }
            })

            return cUsername;
        }

        function changeImg() {
            $('#checkKaptcha').text('');
            $('#kaptchaImg').attr('src','${pageContext.request.contextPath}/kaptcha?time='+new Date().getTime());
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
            <label class="col-xs-2 control-label">是否为管理员</label>
            <div class="col-xs-5">
                <input type="radio" name="isAdmin" value="1" onclick="disableInput()" >是
                <input type="radio" name="isAdmin" value="0" onclick="enableInput()" checked>否
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-xs-2 control-label">账号</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" id="username" placeholder="请输入账号" name="id" onblur="checkUsername()">
            </div>
            <span id="checkUsername"></span>
        </div>
        <div class="form-group">
            <label for="password" class="col-xs-2 control-label">密码</label>
            <div class="col-xs-5">
                <input  onblur="checkPassword()"  type="password" class="form-control" id="password" placeholder="请输入密码" name="password">

            </div>
        </div>
        <div class="form-group">
                <label for="password2" class="col-xs-2 control-label">确认密码</label>
            <div class="col-xs-5">
                <input  onblur="checkPassword()"  type="password" class="form-control" id="password2" placeholder="请重新输入密码" name="password">
            </div>
            <span id="checkPassword"></span>
        </div>
        <div class="form-group">
            <label for="nickname" class="col-xs-2 control-label">昵称</label>
            <div class="col-xs-5">
                <input onblur="checkNickname()" type="text" class="form-control" id="nickname" placeholder="请输入昵称" name="nickname">
            </div>
            <span id="checkNickname"></span>
        </div>
        <div class="form-group">
            <label for="leasingPassword" class="col-xs-2 control-label">租赁密码</label>
            <div class="col-xs-5">
                <input onblur="checkLeasingPassword()" type="password" class="form-control" id="leasingPassword" placeholder="请输入租赁密码" name="leasingPassword">
            </div>
        </div>
        <div class="form-group">
            <label for="leasingPassword2" class="col-xs-2 control-label">确认租赁密码</label>
            <div class="col-xs-5">
                <input onblur="checkLeasingPassword()" type="password" class="form-control" id="leasingPassword2" placeholder="请重新输入租赁密码" >
                <span id="checkLeasingPassword"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="kaptchaCode" class="col-xs-2 control-label">请输入验证码</label>
            <div class="col-xs-5">
                <input  type="text" class="form-control" id="kaptchaCode" placeholder="请输入验证码" >
                <img id="kaptchaImg" src="${pageContext.request.contextPath}/kaptcha" width="200px" height="50px" onclick="changeImg()">
                <br>
                <span id="checkKaptcha"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="button" class="btn btn-default" onclick="register()">注册</button>
            </div>
        </div>
    </form>

</div>

</body>
</html>
