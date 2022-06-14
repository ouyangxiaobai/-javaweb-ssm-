<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.szs.po.Dorm" %>
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
        <a href="<%=request.getContextPath()%>/findDorm">宿舍信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="<%=request.getContextPath()%>/findDorm" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=request.getContextPath()%>/findDorm" >
         	<input class="layui-input" placeholder="请输入宿舍号" name="dorm_num" id="dorm_num">
            <input class="layui-input" placeholder="请输入空床数" name="dorm_empty" id="dorm_empty">
            <div style="float: left">
            	<select name="build_id" id="build_id">
           			<option value="0">请选择公寓</option>
           			<c:forEach items="${bd}" var="bd">
            			<option value="${bd.build_id}">${bd.build_name}</option>
					</c:forEach>
				</select>
            </div>     
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
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
            <th>宿舍号</th>
            <th>所属公寓</th>
            <th>宿舍容纳人数</th>
            <th>宿舍空床数</th> 
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="pi">
        <tr>
            <td class="myid">${pi.dorm_id}</td>
            <td>${pi.dorm_num}</td>
            <td>${pi.build.build_name}</td>
            <td>${pi.dorm_capacity}</td>
            <td>${pi.dorm_empty}</td>
            <td class="td-manage">
                <%--href="<%=request.getContextPath()%>/findAdminById?a_id=${ai.a_id}"--%>
                <a title="编辑" class="updateEdit">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${pi.dorm_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>
    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
            	<div class="layui-form-item">
                    <label class="layui-form-label">所属公寓：</label>
                    <div class="layui-input-block">
                        <select name="build_id">
           					<option>请选择公寓</option>
           					<c:forEach items="${bd}" var="bd">
            					<option value="${bd.build_id}">${bd.build_name}</option>
							</c:forEach>
						</select>
                    </div>
                </div>
            
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="dorm_num" class="layui-input" placeholder="请输入宿舍号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">容纳人数：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="dorm_capacity"  class="layui-input" placeholder="请输入宿舍可容纳人数">
                    </div>
                </div>
                
				<div class="layui-form-item">
                    <label class="layui-form-label">空床数：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="dorm_empty"  class="layui-input" placeholder="请输入宿舍空床数">
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
                title:"添加宿舍",
                skin:"myclass",
                area:["60%","50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {          	 
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                //console.log(JSON.stringify(param));
                $.ajax({
                    url: '<%=request.getContextPath()%>/addDorm',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(da){
                        console.log(da);
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findDorm';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findDorm';},2000);
                    }
                });
                // return false;
            });
        });

    });


    /*编辑*/
    $(".updateEdit").click(function () {
        var myid = $(this).parent("td").parent("tr").children(".myid").html();
        window.location.href = "<%=request.getContextPath()%>/findDormById?dorm_id=" + myid;
    });


    /*删除*/
    function member_del(obj,dorm_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
               $.get("<%=request.getContextPath()%>/deleteDorm",{"dorm_id":dorm_id},function (data) {
                    if(data = true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findDorm';},2000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findDorm';},2000);
                    }
                });
            });
        }

</script>


</body>


</html>
