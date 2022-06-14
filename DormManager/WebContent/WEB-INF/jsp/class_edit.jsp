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
    <form class="layui-form"  id="f_auto" action="<%=request.getContextPath()%>/updateClass" method="post">
        <input type="hidden" value="${sessionScope.c.class_id}" name="class_id" id="class_id" class="layui-input"/>
        <div class="layui-form-item">
            <label for="class_name" class="layui-form-label">
                <span class="">班级名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="class_name" name="class_name"
                       autocomplete="off" value="${sessionScope.c.class_name}" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label for="class_teacher" class="layui-form-label">
                <span class="">班主任</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="class_teacher" name="class_teacher"
                       autocomplete="off" value="${sessionScope.c.class_teacher}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="class_phone" class="layui-form-label">
                <span class="">班主任电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="class_phone" name="class_phone"
                       autocomplete="off" value="${sessionScope.c.class_phone}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn" id="btn_on"  lay-submit="" lay-filter="updateClass">
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
    //             url: '<%=request.getContextPath()%>/updateClass',
    //             type: "post",
    //             data: JSON.stringify(param),
    //             contentType: "application/json; charset=utf-8",
    //             success:function(){
    //                 console.log(data);
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findClass';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log(data);
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findClass';},2000);
    //             }
    //         });
    //     })
    //
    // });
</script>
</body>
</html>
