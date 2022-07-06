<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎使用学生管理系统</title>
    <!--bootstrap核心css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <!--javaScript核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.6.0.js"></script>
    <!--bootstrap核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    
</head>
<body>
<!--导航条-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">学生管理系统 <span class="badge">V1.0</span></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">使用说明 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">历经版本 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">测试<small>V1.0</small></a></li>
                        <li><a href="#">测试<small>V1.1</small></a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">测试<small>V1.2</small></a></li>
                    </ul>
                </li>
            </ul>
            <!--右上方导航条-->
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎您：${sessionScope.user.realname}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户中心 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="modal" data-target="#passwordModal" style="margin-top: 5px" class="glyphicon glyphicon-pencil"> 修改密码</a></li>
                        <li><a href="javascript:$('#content').load('${pageContext.request.contextPath}/back/student/studentInformation.jsp');"  style="margin-top: 5px" class="glyphicon glyphicon-user"> 个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-share"> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--页面主体-->
<div class="container-fluid">

    <!--栅格系统-->
    <div class="row">
        <!--管理菜单-->
        <div class="col-sm-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                <!--学生管理-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <span class="glyphicon glyphicon-education" style="margin-right: 5px"></span>成绩管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">

                            <div class="list-group">
                                <!--动态更新内容 load 将远程url对应的页面源码包含到指定源码选择器中-->
                                <a href="javascript:$('#content').load('${pageContext.request.contextPath}/back/student/studentGrades.jsp');" id="StuBtn" class="list-group-item">查看成绩</a>
                            </div>

                    </div>
                </div>

                <!--课程管理-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <span class="glyphicon glyphicon-book"  style="margin-right: 5px"></span>课程管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">

                            <div class="list-group">
                                <!--动态更新内容 load 将远程url对应的页面源码包含到指定源码选择器中-->
                                <a href="javascript:$('#content').load('${pageContext.request.contextPath}/back/scourse/Course.jsp');" class="list-group-item">课程列表</a>
                            </div>

                    </div>
                </div>

            </div>

        </div>

        <div id="content">
            <!--页面中心内容-->
            <div class="col-sm-10">

                <!--巨幕-->
                <div class="jumbotron">
                    <h1>Hello, world!</h1>
                    <p>...</p>
                    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
                </div>
                <!--可关闭警告框-->
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4><strong>网站程序漏洞，请尽快完善！</strong></h4>
                    <p>当前版本程序<small>（V1.0）</small>存在逻辑问题，请<a href="" class="alert-link">立即修复!!!</a></p>
                    <p>
                        <button class="btn btn-danger">立即修复</button>
                        <button class="btn btn-default">稍后处理</button>
                    </p>
                </div>
                <!--面板-->
                <div class="panel panel-default">
                    <div class="panel-heading"><span class="glyphicon glyphicon-wrench" style="margin-right: 5px"></span>系统状态</div>
                    <div class="panel-body">

                        <!--进度条-->
                        <p>系统管理：(40%)</p>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                40%<span class="sr-only">40% Complete (success)</span>
                            </div>
                        </div>
                        <p>学生管理：(20%)</p>
                        <div class="progress">
                            <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                20%<span class="sr-only">20% Complete</span>
                            </div>
                        </div>
                        <p>课程管理：(60%)</p>
                        <div class="progress">
                            <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                60%<span class="sr-only">60% Complete (warning)</span>
                            </div>
                        </div>
                        <p>系统用户：(80%)</p>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                80%<span class="sr-only">80% Complete (danger)</span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">

                    <!--模态框内表单-->
                    <form id="UpdatePasswordForm">
                        <div class="form-group">
                            <label for="uid">用户名</label>
                            <%--获取登录管理员的用户名--%>
                            <input type="text" class="form-control" name="uid" id="uid" placeholder="UserId" value="${sessionScope.user.username}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="passwordConfirm">确认密码</label>
                            <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="passwordConfirm">
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updatePassword()">确认修改密码</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>

<script>

    function updatePassword(){
        var pwd = $('#password').val();
        console.log(pwd);
        //判断两次密码是否一元
        if (pwd==$('#passwordConfirm').val()){
            $.post("${pageContext.request.contextPath}/user/update", {pd:"1",pwd:pwd},function (res) {
                alert(res.realname + "老师，您已修改密码，请重新登录！");
                $('#passwordModal').modal('hide');
            },"json");
        }else {
            alert("两次密码不一致，请重新输入！");
        }
    }

    $(function () {

    })
</script>

</html>