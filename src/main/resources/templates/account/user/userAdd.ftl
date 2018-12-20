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
                    <div class="ibox-title">
                        <h5>添加用户</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post">
                        	<#--<input type="hidden" id="id" name="id" value="${user.id}">-->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-8">
                                    <input id="userName" name="userName" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">英文名称（中文名称的首字母大写）：</label>
                                <div class="col-sm-8">
                                    <input id="nameEn" name="nameEn" class="form-control" type="text" <#--value="${user.nickName}"-->>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">parentId：</label>
                                <div class="col-sm-8">
                                    <div>
                                        <select id="parentId" name="parentId" class="selectpicker">
                                            <option value="0">无父ID</option>
                                            <#list messageTypeList as messageType>
                                                <option value="${messageType.id}">${messageType.typeName}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit" id="btnSave">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- 全局js -->
    <#include "/admin/common/common.ftl">
    <script type="text/javascript">
    $(document).ready(function () {

        var flag = false;
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
        });

	    $("#frm").validate({
    	    rules: {
                typeName: {
    	        required: true
    	      },
                nameEn: {
    	        required: true
    	      },
                parentId: {
                    required: true
                }
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	        if (!flag){
                    layer.msg('消息类型已存在！', {time: 2000},function(){
                    });
                    return;
                }
                document.getElementById("btnSave").disabled=true;
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/messageType/insert",
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
