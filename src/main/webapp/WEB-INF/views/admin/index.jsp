<%--
  Created by IntelliJ IDEA.
  User: 徐健波
  Date: 2019/5/28
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>欢迎您，管理员${sessionScope.user.nickname}</title>
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
        var gid;

        function commitUpToDate() {
            var gname = $('#gname2').val();
            var gdesc = $('#gdescription2').val();
            var gnumber = $('#gnumber2').val();
            $.post({
                url:"${pageContext.request.contextPath}/goods/addNew",
                data:{gname:gname,gdesc:gdesc,gnumber:gnumber},
                success:function (data) {
                    if (data == "success"){
                        alert("添加成功！");
                        location.reload();
                    }else {
                        alert("服务器好像出错了，添加失败！");
                        location.reload();
                    }
                }
            })
        }

        function upToDate() {
            $('#gname2').val("");
            $('#gdescription2').val("");
            $('#gnumber2').val(0);
            $('#myModal2').modal('show');
        }

        function editThis(id,name,description,number) {
            gid = id;
            $("#gname").val(name);
            $("#gdescription").val(description);
            $("#gnumber").val(number);
            $("#myModal").modal('show');
        }

        function commitEdit() {
            var gname = $('#gname').val();
            var gdesc = $('#gdescription').val();
            var gnumber = $('#gnumber').val();
            $.post({
                url:"${pageContext.request.contextPath}/goods/edit",
                data:{gid:gid,gname:gname,gdesc:gdesc,gnumber:gnumber},
                success:function (data) {
                    if (data =="success"){
                        alert("修改成功");
                        location.reload();
                    }else {
                        alert("修改失败");
                        location.reload();
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
            <a class="navbar-brand" href="#">欢迎您管理员，${sessionScope.user.nickname}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/user/adminIndex">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/exit">退出</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div>
        <button class="btn btn-lg btn-block bg-primary" onclick="upToDate()">添加体育用品</button>
    </div>
    <div class="table-responsive" style="margin-top: 10px">
        <table class="table table-hover">
            <tr>
                <th>用品名称</th>
                <th>描述</th>
                <th>当前剩余数量</th>
                <th>操作</th>
            </tr>
            <c:forEach var="goods" items="${goodsList}">
                <tr>
                    <td>${goods.name}</td>
                    <td>${goods.description}</td>
                    <td>${goods.number}</td>
                    <td><button type="button" class="btn btn-link" onclick="editThis(${goods.id},'${goods.name}','${goods.description}',${goods.number})">修改信息</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<!-- 修改物品信息弹框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请修改用品信息</h4>
            </div>
            <div class="modal-body">
                <p>用品名称：<input type="text" id="gname" class="form-control"></p>
                <p>用品描述：<textarea cols="20" rows="2" id="gdescription" class="form-control"></textarea></p>
                <p>用品数量：<input type="number" id="gnumber" class="form-control"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"  onclick="commitEdit()">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 添加物品信息弹框 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">请填写用品信息</h4>
            </div>
            <div class="modal-body">
                <p>用品名称：<input type="text" id="gname2" class="form-control"></p>
                <p>用品描述：<textarea cols="20" rows="2" id="gdescription2" class="form-control"></textarea></p>
                <p>用品数量：<input type="number" id="gnumber2" class="form-control"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="commitUpToDate()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
