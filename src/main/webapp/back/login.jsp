<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <!--javaScript核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.6.0.js"></script>
    <!--bootstrap核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/tooltip.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/loginView.css">
</head>

<body>
<div class="container right-panel-active">

    <!-- 注册 -->
    <div class="container__form container--signin">
        <form class="form" id="form2">
            <h3 class="form__title">Sign In</h3>
            <%--警告框--%>
            <div id="succMsg" style="display: none" class="alert alert-success alert-dismissible btn-block" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <p id="Msgs"></p>
            </div>
            <input type="text" name="username" placeholder="用户名" class="input" />
            <input type="password" name="password" placeholder="密码" class="input" />
            <input type="text" name="realname" placeholder="真实姓名" class="input"
                   οnkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5\w]/g,'')"/>
            <%--职位选择--%>
            <select class="form-control" name="posts">
                <option disabled="disabled" selected="selected">---请选择您的职位---</option>
                <option value="教师">教师</option>
                <option value="班主任">班主任</option>
                <option value="教导主任">教导主任</option>
                <option value="学工助理">学工助理</option>
            </select>
            <%--验证码--%>
            <button class="btn" id="registBtn">Sign Up</button>
        </form>
    </div>

    <!-- 登录 -->
    <div class="container__form container--signup">
        <form action="${pageContext.request.contextPath}/login/logins" class="form" id="form1" method="post">
            <h2 class="form__title">登录</h2>
            <%--警告框--%>
            <div id="errorMsg" style="display: none" class="alert alert-success alert-dismissible btn-block" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <p id="Msgss"></p>
            </div>
            <input type="text" placeholder="username" class="input" name="username"/>
            <input type="password" placeholder="Password" class="input" name="password"/>
            <%--验证码--%>
            <div class="row">
                <div class="col-md-6">
                    <input type="text" placeholder="验证码" class="input" name="code"/>
                </div>
                <div class="col-md-4" style="padding-right: 50px;padding-top: 10px;padding-left: -10px">
                    <img id="num" src="${pageContext.request.contextPath}/login/usercode"
                         onclick="document.getElementById('num')
                                 .src = '${pageContext.request.contextPath}/login/usercode?'+(new Date())
                                 .getTime()"
                    />
                </div>
            </div>

            <a href="#" class="danger">${sessionScope.errorMsg}</a>
            <%--<input type="submit" class="button">--%>
            <button class="btn" id="loginBtn">Sign In</button>
        </form>
    </div>

    <!-- Overlay -->
    <div class="container__overlay">
        <div class="overlay">
            <div class="overlay__panel overlay--left">
                <button class="btn" id="signIn">Sign Up</button>
            </div>
            <div class="overlay__panel overlay--right">
                <button class="btn" id="signUp">Sign In</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        //用户登录
        $("#loginBtn").click(function () {
            //表单序列化
            var data = $("#form1").serialize();
            console.log(data);
            //使用&切割，得到：username=zXZXZX，password=ZXzXZX，realname=sadsad，posts=%E6%95%99%E5%AF%BC%E4%B8%BB%E4%BB%BB
            var array1 = data.split("&");
            for (const x in array1) {
                //使用=切割，得到：usernamezXZXZXpasswordZXzXZXrealnamesadsadposts%E6%95%99%E5%AF%BC%E4%B8%BB%E4%BB%BB
                var array2 = array1[x].split("=");
                //如果为空则提示输入
                if (array2[1] == null || array2[1] == ""){
                    $("#Msgss").text(array2[0] + "输入为空，请重新输入");
                    $("#errorMsg").show(1200);
                    setTimeout(function () {
                        $("#errorMsg").hide(800);
                    },1500)
                    return false;
                }
            }

        })

        //注册用户
        $("#registBtn").click(function () {
            //表单序列化
            var data = $("#form2").serialize();
            console.log(data);
            //使用&切割，得到：username=zXZXZX，password=ZXzXZX，realname=sadsad，posts=%E6%95%99%E5%AF%BC%E4%B8%BB%E4%BB%BB
            var array1 = data.split("&");
            for (const x in array1) {
                //使用=切割，得到：usernamezXZXZXpasswordZXzXZXrealnamesadsadposts%E6%95%99%E5%AF%BC%E4%B8%BB%E4%BB%BB
                var array2 = array1[x].split("=");
                console.log(array2);
                //如果为空则提示输入
                if (array2[1] == null || array2[1] == ""){
                    $("#Msgs").text(array2[0] + "输入为空，请重新输入");
                    $("#succMsg").show(1200);
                    setTimeout(function () {
                        $("#succMsg").hide(800);
                    },1500)
                    return false;
                }
            }

            //向register方法ajax传递数据
            $.post("${pageContext.request.contextPath}/login/register",data,function (res) {
                console.log(res);
                if (res.status){
                    //弹出框提示 注册成功！
                    $("#Msgs").html(res.msg);
                    $("#succMsg").show(1200);
                    setTimeout(function () {
                        $("#succMsg").hide(800);
                    },1500)
                }else {
                    //弹出框提示 注册失败！
                    $("#Msgs").text(res.msg);
                    $("#succMsg").show(1200);
                    setTimeout(function () {
                        $("#succMsg").hide(800);
                    },1500)
                }
            },"json");
        })
    })
</script>


<script>
    const signInBtn = document.getElementById("signIn");
    const signUpBtn = document.getElementById("signUp");
    const fistForm = document.getElementById("form1");
    const secondForm = document.getElementById("form2");
    const container = document.querySelector(".container");

    signInBtn.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
    });

    signUpBtn.addEventListener("click", () => {
        container.classList.add("right-panel-active");
    });

    /*fistForm.addEventListener("submit", (e) => e.preventDefault());*/
    secondForm.addEventListener("submit", (e) => e.preventDefault());
</script>
</body>

</html>
