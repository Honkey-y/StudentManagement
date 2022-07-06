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
                <h1><strong>课程管理</strong></h1>
            </div>

            <!--标签页-->
            <div>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">课程列表</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加课程</a></li>
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
                                    <th>课程编号</th>
                                    <th>课程名称</th>
                                    <th>选/必修课</th>
                                    <th>学分</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--循环输出列表--%>
                                <c:forEach items="${requestScope.courses}" var="courses">
                                    <tr>
                                        <th scope="row">${courses.cid}</th>
                                        <td>${courses.cname}</td>
                                        <td>${courses.choose?'必修课':'选修课'}</td>
                                        <td>${courses.credits}</td>
                                        <td>
                                            <!--根据id找到修改模态框-->
                                            <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal">修改</a>
                                            <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


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
                                    <form id="courseSaveForm">

                                        <div class="form-group">
                                            <label for="aa">课程名称</label>
                                            <input type="text" class="form-control" name="cname" id="aa" placeholder="CourseName">
                                        </div>
                                        <div class="form-group">
                                            <label for="dd">是否选修</label>
                                            <%--判断是否为选修课--%>
                                            <select class="form-control" id="dd" name="choose">
                                                <option value="1">必修课</option>
                                                <option value="0">选修课</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="cc">学分</label>
                                            <input type="text" class="form-control" name="credits" id="cc" placeholder="credits">
                                        </div>

                                        <button type="button" class="btn btn-info btn-block" id="saveCourseBtn">添加课程</button>
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
<div class="modal fade" id="editCourseModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改课程</h4>
            </div>
            <div class="modal-body">

                <!--模态框内表单-->
                <form id="UpdatCourseForm">
                    <div class="form-group">
                        <label for="cid">课程编号</label>
                        <input type="text" class="form-control" name="cid" id="cid" placeholder="CourseId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="cname">课程名称</label>
                        <input type="text" class="form-control" name="cname" id="cname" placeholder="CourseName">
                    </div>
                    <div class="form-group">
                        <label for="choose">选/必修课</label>
                        <%--判断选修--%>
                        <select class="form-control" id="choose" name="choose">
                            <option value="1"
                                    <c:if test="1">
                                        selected
                                    </c:if>
                            >必修课</option>
                            <option value="0"
                                    <c:if test="0">
                                        selected
                                    </c:if>
                            >选修课</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="credits">学分</label>
                        <input type="text" class="form-control" name="credits" id="credits" placeholder="Credits">
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" onclick="UpdateCourse()" class="btn btn-primary">确认修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

            </div>
        </div>
    </div>
</div>

<script>

    /*
    * 修改课程信息
    * */
    function UpdateCourse() {
        //表单序列化
        console.log($("#UpdatCourseForm").serialize());
        //Ajax传递并响应数据
        $.post("${pageContext.request.contextPath}/course/update",$("#UpdatCourseForm").serialize(),function (res) {
            console.log(res);
            if(res.status){
                alert(res.msg);
                $("#editCourseModal").modal('hide');

                setTimeout(function () {
                    $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.cid + "</strong>已修改");
                    $("#succMsg").show(800);
                    console.log("经历sleep方法");
                },50);

                setTimeout(function () {
                    //window.location.href = "${pageContext.request.contextPath}/student/findAll"
                    $('#content').load('${pageContext.request.contextPath}/course/findAll');
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
        $("#saveCourseBtn").click(function () {
            //表单序列化
            var serializes = $("#courseSaveForm").serialize();
            //序列化后中文出现乱码，使用decodeURIComponent方法来解码数据
            serialize = decodeURIComponent(serializes,true);
            console.log(serialize);
            //发送异步请求传递用户输入数据 （参数1：url，参数2：数据，参数3：方法，参数4：返回的数据名）
            $.post("${pageContext.request.contextPath}/course/save",serialize,function (res) {
                console.log(res);
                if(res.status){
                    alert("添加课程成功！");
                    $('#content').load('${pageContext.request.contextPath}/course/findAll');
                    setTimeout(function () {
                        $("#succmsgs").html("<strong>添加成功：</strong><strong>"+ res.name + "</strong>已添加");
                        $("#succMsg").show(2000);
                        console.log("经历sleep方法");
                    },50);
                    setTimeout(function () {
                        $("#succMsg").hide(2000);
                    },4000);
                }else {
                    alert("添加课程失败！")
                }
            },"JSON")
        });
    })

    /**
     * 通过编号来查询某一个学生
     */
    function findOneCouresRow(id) {
        $.get("${pageContext.request.contextPath}/course/findOne",{id:id},function (res) {
            console.log(res);
            $('#cid').val(res.cid);
            $('#cname').val(res.cname);
            if (res.choose){
                $('#choose').val(1);
            }else {
                $('#choose').val(0);
            }
            $('#credits').val(res.credits);
        },"JSON")
    }

    /*
    * 删除学生操作
    * */
    function DelCourseRow(id){

            //ajax，参数2：将id存入id中带到控制层
            $.get("${pageContext.request.contextPath}/course/delete", {id:id},function (res) {
                console.log(res);
                if (res.status){
                    $('#content').load('${pageContext.request.contextPath}/course/findAll');
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