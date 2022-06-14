<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.szs.po.WanGui" %>
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
	<script src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
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
        <a href="<%=request.getContextPath()%>/findWanGui">晚归情况</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="<%=request.getContextPath()%>/findWanGui" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=request.getContextPath()%>/findWanGui" >
        	<div class="layui-input-inline">
               		<select name="dorm_id">
               			<option value="0">请选择宿舍</option>
						<c:forEach items="${dorms}" var="dorms">
            				<option value="${dorms.dorm_id}">${dorms.dorm_num}</option>
						</c:forEach>
					</select> 
            </div>
            <div class="layui-input-inline">
               		<select name="stu_id">
               			<option value="0">请选择学生</option>
						<c:forEach items="${students}" var="students">
            				<option value="${students.stu_id}">${students.stu_name}</option>
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
            <th>公寓</th>
            <th>宿舍号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>晚归原因</th>
            <th>晚归时间</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="pi">
        <tr>
            <td class="myid">${pi.wg_id}</td>
            <td>${pi.dorm.build.build_name}</td>
            <td>${pi.dorm.dorm_num}</td>
            <td>${pi.student.stu_num}</td>
            <td>${pi.student.stu_name}</td>
            <td>${pi.student.class1.class_name}</td>
            <td>${pi.wg_cause}</td>
            <td>${pi.wg_date}</td>
            <td class="td-manage">
                <%-- href="<%=request.getContextPath()%>/findBuildById?build_id=${pi.build_id}"--%>
                <a title="编辑" class="updateEdit1" href="<%=request.getContextPath()%>/findWanGuiById?wg_id=${pi.wg_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${pi.wg_id}')" href="javascript:;">
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
            	<label for="build_id" class="layui-form-label">
               		<span class="">所属公寓：</span>
            	</label>
            	<div class="layui-input-inline">
               		<select name="build_id">
               			<option value="0">--请选择公寓--</option>
						<c:forEach items="${builds}" var="builds">
            				<option value="${builds.build_id}">${builds.build_name}</option>
						</c:forEach>
					</select> 
            	</div> 
            </div>	
            
            <div class="layui-form-item">
            	<label for="dorm_id" class="layui-form-label">
               		<span class="">所属宿舍：</span>
            	</label>
            	<div class="layui-input-inline">
               		<select name="dorm_id">
               			<option value="0">--请选择宿舍--</option>
						<c:forEach items="${dorms}" var="dorms">
            				<option value="${dorms.dorm_id}">${dorms.dorm_num}</option>
						</c:forEach>
					</select> 
            	</div> 
            </div>
            
            <div class="layui-form-item">
            	<label for="stu_id" class="layui-form-label">
               		<span class="">晚归学生：</span>
            	</label>
            	<div class="layui-input-inline">
               		<select name="stu_id">
               			<option value="0">--请选择学生--</option>
						<c:forEach items="${students}" var="students">
            				<option value="${students.stu_id}">${students.stu_name}</option>
						</c:forEach>
					</select> 
            	</div> 
            </div>
              
            <div class="layui-form-item">
                 <label class="layui-form-label">晚归时间：</label>
                 <div class="layui-input-block">
                     <input type="text" name="wg_date" class="layui-input" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" placeholder="请选择晚归时间"  style="width: 250px">
                 </div>
            </div>   
                
            <div class="layui-form-item">
                 <label class="layui-form-label">晚归原因：</label>
                 <div class="layui-input-block">
                     <!-- <input type="text" name="wg_cause" class="layui-input" placeholder="请输入晚归原因"  style="width: 190px"> -->
                     <textarea rows="15" cols="25" name="wg_cause" class="layui-input" placeholder="请输入晚归原因" style="width: 250px;height: 150px"></textarea>
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
    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        /*添加弹出框*/
        $("#addUserBtn").click(function () {
            layer.open({
                type:1,
                title:"添加晚归记录",
                skin:"myclass",
                area:["60%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '<%=request.getContextPath()%>/addWanGui',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findWanGui';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findWanGui';},2000);
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
            window.location.href = "<%=request.getContextPath()%>/findWanGuiById?wg_id=" + myid;
        }
    });

    $(".addUserBtn1").click(function () {
        window.location.href = "<%=request.getContextPath()%>/findUser1";
    });
    
    /*删除*/
    function member_del(obj,wg_id){
     
        var id = ${sessionScope.USER_SESSION.user_id};
        if(id != 1){
                layer.alert("对不起，您没有权限:(");
        }
        else {
            layer.confirm('确认要删除吗？',function(index){
                //发异步删除数据
                $.get("<%=request.getContextPath()%>/deleteWanGui",{"wg_id":wg_id},function (data) {
                    if(data = true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findWanGui';},2000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findWanGui';},2000);
                    }
                });
            });
        }

    }

</script>


</body>


</html>
