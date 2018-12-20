<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 表单验证 jQuery Validation</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                   <#-- <div class="ibox-title">
                        <h5>修改资料</h5>
                    </div>-->
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post">
                        	<input type="hidden" id="id" name="id" value="${user.id}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="userName" name="userName" class="form-control" type="text" value="${user.userName}" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="name" name="name" class="form-control" type="text" value="${user.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">性别：</label>
                                <div class="col-sm-8">
                                    <select name="sex" class="selectpicker">
                                        <option value="0" <#if user.sex == 0>selected="selected"</#if>>女</option>
                                        <option value="1" <#if user.sex == 1>selected="selected"</#if>>男</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">出生日期：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="birthday" name="birthday" autocomplete="off" class="laydate-icon form-control layer-date" value="${user.birthday}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">电话：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="telephone" name="telephone" class="form-control" value="${user.telephone}" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">E-mail：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="email" name="email" class="form-control" value="${user.email}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">地址：</label>
                                <div class="col-sm-8">
                                    <input style="width: 50%;" id="address" name="address" class="form-control" value="${user.address}">
                                </div>
                            </div>



                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit" id="btnSave">确定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- 全局js -->
    <#include "/common/common.ftl">
    <script type="text/javascript">
    $(document).ready(function () {

       /* var flag = false;
        $("#nameEn").blur(function checkNameEn() {
            var nameEn = $("#nameEn").val();
            $.ajax({
                type: 'GET',
                dataType: 'json',
                url:'/admin/messageType/checkNameEn/'+nameEn,
                success:function (msg) {
                    if (msg.data){
                        flag = true;
                    }else {
                        flag = false;
                        layer.msg('消息类型已存在！', {time: 1000},function(){
                        });
                    }
                }
            })
        });*/

        //外部js调用
        laydate({
            elem: '#birthday', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            max:laydate.now(),
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });

	    $("#frm").validate({
    	    rules: {
                /*typeName: {
    	        required: true
    	      },
                nameEn: {
    	        required: true
    	      },
                parentId: {
                    required: true
                }*/
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	       /* if (!flag){
                    layer.msg('消息类型已存在！', {time: 2000},function(){
                    });
                    return;
                }*/
                document.getElementById("btnSave").disabled=true;
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ml!}/admin/user/update",
   	    		   data: $(form).serialize(),
   	    		   success: function(msg){
	   	    			layer.msg(msg.message, {time: 2000},function(){
	   						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	   						parent.layer.close(index);
	   					});
   	    		   }
   	    		});
            }
    	});
    });
    </script>

</body>

</html>
