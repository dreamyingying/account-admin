<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>用户管理</h5>
                    </div>
                    <div class="ibox-content">
                        <div style="margin-left: 93%;margin-bottom: 15px;">
                        		<button class="btn btn-info " type="button" onclick="add();" id="addUser" style="width: 100px;height: 40px;"><i class="fa fa-plus"></i>&nbsp;新建用户</button>
                        </div>
                        <div class="row row-lg">
		                    <div class="col-sm-12">
		                        <!-- Example Card View -->
		                        <div class="example-wrap">
		                            <div class="example">
		                            	<table id="table_list"></table>
		                            </div>
		                        </div>
		                        <!-- End Example Card View -->
		                    </div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <#--<script src="${ml!}/madmin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ml!}/madmin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>-->
	<#include "/common/common.ftl">
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
        	//初始化表格,动态从服务器加载数据
			$("#table_list").bootstrapTable({
			    //使用get请求到服务器获取数据
			    method: "GET",
			    //必须设置，不然request.getParameter获取不到请求参数
			    contentType: "application/x-www-form-urlencoded",
			    //获取数据的Servlet地址
			    url: "${ml!}/admin/user/userList",
			    //表格显示条纹
			    striped: true,
			    //启动分页
			    pagination: true,
			    //每页显示的记录数
			    pageSize: 10,
			    //当前第几页
			    pageNumber: 1,
			    //记录数可选列表
			    pageList: [5, 10, 15, 20, 25],
			    //是否启用查询
			    search: false,
			    //是否启用详细信息视图
			    detailView:false,
			    //detailFormatter:detailFormatter,
			    //表示服务端请求
			    sidePagination: "server",
			    //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
			    //设置为limit可以获取limit, offset, search, sort, order
			    queryParamsType: "undefined",
			    //json数据解析
			    responseHandler: function(res) {
			        return {
			            "rows": res.content,
			            "total": res.totalElements
			        };
			    },
			    //数据列
			    columns: [{
			        title: "序号",
			        formatter:function (value,row,index) {
						return index+1;
                    }
			    },{
			        title: "用户名",
			        field: "userName"
			    },{
			        title: "所属角色",
			        field: "roles"
			    },{
			        title: "姓名",
			        field: "name"
			    },{
			        title: "性别",
			        field: "sex",
			        formatter: function(value, row, index) {
                        if (value == '0')
                        	return '<span class="label label-warning">女</span>';
                        return '<span class="label label-primary">男</span>';
                    }
			    },{
			        title: "生日",
			        field: "birthday"
			    },{
			        title: "手机号",
			        field: "telephone"
			    },{
			        title: "邮箱",
			        field: "email"
			    },{
                    title: "地址",
                    field: "address"
                },{
			        title: "状态",
			        sortable: true,
			        field: "deleteStatus",
                    formatter: function (value, row, index) {
                        if (value == '0')
                        	return '<span class="label label-info">未删除</span>';
                        return '<span class="label label-danger">已删除</span>';
                    }
			    },{
			        title: "锁定",
			        field: "locked",
			        formatter: function (value, row, index) {
                        if (value == '0')
                        	return '<span class="label label-info">未锁定</span>';
                        return '<span class="label label-danger">已锁定</span>';
                    }
			    },{
			        title: "创建时间",
			        field: "createTime",
			        sortable: true
			    },{
			        title: "更新时间",
			        field: "updateTime",
			        sortable: true
			    },{
			        title: "操作",
			        field: "empty",
                    formatter: function (value, row, index) {
                    	var operateHtml = '<button class="btn btn-primary btn-xs" type="button" id="editUser" onclick="update(\''+row.id+'\')"><i class="fa fa-edit"></i>&nbsp;修改</button> &nbsp;';
                    	operateHtml = operateHtml + '<button class="btn btn-danger btn-xs" type="button" onclick="del(\''+row.id+'\')"><i class="fa fa-remove"></i>&nbsp;删除</button> &nbsp;';
                    	operateHtml = operateHtml + '<button class="btn btn-info btn-xs" type="button" id="grantUser" onclick="grant(\''+row.id+'\')"><i class="fa fa-arrows"></i>&nbsp;关联角色</button>';
                        return operateHtml;
                    }
			    }]
			});
        });

        function update(id){
        	layer.open({
        	      type: 2,
        	      title: '修改信息',
        	      shadeClose: false,
        	      area: ['893px', '600px'],
        	      content: '${ml!}/admin/user/toUpdate/' + id,
        	      end: function(index){
        	    	  $('#table_list').bootstrapTable("refresh");
                      $("button").attr('disabled',false);
                  }
        	    });
            $("button").attr('disabled',true);
        }
        /* function add(){
             layer.open({
                   type: 2,
                   title: '用户添加',
                   shadeClose: false,
                   area: ['893px', '600px'],
                   content: '${ctx!}/admin/user/add',
        	      end: function(index){
        	    	  $('#table_list').bootstrapTable("refresh");
                      $("button").attr('disabled',false);
       	    	  }
        	    });
            $("button").attr('disabled',true);
        }
        function grant(id){
        	layer.open({
        	      type: 2,
        	      title: '关联角色',
        	      shadeClose: false,
        	      area: ['893px', '600px'],
        	      content: '${ctx!}/admin/user/grant/'  + id,
        	      end: function(index){
                      $('#table_list').bootstrapTable("refresh");
                      $("button").attr('disabled',false);
                  }
        	    });
            $("button").attr('disabled',true);
        }*/
        function del(id){
        	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
        		$.ajax({
    	    		   type: "POST",
    	    		   dataType: "json",
    	    		   url: "${ml!}/admin/user/del/" + id,
    	    		   success: function(msg){
	 	   	    			layer.msg(msg.message, {time: 2000},function(){
	 	   	    				$('#table_list').bootstrapTable("refresh");
	 	   	    				layer.close(index);
	 	   					});
    	    		   }
    	    	});
       		});
        }
    </script>




</body>

</html>
