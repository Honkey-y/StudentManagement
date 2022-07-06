<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>


<!--页面主体-->
<div class="container-fluid">

  <!--栅格系统-->
  <div class="row">

    <!--页面中心内容-->
    <div class="col-sm-10">


      <div id="bg" class="jumbotron jumbotron-fluid">
        <div class="container">
          <h2>Hello！欢迎进入${sessionScope.user.realname}的个人信息界面</h2>
        </div>
      </div>
      <br>
      <div class="container">
        <h2 class="text-primary">基本信息</h2>
        <hr>
        <div class="row">
          <div class="col-md-7">
            <ul class="list-group">
              <li class="list-group-item">工号：${sessionScope.user.uid}</li>
              <li class="list-group-item">姓名：${sessionScope.user.realname}</li>
              <li class="list-group-item">用户名：${sessionScope.user.username}</li>
              <li class="list-group-item">职位：${sessionScope.user.posts}</li>
              <li class="list-group-item">学校：山西晋中理工学院</li>
            </ul>
          </div>
          <div class="col-md-3">
            <h2 class="text-secondary">
              学校简介
            </h2>
            <p style="text-indent:2em">
              山西晋中理工学院（Shanxi Jinzhong Institute of Technology），简称“山西理工”，坐落于山西省晋中市，是一所经中华人民共和国教育部和山西省人民政府批准，由山西大任国际教育交流有限公司举办的全日制民办普通本科高校。      </p>
          </div>
        </div>

      </div>


      <footer id="end" class="navbar-fixed-bottom">
        <div class="container">
          <p class="text-white">联系我QQ12345678 <a href="interface.html">返回首页</a></p>
        </div>
      </footer>


    </div>
  </div>
</div>



