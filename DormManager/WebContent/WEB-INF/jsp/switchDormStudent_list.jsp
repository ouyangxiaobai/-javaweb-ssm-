<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.szs.po.Student" %>
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
        <a href="<%=request.getContextPath()%>/findSwitchDormStudent">学生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="<%=request.getContextPath()%>/findSwitchDormStudent" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=request.getContextPath()%>/findSwitchDormStudent" >
            <input class="layui-input" placeholder="请输入学号" name="stu_num" id="stu_num">
			<div style="float: left">
            	<select name="class_id" id="class_id">
           			<option value="0">请选择班级</option>
           			<c:forEach items="${cs}" var="cs">
            			<option value="${cs.class_id}">${cs.class_name}</option>
					</c:forEach>
				</select>
            </div>  
            <div style="float: left">
            	<select name="dorm_id" id="dorm_id">
           			<option value="0">请选择宿舍号</option>
           			<c:forEach items="${dm}" var="dm">
            			<option value="${dm.dorm_id}">${dm.dorm_num}</option>
					</c:forEach>
				</select>
            </div>   
            <!-- <input type="hidden" name="dorm_id" id="dorm_id" value=""> -->
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
        </form>      
    </div>   

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="stu_num"   class="layui-input" placeholder="请输入学号">
                    </div>
                </div>
                
				<div class="layui-form-item">
                    <label class="layui-form-label">班级：</label>
                    <div class="layui-input-block">
                        <select name="class_id">
           					<option>请选择班级</option>
           					<c:forEach items="${cs}" var="cs">
            					<option value="${cs.class_id}">${cs.class_name}</option>
							</c:forEach>
						</select>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="stu_name"  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

				<div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input type="password" lay-verify="required" name="stu_password"  class="layui-input" placeholder="请输入密码">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="radio" name="stu_sex" value="男" title="男" checked="">
                        <input type="radio" name="stu_sex" value="女" title="女">
                        <%--<input type="text" name="s_sex" class="layui-input" id="s_sex" placeholder="请输入性别">--%>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">入学时间：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stu_date" class="layui-input"  placeholder="请输入入学时间，格式：YYYY-MM-DD">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="stu_phone"  class="layui-input" placeholder="请输入电话">
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

    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th>--%>
                <%--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</th>--%>
            <th>ID</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>入学时间</th>
            <th>电话</th>
            <th>班级</th>
            <th>班主任</th>
            <th>公寓</th>
            <th>宿舍号</th>            
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="student">
        <tr>
            <%--<td>--%>
                <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</td>--%>
            <td class="myid">${student.stu_id}</td>
            <td>${student.stu_num}</td>
            <td>${student.stu_name}</td>
            <td>${student.stu_sex}</td>
            <td>${student.stu_date}</td>
            <td>${student.stu_phone}</td>
            <td>${student.class1.class_name}</td>
            <td>${student.class1.class_teacher}</td>
            <td>${student.dorm.build.build_name}</td>
            <td>${student.dorm.dorm_num}</td>
            <td>
                <a title="更换宿舍" id= "updateEdit1" href="<%=request.getContextPath()%>/findSwitchDormStudentById?stu_id=${student.stu_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
				<a title="移出宿舍" href="<%=request.getContextPath()%>/findSwitchDormStudentByIdRemove?stu_id=${student.stu_id}">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>

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
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加学生",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '<%=request.getContextPath()%>/addStudent',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findStudent';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findStudent';},2000);
                    }
                });
                // return false;
            });
        });


    });

    /*删除*/
    function member_del(obj,stu_id){
        layer.confirm('确认要将该学生移出宿舍吗？',function(index){
            //发异步删除数据
           $.get("<%=request.getContextPath()%>/removeDormStudent",{"stu_id":stu_id,"dorm_id":0},function (data) {
                if(data =true){
                    layer.msg('移出成功!',{icon:1,time:2000});
                  setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findSwitchDormStudent';},2000);

                }else {
                    layer.msg('移出失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='<%=request.getContextPath()%>/findSwitchDormStudent';},2000);
                }
            });
        });
    }

</script>


</body>


</html>
