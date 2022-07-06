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
                <h1><strong>成绩管理</strong></h1>
            </div>

            <!--标签页-->
            <div>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">查看成绩</a></li>
                </ul>

                <div class="tab-content">
                    <%--学生列表--%>
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <!--处理学生列表的面板-->
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="stunum">学号：</label>
                                        <input type="text" class="form-control" id="stunum" placeholder="StudentID">
                                    </div>
                                    &nbsp &nbsp
                                    <div class="form-group">
                                        <label for="sname">姓名：</label>
                                        <input type="text" class="form-control" id="sname" placeholder="StudentName">
                                    </div>
                                    &nbsp &nbsp
                                    <button type="submit" class="btn btn-info">点击查询</button>
                                </form>
                            </div>
                            <!--表格-->
                            <table class="table table-striped" id="tableContent">
                                <thead>
                                <tr>
                                    <th>课程名称</th>
                                    <th>选/必修课</th>
                                    <th>成绩</th>
                                    <th>是否挂科</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%--循环输出列表--%>
                                <%--<c:forEach items="${requestScope.courses}" var="courses">--%>
                                    <%--<tr>
                                        <th scope="row">${courses.cid}</th>
                                        <td>${courses.cname}</td>
                                        <td>${courses.choose?'必修课':'选修课'}</td>
                                        <td>${courses.credits}</td>
                                        <td>
                                            <!--根据id找到修改模态框-->
                                            <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal">修改</a>
                                            <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <th scope="row">大型软硬件实验周</th>
                                        <td>选修课</td>
                                        <td>98.0</td>
                                        <td>否</td>
                                        <td>
                                            <!--根据id找到修改模态框-->
                                            <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal" disabled="">增加</a>
                                            <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                        </td>
                                    </tr>
                                <tr>
                                    <th scope="row">软件工程</th>
                                    <td>选修课</td>
                                    <td>96.0</td>
                                    <td>否</td>
                                    <td>
                                        <!--根据id找到修改模态框-->
                                        <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal" disabled="">增加</a>
                                        <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Java高级</th>
                                    <td>必修课</td>
                                    <td>99.0</td>
                                    <td>否</td>
                                    <td>
                                        <!--根据id找到修改模态框-->
                                        <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal" disabled="">增加</a>
                                        <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Python</th>
                                    <td>选修课</td>
                                    <td>55.0</td>
                                    <td>是</td>
                                    <td>
                                        <!--根据id找到修改模态框-->
                                        <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal" disabled="">增加</a>
                                        <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Linux操作系统</th>
                                    <td>必修课</td>
                                    <td>未上传成绩</td>
                                    <td>否</td>
                                    <td>
                                        <!--根据id找到修改模态框-->
                                        <a onclick="findOneCouresRow('${courses.cid}')" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editCourseModal">增加</a>
                                        <a href="javascript:;" onclick="DelCourseRow('${courses.cid}')" class="btn btn-danger btn-sm">删除</a>
                                    </td>
                                </tr>
                                <%--</c:forEach>--%>
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
                <h4 class="modal-title">增加成绩</h4>
            </div>
            <div class="modal-body">

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>课程名称</th>
                        <th>选/必修课</th>
                        <th>学分</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>大型软硬件实验周</td>
                        <td>选修课</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="text" class="form-control" placeholder="请输入分数，上传后不可修改"/>
                        </td>
                    </tr>
                    </tbody>
                </table>


                <%--<!--模态框内表单-->
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
                        &lt;%&ndash;判断性别&ndash;%&gt;
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
                </form>--%>

            </div>
            <div class="modal-footer">
                <button type="button" onclick="UpdateCourse()" class="btn btn-primary">确认上传</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>

</script>