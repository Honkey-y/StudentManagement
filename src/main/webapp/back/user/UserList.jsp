<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>

    <!--页面主体-->
    <div class="container-fluid">

        <!--栅格系统-->
        <div class="row">

            <!--页面中心内容-->
            <div class="col-sm-10">

                <!--页头-->
                <div class="page-header" style="margin-top: -20px;margin-bottom: 10px">
                    <h1><strong>系统用户管理</strong></h1>
                </div>

                <!--标签页-->
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">用户列表</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加用户</a></li>
                    </ul>

                    <div class="tab-content">
                        <%--用户列表--%>
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <!--处理用户列表的面板-->
                            <div class="panel panel-default">
                                <div class="panel-body text-center">
                                    <form class="form-inline">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Name</label>
                                            <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Email</label>
                                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
                                        </div>
                                        <button type="submit" class="btn btn-default">Send invitation</button>
                                    </form>
                                </div>
                                <!--表格-->
                                <table class="table" id="tableContent">
                                    <thead>
                                    <tr>
                                        <th>工号</th>
                                        <th>姓名</th>
                                        <th>用户名</th>
                                        <th>职位</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%--循环输出列表--%>
                                    <c:forEach items="${requestScope.users}" var="users">
                                        <tr>
                                            <th scope="row">${users.uid}</th>
                                            <td>${users.realname}</td>
                                            <td>${users.username}</td>
                                            <td>${users.posts}</td>
                                            <td>
                                                <!--根据id找到修改模态框-->
                                                <a onclick="findOneUserRow('${users.uid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editUserModal">修改</a>
                                                <a href="javascript:;" onclick="DelStudentRow('${users.uid}')" class="btn btn-danger btn-sm">删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!--分页-->
                            <div class="text-center">
                                <nav aria-label="Page navigation">

                                    <ul class="pagination">
                                        <%--上一页--%>
                                        <li>
                                            <a id="up" aria-label="Previous"
                                               onclick="PagingUp(${sessionScope.pageNum-1})">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </ul>

                                    <ul class="pagination" id="ul_items">
                                        <%--页码--%>
                                        <%--<li class="active"><a href="#">1</a></li>
                                        <li class="active"><a href="#">2</a></li>
                                        <li class="active"><a href="#">3</a></li>
                                        <li class="active"><a href="#">4</a></li>--%>
                                    </ul>

                                    <ul class="pagination">
                                        <%--下一页--%>
                                        <li>
                                            <a id="down" aria-label="Next"
                                               onclick="PagingUp(${sessionScope.pageNum+1})">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                            <!--处理消息提示-->
                            <div id="succMsg" style="display: none" class="alert alert-success alert-dismissible" role="alert">
                                <button  type="button" class="close" data-dismiss="alert"  aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <p id="succmsgs"><strong>删除成功：</strong> 当前数据已被删除！</p>
                            </div>
                            <div id="errorMsg" class="alert alert-danger alert-dismissible" style="display: none" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>删除失败：</strong> 空字符串异常！
                            </div>
                        </div>
                        <%--添加用户--%>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <!--添加表单-->
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <form id="UserSaveForm">
                                            <div class="form-group">
                                                <label for="ff">默认工号</label>    <%--每个新用户都有默认的工号--%>
                                                <input type="text" class="form-control" name="uid" id="ff" placeholder="UserId" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label for="cc">姓名</label>
                                                <input type="text" class="form-control" name="realname" id="cc" placeholder="RealName">
                                            </div>
                                            <div class="form-group">
                                                <label for="ee">用户名</label>
                                                <input type="text" class="form-control" name="username" id="ee" placeholder="UserName">
                                            </div>
                                            <div class="form-group">
                                                <label for="bb">密码</label>
                                                <input type="password" class="form-control" name="password" id="bb" placeholder="Password">
                                            </div>
                                            <div class="form-group">
                                                <label for="dd">职位</label>
                                                <%--判断性别--%>
                                                <select class="form-control" id="dd" name="posts">
                                                    <option disabled="disabled" selected="selected">---请选择您的职位---</option>
                                                    <option value="教师">教师</option>
                                                    <option value="班主任">班主任</option>
                                                    <option value="教导主任">教导主任</option>
                                                    <option value="学工助理">学工助理</option>
                                                </select>

                                            </div>
                                            <button type="button" class="btn btn-info btn-block" id="saveUserBtn">添加用户</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--修改模态框-->    <!--在最外层div中添加id-->
    <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">

                    <!--模态框内表单-->
                    <form id="UpdateUserForm">
                        <div class="form-group">
                            <label for="uid">工号</label>
                            <input type="text" class="form-control" name="uid" id="uid" placeholder="UserId" readonly>
                        </div>
                        <div class="form-group">
                            <label for="realname">姓名</label>
                            <input type="text" class="form-control" name="realname" id="realname" placeholder="realname">
                        </div>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" name="username" id="username" placeholder="username" readonly>
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>      <%--每个新学生都有默认的密码--%>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="posts">职称</label>

                            <%--判断性别--%>
                            <select class="form-control" id="posts" name="posts">
                                <option value="教师"
                                        <c:if test="教师">
                                            selected
                                        </c:if>
                                >教师</option>
                                <option value="班主任"
                                        <c:if test="班主任">
                                            selected
                                        </c:if>
                                >班主任</option>
                                <option value="教导主任"
                                        <c:if test="教导主任">
                                            selected
                                        </c:if>
                                >教导主任</option>
                                <option value="学工助理"
                                        <c:if test="学工助理">
                                            selected
                                        </c:if>
                                >学工助理</option>
                            </select>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" onclick="UpdateUser()" class="btn btn-primary">确认修改</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                </div>
            </div>
        </div>
    </div>

