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
	<div class="layui-form" style="margin:0 auto; width: 550px;">
		<div class="layui-form-item" >
            <label for="stu_num" class="layui-form-label">
                <span class="">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stu_num" name="stu_num"
                       autocomplete="off" value="${sessionScope.s.stu_num}" class="layui-input" disabled="disabled">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label for="class_id" class="layui-form-label">
                <span class="">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</span>
            </label>
            <div class="layui-input-inline">
               	<select name="class_id" disabled="disabled">
					<c:forEach items="${cList}" var="cList">
            			<option value="${cList.class_id}">${cList.class_name}</option>
					</c:forEach>
				</select>
            </div>          
        </div>

		<div class="layui-form-item">
            <label for="stu_name" class="layui-form-label">
                <span class="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stu_name" name="stu_name"
                       autocomplete="off" value="${sessionScope.s.stu_name}" class="layui-input" disabled="disabled">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label for="stu_sex" class="layui-form-label">
                <span class="">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
            </label>
            <div class="layui-input-inline">
            	<input type="text" id="stu_sex" name="stu_sex"
                       autocomplete="off" value="${sessionScope.s.stu_sex}" class="layui-input" disabled="disabled">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label for="stu_date" class="layui-form-label">
                <span class="">入学时间</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stu_date" name="stu_date"
                       autocomplete="off" value="${sessionScope.s.stu_date}" class="layui-input" disabled="disabled">
            </div>
        </div>
     </div>
    <%--把表单封装成一个Student对象传给服务端--%>
    <form class="layui-form"  id="f_auto" action="<%=request.getContextPath()%>/removeDormStudent" method="post" style="margin:0 auto; width: 550px;">
        <input type="hidden" value="${sessionScope.s.stu_id}" name="stu_id" id="stu_id" class="layui-input"/>
        <input type="hidden" value="${sessionScope.s.dorm_id}" name="old_dorm_id" id="old_dorm_id" class="layui-input"/>
        
        <div class="layui-form-item" id="btn_xg">
          	<button  class="layui-btn" id="btn_on"  lay-submit="" lay-filter="updateUser">
                确定移除
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
    //             url: '<%=request.getContextPath()%>/removeDormStudent',
    //             type: "post",
    //             data: JSON.stringify(param),
    //             contentType: "application/json; charset=utf-8",
    //             success:function(){
    //                 console.log(data);
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findStudent';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log(data);
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findStudent';},2000);
    //             }
    //         });
    //     })
    //
    // });
</script>
</body>
</html>
