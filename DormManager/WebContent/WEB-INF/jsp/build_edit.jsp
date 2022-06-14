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
    <form class="layui-form"  id="f_auto" action="<%=request.getContextPath()%>/updateBuild" method="post">
        <input type="hidden" value="${sessionScope.b.build_id}" name="build_id" id="build_id" class="layui-input"/>
        <div class="layui-form-item">
            <label for="build_name" class="layui-form-label">
                <span class="">公寓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="build_name" name="build_name"
                       autocomplete="off" value="${sessionScope.b.build_name}" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label for="user_id" class="layui-form-label">
                <span class="">管理员</span>
            </label>
            <div class="layui-input-inline">
               	<select name="user_id">
					<c:forEach items="${users}" var="users">
            			<option value="${users.user_id}">${users.user_name}</option>
					</c:forEach>
				</select> 
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
    //             url: '<%=request.getContextPath()%>/updateBuild',
    //             type: "post",
    //             data: JSON.stringify(param),
    //             contentType: "application/json; charset=utf-8",
    //             success:function(){
    //                 console.log(data);
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log(data);
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);
    //             }
    //         });
    //     })
    //
    // });
</script>
</body>
</html>
