<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.szs.po.Build" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/xadmin.css"><link rel="stylesheet" href="<%=request.getContextPath()%>/lib/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/layui/layui.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/xadmin.js"></script>
    <script src="<%=request.getContextPath()%>/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table{
                text-align: center;
            }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="<%=request.getContextPath()%>/findBuild">公寓信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="<%=request.getContextPath()%>/findBuild" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=request.getContextPath()%>/findBuild" >
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
        </form>
    </div>
    <xblock>
        <button id="addUserBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>
    <%--表格数据--%>
    <table class="layui-table" >
        <thead>
        <tr>
            <th>ID</th>
            <th>公寓名称</th>
            <th>公寓管理员</th>
            <th>管理员联系方式</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="pi">
        <tr>
            <td class="myid">${pi.build_id}</td>
            <td>${pi.build_name}</td>
            <td>${pi.user.user_name}</td>
            <td>${pi.user.user_phone}</td>
            <td class="td-manage">
                <%-- href="<%=request.getContextPath()%>/findBuildById?build_id=${pi.build_id}"--%>
                <a title="编辑" class="updateEdit1" href="<%=request.getContextPath()%>/findBuildById?build_id=${pi.build_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${pi.build_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>
    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10" style="margin: 10px;">
            <form class="layui-form" id="addEmployeeForm">
            <div class="layui-form-item">
            <label for="user_id" class="layui-form-label">
                <span class="">管理员：</span>
            </label>
            <div class="layui-input-inline">
               	<select name="user_id">
               		<option value="0">--请选择管理员--</option>
					<c:forEach items="${users}" var="users">
            			<option value="${users.user_id}">${users.user_name}</option>
					</c:forEach>
				</select> 
            </div>
            <div class="layui-input-inline">
                <div class="layui-form-item">
                    <label class="layui-form-label">公寓名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="build_name" class="layui-input" placeholder="请输入公寓名"  style="width: 190px">
                    </div>
                </div>
             </div>         
        </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<div class="" >
    <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
    <c:import url="pageBtn.jsp">
        <c:param name="totalCount" value="${pi.totalCount}"/>
        <c:param name="currentPageNo" value="${pi.pageIndex}"/>
        <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
    </c:import>
</div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel', 'form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        form.render();

        /*添加弹出框*/
        $("#addUserBtn").click(function () {
            layer.open({
                type:1,
                title:"添加公寓",
                skin:"myclass",
                area:["40%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {          	 
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '<%=request.getContextPath()%>/addBuild',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(da){
                        console.log(da);
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);
                    }
                });
                // return false;
            });
        }); 
		
    });


    /*编辑*/
    $(".updateEdit").click(function () {
        var myid = $(this).parent("td").parent("tr").children(".myid").html();
        //判断
        var admin_id = ${sessionScope.USER_SESSION.user_id};
        if(admin_id != 1){
            layer.alert("对不起，您没有权限:(");
        }else {
            <%--window.location.href = "/findAdminById?a_id=${ai.a_id}";--%>
            window.location.href = "<%=request.getContextPath()%>/findBuildById?build_id=" + myid;
        }
    });

    $(".addUserBtn1").click(function () {
        window.location.href = "<%=request.getContextPath()%>/findUser1";
    });
    
    /*删除*/
    function member_del(obj,build_id){
     
        var id = ${sessionScope.USER_SESSION.user_id};
        if(id != 1){
                layer.alert("对不起，您没有权限:(");
        }
        else {
            layer.confirm('确认要删除吗？',function(index){
                //发异步删除数据
                $.get("<%=request.getContextPath()%>/deleteBuild",{"build_id":build_id},function (data) {
                    if(data = true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findBuild';},2000);
                    }
                });
            });
        }

    }

</script>


</body>


</html>