<script>

    /*
    * 分页判断
    * */
    function PagingUp(pageNum) {
        //如果当前页和总页数一样的话 键位失效
        if (pageNum==<%=session.getAttribute("totalPage")%>+1){
            return false
        }
        //如果当前页在第一页的话 键位失效
        if(pageNum==0){
            return false
        }
        console.log("当前页码" + pageNum);
        console.log("总页数" + <%=session.getAttribute("totalPage")%>)
        //给session会话传入上页的页码
        $('#content').load('${pageContext.request.contextPath}/user/findAll?pageNum='+pageNum);
    }

    /*
    * 更新用户
    * */
    function UpdateUser() {
        //表单序列化
        console.log($("#UpdateUserForm").serialize());
        //Ajax传递并响应数据
        $.post("${pageContext.request.contextPath}/user/update",$("#UpdateUserForm").serialize(),function (res) {
            console.log(res);
            if(res.status){
                alert(res.msg);
                $("#editUserModal").modal('hide');
                setTimeout(function () {
                    $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.uid + "</strong>已修改");
                    $("#succMsg").show(800);
                    console.log("经历sleep方法");
                },50);

                setTimeout(function () {
                    //window.location.href = "${pageContext.request.contextPath}/student/findAll"
                    $('#content').load('${pageContext.request.contextPath}/user/findAll?pageNum=' + ${sessionScope.pageNum});
                    $("#succMsg").hide(800);
                },1500);

            }else {
                alert(res.msg);
            }
        },"json");
    }

    $(function () {
        /*
        * 遍历分页页码
        * 1.使用for循环为ul添加li元素（使用的innerHTML）
        * 2.循环中将每个具体的页码点击事件加上，i即是跳转的页码
        * */
        $("#ul_items").each(function () {
            console.log(<%=session.getAttribute("totalPage")%>);
            for (let i = 1; i <= <%=session.getAttribute("totalPage")%>; i++) {
                $(this).append(innerHTML="<li><a href='#' onclick='PagingUp("+i+")'>"+i+"</a></li>");
            }
        })

        /*
        * 添加用户操作
        * */
        $("#saveUserBtn").click(function () {
            //表单序列化
            var serializes = $("#UserSaveForm").serialize();
            //序列化后中文出现乱码，使用decodeURIComponent方法来解码数据
            serialize = decodeURIComponent(serializes,true);
            console.log(serialize);
            //发送异步请求传递用户输入数据 （参数1：url，参数2：数据，参数3：方法，参数4：返回的数据名）
            $.post("${pageContext.request.contextPath}/user/save",serialize,function (res) {
                console.log(res);
                if(res.status){
                    alert("添加用户成功！");
                    $('#content').load('${pageContext.request.contextPath}/user/findAll?pageNum=' + ${sessionScope.pageNum});
                    setTimeout(function () {
                        $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.name + "</strong>已添加");
                        $("#succMsg").show(2000);
                        console.log("经历sleep方法");
                    },50);
                    setTimeout(function () {
                        $("#succMsg").hide(2000);
                    },4000);
                }else {
                    alert("添加用户失败！");
                }
            },"JSON")
        });
    })

    /**
     * 通过编号来查询某一个学生，并将查询到数据显示到文本框中
     */
    function findOneUserRow(id) {
        $.get("${pageContext.request.contextPath}/user/findOne",{id:id},function (res) {
            console.log(res);
            $('#uid').val(res.uid);
            $('#username').val(res.username);     //静态编号
            $('#realname').val(res.realname);
            $('#password').val(res.password);
            $('#posts').val(res.posts);
        },"JSON")
    }

    /*
    * 删除学生操作
    * */
    function DelStudentRow(id){
        console.log(id)
        //ajax，参数2：将id存入id中带到控制层
        $.get("${pageContext.request.contextPath}/user/delete", {id:id},function (res) {
            console.log(res);
            if (res.status){
                $('#content').load('${pageContext.request.contextPath}/user/findAll?pageNum=' + ${sessionScope.pageNum});
                setTimeout(function () {
                    $("#succMsg").show(2000);
                    console.log("经历sleep方法");
                },50);
                setTimeout(function () {
                    $("#succMsg").hide(2000);
                },4000);
            }else {
                setTimeout(function () {
                    $("#errorMsg").show(2000);
                    console.log("经历sleep方法");
                },50);
                setTimeout(function () {
                    $("#errorMsg").hide(2000);
                },4000);
            }
        })
    }
</script>