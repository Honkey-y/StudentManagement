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
                    <h1><strong>学生管理</strong></h1>
                </div>

                <!--标签页-->
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">学生列表</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加学生</a></li>
                    </ul>

                    <div class="tab-content">
                        <%--学生列表--%>
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <!--处理学生列表的面板-->
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
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>生日</th>
                                        <th>所学课程</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%--循环输出列表--%>
                                    <c:forEach items="${requestScope.students}" var="students">
                                        <tr>
                                            <th scope="row">${students.stunum}</th>
                                            <td>${students.sname}</td>
                                            <td>${students.gender?'男':'女'}</td>
                                            <td><fmt:formatDate value="${students.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                            <td>
                                                <a class="btn btn-info btn-sm" data-toggle="modal"
                                                    onclick="manageStudentCourse('${students.sid}')">管理</a>
                                            </td>
                                            <td>
                                                <!--根据id找到修改模态框-->
                                                <a onclick="findOneStudentRow('${students.sid}')" class="btn btn-info btn-sm"
                                                   data-toggle="modal" data-target="#editStudentModal">修改</a>
                                                <a href="javascript:;" onclick="DelStudentRow('${students.sid}')" class="btn btn-danger btn-sm">删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--分页-->
                                <%--<div class="text-center">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li class="disabled">
                                                <a href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li>
                                                <a href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>--%>

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
                        <%--添加学生--%>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <!--添加表单-->
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <form id="studentSaveForm">

                                            <div class="form-group">
                                                <label for="ff">学号</label>
                                                <input type="text" class="form-control" name="stunum" id="ff" placeholder="StudentNum">
                                            </div>
                                            <div class="form-group">
                                                <label for="bb">默认密码</label>      <%--每个新学生都有默认的密码--%>
                                                <input type="password" class="form-control" name="password" id="bb" placeholder="Password" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label for="cc">姓名</label>
                                                <input type="text" class="form-control" name="sname" id="cc" placeholder="name">
                                            </div>
                                            <div class="form-group">
                                                <label for="dd">性别</label>

                                                <%--判断性别--%>
                                                <select class="form-control" id="dd" name="gender">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>

                                            </div>
                                            <div class="form-group">
                                                <label for="ee">生日</label>
                                                <input type="text" class="form-control" name="birthday" id="ee" placeholder="birthday">
                                            </div>
                                            <button type="button" class="btn btn-info btn-block" id="saveStudentBtn">添加学生</button>
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
    <div class="modal fade" id="editStudentModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改学生</h4>
                </div>
                <div class="modal-body">

                    <!--模态框内表单-->
                    <form id="UpdateStudentForm">
                        <div class="form-group">
                            <label for="sid">编号</label>
                            <%--form-control-static 静态--%>
                            <p class="form-control-static" id="idStatic"></p>
                            <input type="hidden" class="form-control-static" name="sid" id="sid" placeholder="StudentId">
                        </div>
                        <div class="form-group">
                            <label for="stunum">学号</label>
                            <input type="text" class="form-control" name="stunum" id="stunum" placeholder="StudentNum">
                        </div>
                        <div class="form-group">
                            <label for="sname">姓名</label>
                            <input type="text" class="form-control" name="sname" id="sname" placeholder="name">
                        </div>
                        <div class="form-group">
                            <label for="stupassword">密码</label>      <%--每个新学生都有默认的密码--%>
                            <input type="password" class="form-control" name="stupassword" id="stupassword" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="gender">性别</label>

                            <%--判断性别--%>
                            <select class="form-control" id="gender" name="gender">
                                <option value="1"
                                        <c:if test="1">
                                            selected
                                        </c:if>
                                >男</option>
                                <option value="0"
                                        <c:if test="0">
                                            selected
                                        </c:if>
                                >女</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="birthday">生日</label>
                            <input type="text" class="form-control" name="birthday" id="birthday" placeholder="birthday">
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" onclick="UpdateStudent()" class="btn btn-primary">确认修改</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                </div>
            </div>
        </div>
    </div>

<!--修改模态框-->    <!--在最外层div中添加id-->
<div class="modal fade" id="editCourseModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">管理个人课程</h4>
            </div>
            <div class="modal-body">

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>课程名称</th>
                        <th>选/必修课</th>
                        <th>学分</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody id="studentCourseBody">

                    </tbody>
                    <%--表单提交添加课程的信息--%>
                    <form id="courseStudent">
                        <tr>
                            <td colspan="3">
                                <select name="addCourse" id="displayCourse" class="form-control">

                                </select>
                            </td>
                            <td>
                                <button type="button" id="addCourse" class="btn btn-primary">
                                    添加此课程
                                </button>
                            </td>
                        </tr>
                    </form>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div>
    </div>
</div>

