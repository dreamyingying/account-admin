<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>joinMyFamily</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/bootstrap-select.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />

    <![endif]-->
<style>
    #name{
        width: 220px;
    }
    .nDiv{
        position: relative;
        left:60px;
        bottom: 30px;
    }

    #password{
        width:220px;
    }
    .pDiv{
        position: relative;
        left:60px;
        bottom: 30px;
    }
    #address{
        width: 220px;
    }
    .aDiv{
        position: relative;
        left:60px;
        bottom: 30px;
    }
    .fform{
        padding-left: 50px;
    }
    .nameDiv{
        margin-top: 35px;
    }
    .c{
        color: #8B91A0;
        width: 80px;
        height: 32px;
        position: relative;
        left:55px;
    }
    .s{
        width: 80px;
        height: 32px;
        position: relative;
        left:170px;
        bottom: 32px;
    }

</style>
</head>

<body style="background: url('${ml!}/madmin/image/createFamily_bg.jpg') no-repeat;background-size: 100% 100%;overflow-y: hidden;">
        <div class="spdiv"><span id="sp"></span></div>
<div style="padding-left: 40px;">
            <div class="nameDiv">
                <label class="">选择家庭：</label>
                <div class="nDiv">
                    <select id="family" name="family" class="selectpicker" >
                        <option value="0">请选择您的家庭</option>
                        <#list familyList as family>
                            <option value="${family.id}">${family.name}</option>
                        </#list>
                    </select>

                </div>
            </div>
            <div class="">
                <label class="">家庭密码：</label>
                <div class="pDiv">
                    <input id="password" name="password" type="password" class="form-control"  placeholder="请输入家庭密码">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button class="btn btn-warning c" type="button" id="cancel">取消</button>
                </div>
                <div class="col-sm-8 col-sm-offset-3">
                    <button class="btn btn-primary s" type="button" id="btnSave">确定</button>
                </div>
            </div>
</div>



     <!-- 全局js -->
    <script src="${ml!}/madmin/js/jquery.min.js"></script>
    <script src="${ml!}/madmin/js/bootstrap.min.js"></script>
    <script src="${ml!}/madmin/js/plugins/layer/layer.min.js"></script>
    <script src="${ml!}/madmin/js/bootstrap-select.min.js"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${ml!}/madmin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ml!}/madmin/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">


    $(document).ready(function() {
        //取消
        $("#cancel").bind('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        });

        /*提交*/
        $("#btnSave").bind('click',function () {
            var flag = true;
            var id = $("#family option:selected").val();
            var password = $("#password").val();
            if (id==='0'){
                layer.msg("请选择您的家庭",{time:1000});
                return;
            }
            if (password===null || password.trim()==='') {
                layer.msg("密码错误",{time:1000});
                return;
            }
            /*验证账号密码*/
            $.ajax({
                type: "GET",
                dataType: "json",
                async:false,
                url: "${ctx!}/admin/family/checkFamily/"+id+"/"+password,
                success: function(msg){
                    if (!msg.data){
                        layer.msg(msg.message, {time: 1000});
                        flag = false;
                    } else {
                        flag = true;
                    }

                }
            });
            if (!flag){
                return;
            }
            document.getElementById("btnSave").disabled=true;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${ctx!}/admin/userFamily/add/"+id,
                success: function(msg){
                    layer.msg(msg.message, {time: 2000},function(){
                        window.parent.frames.closePage();
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                    });
                }
            });
        });

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
