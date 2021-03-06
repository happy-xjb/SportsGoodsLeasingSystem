<%--
  Created by IntelliJ IDEA.
  User: 徐健波
  Date: 2019/5/27
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>欢迎您，${sessionScope.user.nickname}</title>
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
        var userId;
        var goodsId;

        function setUidGid(uid,gid) {
            userId=uid;
            goodsId=gid;
        }
        function clear() {
            var element = document.getElementById("inputLPwd");
            element.setAttribute("value","");
        }

        function leastThis(uid,gid) {
            var number = $("#"+"gid"+gid).val();
            var rest = $("#"+"rest"+gid).text();
            if (Number(number)>Number(rest)){
                alert("当前剩余数量不足！");
                return;
            }
            if (number<=0){
                alert("输入值不得小于1");
                return;
            }

            /*异步传入控制器*/

            $.post({
                url:"${pageContext.request.contextPath}/goods/leastThis",
                data:{uid:uid,gid:gid,number:number},
                success:function (data) {
                    if (data == 'success'){
                        alert('租赁成功！');
                        location.reload();
                    }else if (data =='fail'){
                        alert("当前剩余数量不足哦！");
                        location.reload();
                    }
                }
            })

        }

        function leastCheck() {
            var leasingPassword = $('#inputLPwd').val();
            $.post({
                url:"${pageContext.request.contextPath}/user/checkLeasingPassword",
                data:{uid:userId,leasingPassword:leasingPassword},
                success:function (data) {
                    if (data =="true"){
                        leastThis(userId,goodsId);
                    }else if (data =="false"){
                        alert("租赁密码错误")
                    }
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
            <a class="navbar-brand" href="#">欢迎您，${sessionScope.user.nickname}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/user/userIndex">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/userInfo">个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/myOrder">我的租赁</a></li>
                <li><a href="${pageContext.request.contextPath}/orderHistory">历史租赁</a></li>
                <li><a href="${pageContext.request.contextPath}/user/exit">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="table-responsive">
        <table class="table table-hover">
            <tr>
                <th>用品名称</th>
                <th>描述</th>
                <th>当前剩余数量</th>
                <th>操作</th>
            </tr>
            <c:forEach var="goods" items="${list}">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/static/image/${goods.picture}" width="80px" height="80px">${goods.name}</td>
                    <td>${goods.description}</td>
                    <td id='rest${goods.id}'>${goods.number}</td>
                    <td><%--<a href="javascript:void (0)" onclick="leastThis(${sessionScope.user.id},${goods.id})">租借</a>--%>
                        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal" onclick="setUidGid(${sessionScope.user.id},${goods.id})">租借</button>
                        <br>
                        请输入租赁数量：<input type="number" id='gid${goods.id}' class="form-control" value="1" min="1" max="${goods.number}">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%--验证支付密码输入框--%>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">请输入租赁密码</h4>
            </div>
            <div class="modal-body">
                <input type="password" class="form-control" id="inputLPwd">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="leastCheck()">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