<script>

    function UpdateStudent() {
        //表单序列化
        console.log($("#UpdateStudentForm").serialize());
        //Ajax传递并响应数据
        $.post("${pageContext.request.contextPath}/student/update",$("#UpdateStudentForm").serialize(),function (res) {
            console.log(res);
            if(res.status){
                alert(res.msg);
                $("#editStudentModal").modal('hide');

                setTimeout(function () {
                    $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.stunum + "</strong>已修改");
                    $("#succMsg").show(800);
                    console.log("经历sleep方法");
                },50);

                setTimeout(function () {
                    //window.location.href = "${pageContext.request.contextPath}/student/findAll"
                    $('#content').load('${pageContext.request.contextPath}/student/findAll');
                    $("#succMsg").hide(800);
                },1500);

            }else {
                alert(res.msg);
            }
        },"json");
    }


    $(function () {
        /*
        * 添加学生操作
        * */
        $("#saveStudentBtn").click(function () {
            //表单序列化
            var serializes = $("#studentSaveForm").serialize();
            //序列化后中文出现乱码，使用decodeURIComponent方法来解码数据
            serialize = decodeURIComponent(serializes,true);
            console.log(serialize);
            //发送异步请求传递用户输入数据 （参数1：url，参数2：数据，参数3：方法，参数4：返回的数据名）
            $.post("${pageContext.request.contextPath}/student/save",serialize,function (res) {
                console.log(res);
                if(res.status){
                    alert("添加学生成功！");
                    $('#content').load('${pageContext.request.contextPath}/student/findAll');
                    setTimeout(function () {
                        $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.name + "</strong>已添加");
                        $("#succMsg").show(2000);
                        console.log("经历sleep方法");
                    },50);
                    setTimeout(function () {
                        $("#succMsg").hide(2000);
                    },4000);
                }else {
                    alert("添加学生失败！")
                }
            },"JSON")
        });
    })

    /*
    * 查找某个学生选修的课程
    * */
    function findStudentCourse(id){
        //因为append每次打开模态框都会追加，所以提前用html清空内容。
        var a = $("#studentCourseBody");
        a.html("");
        $.post("${pageContext.request.contextPath}/courseStudent/findStudentCourse",{sid:id},function (res) {
            console.log(res);
            if (res.status==true){
                //模态框tbody中增加标签
                $("#studentCourseBody").each(function () {
                    for(let i=0;i<res.studentCourse.length;i++){

                        //如果为true是必修课，否则选修
                        if (res.studentCourse[i].choose==true){
                            res.studentCourse[i].choose="必修课";
                        }else {
                            res.studentCourse[i].choose="选修课";
                        }
                        //给jsp页面添加选课相关的<td>
                        $(this).append(
                            innerHTML="<tr>" +
                                "<td>" + res.studentCourse[i].cname + "</td>" +
                                "<td>" + res.studentCourse[i].choose + "</td>" +
                                "<td>" + res.studentCourse[i].credits + "</td>" +
                                "<td><a href='javascript:;' class='btn btn-danger btn-sm'>删除</a></td>" +
                                "</tr>"
                        )
                    }
                });
                $("#editCourseModal").modal('show');
            }
        },"JSON");
    }

    /*
    * 管理学生选修的课程
    * */
    //判断条件，是否第一次打开管理学生个人课程模态框
    var addCourse=true;
    function manageStudentCourse(id){
        //显示时提前把要添加的课程都循环出来
        $.post("${pageContext.request.contextPath}/course/findAllCourse",function (res) {
            console.log(res);
            if (res.status==true){
                //给添加课程的下拉框填充课程
                $("#displayCourse").each(function () {
                    //如果是第一次打开模态框，则追加数据库中的课程
                    if (addCourse == true){
                        for (let i = 0; i < res.courses.length; i++) {
                            $(this).append("<option value="+ res.courses[i].cid +">"+ res.courses[i].cname +"</option>");
                        }
                        //将字段变为false，表示将不会是第一次打开，后续点击“管理”也不会追加
                        addCourse = false;
                    }
                })
                //调用查看某个学生的方法
                findStudentCourse(id);
                //将学生id存入session中，方便添加
                sessionStorage.setItem("sid",id);
            }
        },"JSON");
    }


    //某个学生添加课程
    $("#addCourse").click(function () {
        var cid = $('#displayCourse').val();
        var sid = sessionStorage.getItem("sid");
        console.log("学生" + sid + "添加的课程为" + cid);

        $.ajax({
            url:'${pageContext.request.contextPath}/courseStudent/addStudentCourse',
            type:'GET',
            dataType:'json',
            data:{sid:sid,cid:cid}
        })
        .done(function (res) {
            if (res.status == true){
                alert("成功添加课程！");
                $("#editCourseModal").modal('hide');
            }
        })
    })

    /**
     * 通过编号来查询某一个学生
     */
    function findOneStudentRow(id) {
        $.get("${pageContext.request.contextPath}/student/findOne",{id:id},function (res) {
            console.log(res);
            $('#idStatic').text(res.sid)
            $('#sid').val(res.sid);     //静态编号
            $('#stunum').val(res.stunum);
            $('#stupassword').val(res.stupassword);
            if (res.gender){
                $('#gender').val(1);
            }else {
                $('#gender').val(0);
            }
            $('#sname').val(res.sname);
            $('#birthday').val(res.birthday);
        },"JSON")
    }

    /*
    * 删除学生操作
    * */
    function DelStudentRow(id){
        console.log(id)
        //ajax，参数2：将id存入id中带到控制层
        $.get("${pageContext.request.contextPath}/student/delete", {id:id},function (res) {
            console.log(res);
            if (res.status){
                $('#content').load('${pageContext.request.contextPath}/student/findAll');
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