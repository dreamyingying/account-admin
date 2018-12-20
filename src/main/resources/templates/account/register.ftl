<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>editPassword</title>
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
        .reg{
        }
        .tel{

            width:80%;
            margin-left: 10%;
        }
        .code{
            width:50%;
        }
        .fs{
        }
        .butt{
            width:80%;
            margin-left: 10%;
        }
    </style>
</head>

<body>
    <div class="reg">
        <div><span style="text-align: center" id="sp"></span></div>
                    <div class="tel"><input class="form-control" name="tel" id="tel" placeholder="请输入手机号码"/></div>
                    <div class="code">
                        <input class="form-control" name="tel" id="telCode" placeholder="请输入手机验证码">
                    </div>
                    <div class="fs">
                        <button style="float: left;margin-left:10px;margin-top: 3px;" name="sendCode" id="sendCode">发送验证码</button>
                    </div>
        <div class="butt">
            <button class="btn btn-info btn-block button">立即注册</button>
        </div>
    </div>

     <!-- 全局js -->
    <script src="${ctx!}/hadmin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx!}/hadmin/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx!}/hadmin/js/plugins/layer/layer.min.js?v=${version!}"></script>

    <!-- 自定义js -->
    <script src="${ctx!}/hadmin/js/content.js?v=1.0.0"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${ctx!}/hadmin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx!}/hadmin/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {

        var flag = false;

      /*  //取消修改密码
        $("#cancel").bind('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        });*/

        //修改密码
        $("#ok").bind('click',function () {
            resetPassword();
        });

        $("#sendCode").bind('click',function () {
            var uName = $("#old").val();
            checkNull(uName);
            if (flag) {
            sendTelMessage(uName);
            }
        });

        function sendTelMessage(uName) {
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
        }
        function checkNull(userName) {
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
        }

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
        function resetPassword() {
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
        }

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
