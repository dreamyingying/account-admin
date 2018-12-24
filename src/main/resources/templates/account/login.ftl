<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - welcome</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
<style>
    .login{
        width: 420px;
        height: 400px;
        border: 1px solid #2F4F4F;
        margin-top: 10%;
        margin-left: 40%;
    }
    .ddiv{
        height: 320px;
        background: rgba(0,0,0,0.3);
    }
    .uname{
        width: 70%;
        margin-left: 15%;
    }
    .pwd{
        width:70%;
        margin-left: 15%;
    }
    .button{
        width:70%;
        margin-left: 15%;
    }
    .jiajiadiv{
        line-height: 80px;
        background-color: #5CACEE;
        background: rgba(0,0,0,0.5);
        height: 80px;
        text-align: center;
        font-weight: bolder;
        font-size: 20px;
        color: #BCEE68;
    }
    .logindiv{
        width:70%;
        font-size: 30px;
        color: white;
        font-weight: bolder;
        margin-left: 15%;
    }
    .hr{
        position: relative;
        top: 20px;
    }
    .bdiv{
        text-align: center;
        width: 20%;
        margin-left: 40%;
        color: white;
        font-size: 14px;
        margin-top: 15%;

    }
    .mdiv{
        float:left;
        width: 20%;
        height: 20px;
        text-align: center;
        font-size: 16px;
        color: red;
        position: relative;
        left: 40%;
        top:15%;
    }
    .registerDiv{
        height: 20px;
        position: relative;
        left: 320px;
        top: 32px;
    }
    .registerDiv a{
        font-size: 16px;
        color: #CDC5BF;
        text-decoration: underline #CDC5BF;
    }
    .registerDiv a:hover{
        color: #FCFCFC;
     }
</style>
</head>

<body style="background: url('${ml!}/madmin/image/loginBg.jpg') no-repeat;background-size: 100% 100%;overflow-y: hidden;">
    <#if message??>
<div class="mdiv">
        ${message}
</div>
    </#if>
<div class="login">
    <div class="jiajiadiv">
        <div style="opacity: 1;">
        <font color="#EE82EE" style="font-size: 22px;">佳 佳 </font>家庭账务管理系统
        </div>
    </div>
    <div class="ddiv">
<form id="frm" method="post" action="${ml!}/login">
        <div class="logindiv">
            <span class="hr">Login</span><hr>
        </div>
        <div style="margin-top: 34px;">
            <input type="text" class="form-control uname" id="userName" name="userName" placeholder="用户名/手机号">

        </div>
        <div style="margin-top: 34px;">
            <input style="" type="password" class="form-control pwd m-b" name="password" id="password"  placeholder="密码"/>
        </div>

        <div style="margin-top: 34px;">
            <button class="btn btn-success btn-block button" id="form">
                登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录
            </button>
        </div>
</form>
        <div class="registerDiv">
            <a href="javascript:void (0);" onclick="register()">点击注册</a>
        </div>
    </div>
</div>
<div class="bdiv">
    版权所有：&copy; 孟磊（18201472133@163.com）
</div>
<!-- 全局js -->
<!--jquery-->
<script src="${ml!}/madmin/js/jquery.min.js"></script>
<script src="${ml!}/madmin/js/plugins/validate/jquery.validate.min.js"></script>
<!-- layer -->
<script src="${ml!}/madmin/js/plugins/layer/layer.min.js"></script>
<!--flotdemo-->
<script type="text/javascript">

    $("#frm").validate({
        submitHandler:function (form) {
            form.submit();
        }
    });

    function registerMsg(message) {
        layer.msg(message,{time:3000});
    }

    //弹出注册窗口
    function register() {
        layer.open({
            type: 2,
            title: '用户注册',
            shadeClose: false,
            shade: false,
            area: ['400px', '350px'],
            content: ['${ctx!}/toRegister','no'],
            end: function (index) {

            }
        });

    }
</script>
</body>

</html>
