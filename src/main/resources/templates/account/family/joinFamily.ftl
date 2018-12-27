<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>joinFamily</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />

    <![endif]-->
    <style>
        .tipDiv{
            text-align: left;
            font-size: 22px;
            color: #CD8162;
            width: 440px;
            margin-left: 80px;
            margin-top: 20px;
            line-height: 42xp;
        }
        .jDiv{
            float: left;
            margin-top: 40px;
            font-size: 16xp;
        }
        .cDiv{
            float: right;
            margin-top: 40px;
            font-size: 16xp;
        }
    </style>
</head>

<body style="background: url('${ml!}/madmin/image/joinFamily_bg.png') no-repeat;background-size: 100% 100%;overflow-y: hidden;">
<div class="tipDiv">尊敬的<font color="red"><b>${(user.userName)!}</b></font>!您好!您还未拥有属于您自己的家庭!如果您的家人已经创建过家庭了,请您选择【<font color="#5bc0de"><b>加入我的家庭</b></font>】,如果您的家庭是第一次使用系统,请选择【<font color="#23ad44"><b>创建我的家庭</b></font>】</div>
        <div class="jDiv">
            <button style="height: 80px;font-size: 22px;" class="btn btn-info" onclick="joinMyFamily()">加入我的家庭</button>
        </div>
        <div class="cDiv">
            <button style="height: 80px;font-size: 22px;" class="btn btn-success" onclick="createMyFamily()">创建我的家庭</button>
        </div>


     <!-- 全局js -->
    <script src="${ml!}/madmin/js/jquery.min.js"></script>
    <script src="${ml!}/madmin/js/bootstrap.min.js"></script>
    <script src="${ml!}/madmin/js/plugins/layer/layer.min.js"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${ml!}/madmin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ml!}/madmin/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">

        /*加入我的家庭*/
        function joinMyFamily() {
            layer.open({
                type: 2,
                title: '加入我的家庭',
                closeBtn: 0,
                shadeClose: false,
                shade: 0.4,
                area: ['400px', '340px'],
                content: ['${ml!}/admin/family/toJoinMyFamily', 'no'],
                end: function (index) {

                }
            });
        }

        /*创建我的家庭*/
        function createMyFamily() {
            layer.open({
                type: 2,
                title: '创建我的家庭',
                closeBtn: 0,
                shadeClose: false,
                shade: 0.4,
                area: ['400px', '340px'],
                content: ['${ml!}/admin/family/toCreateMyFamily', 'no'],
                end: function (index) {

                }
            });
        }

        function closePage() {
            window.parent.frames.reloadPage();
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        }

        var flag = true;

        function checkTel() {
            var tel = $("#tel").val();
            if (!(/^1([34578])\d{9}$/.test(tel))){
                layer.msg('请输入正确的手机号码',{time:2000},function () {
                });
                flag = false;
                return;
            }
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url:'${ml!}/checkTel/'+tel,
                success:function (msg) {
                    if (msg.data){
                        flag = true;
                    }else {
                        flag = false;
                        layer.msg('手机号已被注册！', {time: 2000},function(){
                        });
                    }
                }
            })
        }

        function sendTelMessage() {
            var but = document.getElementById("sendCode");
            but.disabled = true ;
            checkTel();
            if (!flag){
                return;
            }
            var tel = $("#tel").val();
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"${ctx!}/sendMessage/"+tel,
                success:function (msg) {
                    but.innerHTML = "已发送..";
                    layer.msg("发送成功！",{time: 1000}, function () {
                    });
                }
            })
        }

        function checkCode(tel){
            var code = $("#telCode").val();
            $.ajax({
                type: 'POST',
                url: '${ml!}/checkCode/'+tel+'/'+code,
                dataType: 'json',
                success: function (msg) {
                    if (!msg.data) {
                        flag = false;
                        layer.msg("验证码错误！",{time: 1000}, function () {
                        });
                    }else {
                        flag = true;
                    }
                }
            })
        }



        function register() {
            var tel = $("#tel").val();
            checkTel();
            if (!flag){
                return;
            }
            checkCode(tel);
            if (!flag){
                return;
            }
            $.ajax({
                type: 'POST',
                url: '${ml!}/register/'+tel,
                dataType: 'json',
                success: function (msg) {
                        window.parent.frames.registerMsg(msg.message);
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                }
            })
        }


    $(document).ready(function() {
      /*  //取消修改密码
        $("#cancel").bind('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        });*/

        //修改密码
        /*$("#ok").bind('click',function () {
            resetPassword();
        });

        $("#sendCode").bind('click',function () {
            var uName = $("#old").val();
            checkNull(uName);
            if (flag) {
            sendTelMessage(uName);
            }
        });*/

       /* function sendTelMessage(uName) {
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"${ctx!}/admin/user/sendTelMessage/"+uName,
                success:function (msg) {
                    var but = document.getElementById("sendCode");
                    but.innerHTML = "已发送..";
                    but.disabled = true ;
                    layer.msg("发送成功！",{time: 1000}, function () {
                    });
                }
            })
        }*/
        /*function checkNull(userName) {
            if (userName.length === 0 || userName === null || userName === ''){
                flag = false;
                $("#sp").text("用户名/手机号不能为空！").css({"color":"red","font-size":"14px"});
                return;
            }
            flag = true;
        }

        function checkNullCode(code) {
            if (code.length === 0 || code === null || code === ''){
                flag = false;
                $("#sp").text("请输入验证码").css({"color":"red","font-size":"14px"});
                return;
            }
            flag = true;
        }

        function checkUserName(userName) {
            $.ajax({
                type:"POST",
                dataType:"json",
                async:false,
                url:"${ctx!}/admin/user/checkUserName/"+ userName,
                success:function (msg) {
                        if (msg.data){
                            flag = false;
                            $("#sp").text("用户名/手机号不存在！").css({"color":"red","font-size":"14px"});
                        }else{
                                flag = true;
                            $("#sp").text("").css({"color":"red","font-size":"14px"});
                            }
                        }
            })
        }*/

/*
        function checknull(old,new1,new2) {
            if (old !== '' && new1 !== '' && new2 !== ''){
                flag=true;
                $("#sp").text("");
            }else {
                flag = false;
                $("#sp").text("密码不能为空！！").css({"color":"red","font-size":"14px"});
            }
        }*/
        /*function resetPassword() {
            var userName = $("#old").val();
            var code = $("#telCode").val();
                checkNull(userName);
            if (flag) {
                checkNullCode(code);
            }
            if(flag){
                checkUserName(userName);
            }
            if (!flag){
                return;
            }
            document.getElementById("ok").disabled=true;
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    async:false,
                    url: "${ctx!}/admin/user/resetPassword/"+ userName+"/"+code,
                    success: function (msg) {
                        layer.msg(msg.data, {time: 1000}, function () {
                        if (msg.code === "8200") {
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                        }
                        });
                    }
                })
        }*/

    	// 在键盘按下并释放及提交后验证提交表单
    	  /*$("#frm").validate({
    	    rules: {
    	      username: {
    	        required: true,
    	        minlength: 3
    	      },
    	      password: {
    	        required: true,
    	        minlength: 5
    	      }
    	    },
    	    messages: {
    	      username: {
    	        required: "请输入用户名",
    	        minlength: "用户名长度不能少于 3 位"
    	      },
    	      password: {
    	        required: "请输入密码",
    	        minlength: "密码长度不能小于 6 位"
    	      }
    	    },
    	    submitHandler:function(form){
    	        if (flag) {
                    form.submit();
                }else {
                    $("#l1").html("<font color='red'><b>请输入正确的验证码！！</b></font>");
                }
            }
    	});*/
    });

    </script>
</body>

</html>
