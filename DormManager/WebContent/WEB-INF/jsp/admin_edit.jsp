<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/xadmin.css"><link rel="stylesheet" href="<%=request.getContextPath()%>/lib/layui/css/layui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pg_btn.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/layui/layui.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/xadmin.js"></script>
</head>

<body>

<div class="x-body">
    <%--把表单封装成一个Admin对象传给服务端--%>
    <form class="layui-form"  id="f_auto" action="<%=request.getContextPath()%>/updateUser" method="post">
        <input type="hidden" value="${sessionScope.u.user_id}" name="user_id" id="user_id" class="layui-input"/>
        <div class="layui-form-item">
            <label for="user_name" class="layui-form-label">
                <span class="">用户名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="user_name" name="user_name"
                       autocomplete="off" value="${sessionScope.u.user_name}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="user_password" class="layui-form-label">
                <span class="">密码</span>
            </label>
            <div class="layui-input-inline">
                <input type="user_password" id="user_password" name="user_password"
                       autocomplete="off" value="${sessionScope.u.user_password}" class="layui-input">
            </div>
        </div>

		<div class="layui-form-item">
            <label for="user_password" class="layui-form-label">
                <span class="">联系方式</span>
            </label>
            <div class="layui-input-inline">
                <input type="user_phone" id="user_phone" name="user_phone"
                       autocomplete="off" value="${sessionScope.u.user_phone}" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label for="user_access" class="layui-form-label">
                <span class="">用户类型</span>
            </label>
            <div class="layui-input-inline">
            <input type="radio" name="user_access" value="teacher" checked="checked"><span style="margin-left: -20px;">宿管老师</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="user_access" value="root"><span style="margin-left: -20px;">管理员</span>
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn" id="btn_on"  lay-submit="" lay-filter="updateUser">
                修改
            </button>
        </div>
    </form>
</div>

<script>
    // layui.use(['form','layer','laydate'], function(){
    //     var form = layui.form,
    //         $ = layui.jquery,
    //         laydate = layui.laydate;
    //
    //     $("#f_auto")[0].reset();
    //     form.on('submit(updateAdmin)', function(data) {
    //
    //         var param=data.field;
    //
    //         $.ajax({
    //             url: '<%=request.getContextPath()%>/updateUser',
    //             type: "post",
    //             data: JSON.stringify(param),
    //             contentType: "application/json; charset=utf-8",
    //             success:function(){
    //                 console.log(data);
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findUser';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log(data);
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findUser';},2000);
    //             }
    //         });
    //     })
    //
    // });
</script>
</body>
</html>
