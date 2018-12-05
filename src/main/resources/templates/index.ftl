<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title> 家庭账务系统- 主页</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ml!}/madmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/animate.css" rel="stylesheet">
    <link href="${ml!}/madmin/css/style.css" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-pencil-square-o"></i>
                                        <strong class="font-bold">家庭账务系统</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">家庭账务系统
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope"></span>
                </li>
            <#--<li>
                <a class="J_menuItem" href="${ctx!}/hadmin/index.html" target="_blank">
                    <i class="fa fa-television"></i>
                    <span class="nav-label">实例demo</span>
                </a>
            </li>-->
                <li>
                    <a class="J_menuItem" href="${ctx!}/admin/welcome">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
            <@shiro.hasPermission name="system:manage">
                <li>
                    <a href="#">
                        <i class="fa fa fa-cog"></i>
                        <span class="nav-label">系统管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                         <@shiro.hasPermission name="system:user:index">
                            <li>
                                <a class="J_menuItem" href="${ctx!}/admin/user/index">用户管理</a>
                            </li>
                         </@shiro.hasPermission>
                         <@shiro.hasPermission name="system:role:index">
                            <li>
                                <a class="J_menuItem" href="${ctx!}/admin/role/index">角色管理</a>
                            </li>
                         </@shiro.hasPermission>
                         <@shiro.hasPermission name="system:resource:index">
                            <li>
                                <a class="J_menuItem" href="${ctx!}/admin/resource/index">资源管理</a>
                            </li>
                         </@shiro.hasPermission>
                    </ul>
                </li>
            </@shiro.hasPermission>

                <li class="line dk"></li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i
                        class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-user"></i> <span
                                class="label label-primary"></span>【欢迎您：<font
                                color="red"><@shiro.principal type="com.sparrow.hadmin.entity.User" property="userName"/></font>】
                        </a>
                        <ul class="dropdown-menu dropdown-alerts" style="width: 165px">
                            <li>
                                <a href="javascript:void(0);" onclick="editPassword()">
                                    <div>
                                        <i class="fa fa-edit"></i> 修改密码
                                    <#-- <span class="pull-right text-muted small"><@shiro.principal type="com.sparrow.hadmin.entity.User"/></span>-->
                                    </div>
                                </a>
                                <a href="javascript:void(0);" onclick="changeTel()">
                                    <div>
                                        <i class="fa fa-tablet"></i> 更换绑定手机
                                    <#-- <span class="pull-right text-muted small"><@shiro.principal type="com.sparrow.hadmin.entity.User"/></span>-->
                                    </div>
                                </a>
                                <a href="${ctx!}/admin/logout">
                                    <div>
                                        <i class="fa fa-remove"></i> 注销登陆
                                    <#--<span class="pull-right text-muted small"><@shiro.principal type="com.sparrow.hadmin.entity.User" /></span>-->
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="${ctx!}/admin/welcome" frameborder="0"
                    data-id="index_v1.html" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->

</div>

<!-- 全局js -->
<script src="${ctx!}/hadmin/js/jquery.min.js"></script>
<script src="${ctx!}/hadmin/js/bootstrap.min.js"></script>
<script src="${ctx!}/hadmin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx!}/hadmin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx!}/hadmin/js/plugins/layer/layer.min.js?v=${version!}"></script>

<!-- 自定义js -->
<script src="${ctx!}/hadmin/js/hAdmin.js"></script>
<script type="text/javascript" src="${ctx!}/hadmin/js/index.js?v=${version!}"></script>
<script type="text/javascript">
    function editPassword() {
        layer.open({
            type: 2,
            title: '修改密码',
            shadeClose: true,
            shade: false,
            area: ['350px', '320px'],
            content: ['${ctx!}/admin/toEditPassword','no'],
            end: function (index) {

            }
        });
    }

    function changeTel() {
        layer.open({
            type: 2,
            title: '更换绑定手机',
            shadeClose: true,
            shade: false,
            area: ['350px','260px'],
            content: ['${ctx!}/admin/toChangeTel','no'],
            /*success:function(layero,index){
                layer.iframeAuto(index);
            },*/
            end: function (index) {

            }
        });
    }

    $(document).ready(function () {
    })
</script>
</body>

</html>
