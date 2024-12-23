<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>724便利店管理系统</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/public.css">
    <link rel="stylesheet" href="../assets/css/list.css">
</head>
<body>
<%@include file="/WEB-INF/jsp/layouts/header.jsp"%>
<div class="main">
    <%@include file="/WEB-INF/jsp/layouts/aside.jsp"%>
    <div class="body">
        <div class="inner">
            <div class="bread">当前位置: <span>用户管理 >> 用户列表</span></div>
            <div class="search">
                <!-- 表单GET请求当前页面，即/sysUser/index -->
                <form action="" method="get">
                    <div>
                        <label for="account">账号：</label>
                        <!-- 查询表单中的查询条件做数据回显 -->
                        <input type="text" id="account" name="account" value="${where.account}">
                    </div>
                    <div>
                        <label for="roleId">角色名称：</label>
                        <select id="roleId" name="roleId">
                            <option value="">--全部--</option>
                            <!-- 遍历角色表实体类对象列表展示下拉框 -->
                            <c:forEach items="${sysRoleList}" var="sysRole">
                                <option value="${sysRole.id}"
                                    <c:if test="${sysRole.id == where.roleId}">
                                        selected
                                    </c:if>
                                >${sysRole.roleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <button type="submit"><span>查询</span></button>
                    </div>
                    <a href="/sysUser/add.html"><span>添加</span></a>
                </form>
            </div>
            <table>
                <thead>
                <tr>
                    <th>账号</th>
                    <th>真实姓名</th>
                    <th>角色名称</th>
                    <th>性别</th>
                    <th>手机号码</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 遍历用户表实体类对象列表展示表格 -->
                <!-- 从分页数据对象中获取数据列表并遍历 -->
                <c:forEach items="${pageInfo.list}" var="sysUser">
                <tr>
                    <td>${sysUser.account}</td>
                    <td>${sysUser.realName}</td>
                    <td>${sysUser.sysRole.roleName}</td>
                    <td>${sysUser.sex == 1 ? "女" : "男"}</td>
                    <td>${sysUser.phone}</td>
                    <td>
                        <a href="view.html" class="view"><img src="/assets/images/view.png" alt=""></a>
                        <a href="update.html" class="update"><img src="/assets/images/upd.png" alt=""></a>
                        <a href="#" class="deleted"><img src="/assets/images/del.png" alt=""></a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav class="page">
                <!-- 从分页数据对象中获取数据列表并展示 -->
                <div>当前第 ${pageInfo.pageNum} 页 / 共 ${pageInfo.pages} 页 / 共 ${pageInfo.total} 条数据</div>
                <ul>
                    <!-- 分页按钮点击的时候，需要传递完整的查询条件 -->
                    <li><a href="/sysUser/list?pageNum=1&account=${where.account}&roleId=${where.roleId}">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="/sysUser/list?pageNum=${pageInfo.prePage}&account=${where.account}&roleId=${where.roleId}">上一页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li><a href="/sysUser/list?pageNum=${pageInfo.nextPage}&account=${where.account}&roleId=${where.roleId}">下一页</a></li>
                    </c:if>
                    <li><a href="/sysUser/list?pageNum=${pageInfo.pages}&account=${where.account}&roleId=${where.roleId}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/jsp/layouts/footer.jsp"%>
</body>
</html>
