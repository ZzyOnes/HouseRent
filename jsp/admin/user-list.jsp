
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<html>
<body>
<!-- ============================ User Dashboard ================================== -->
<section class="p-0">
    <div class="container-fluid p-0">

        <div class="row">

            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">

                    <div class="dashboard-wraper">

                        <!-- Bookmark Property -->
                        <div class="frm_submit_block">
                            <h4>用户管理</h4>
                            <form class="input-group" action="/admin/user/query" method="post" style="height: 50px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input  type="text" class="form-control" name="userName" placeholder="请输入用户名查询" style="height: 50px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-theme bg-2">搜索</button>
                            </form>
                        </div>

                        <table class="property-table-wrap responsive-table">

                            <tbody>
                            <tr>
                                <th style="width: 25%;">账号信息</th>
                                <th>联系方式</th>
                                <th>其他信息</th>
                                <th>角色</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td>
                                        <span title="用户名">${c.userName}</span> <span title="姓名">${c.userDisplayName}</span> <br><span title="身份证号码">${c.idCard}</span>
                                    </td>
                                    <td>
                                        <span title="邮箱">${c.email}</span> <br>
                                        <span title="电话">${c.phone}</span> <br>
                                    </td>
                                    <td>
                                        <span title="爱好">${c.hobby}</span> <br>
                                        <span title="职业">${c.job}</span>
                                    </td>
                                    <td>
                                        <span title="角色">
                                            <c:choose>
                                                <c:when test="${c.role=='admin'}">
                                                    <span class="text-danger">管理员</span>
                                                </c:when>
                                                <c:when test="${c.role=='owner'}">
                                                    <span style="color: #0f7dff">房东</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-success">租客</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </span> <br>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                                    <span class="text-success">启用</span>
                                            </c:when>
                                            <c:otherwise>
                                                    <span class="text-danger">禁用</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="action">
                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                                <a href="javascript:void(0)" class="delete"
                                                   onclick="disableUser(${c.id})">禁用</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0)" class="delete"
                                                   onclick="enableUser(${c.id})">启用</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                    </div>

                    <!-- Pagination 分页 -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <%@ include file="../common/page.jsp" %>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12 mt-4">
                            <footer class="text-center">
                                <p class="mb-0">© 2021 Zzy. All Rights
                                    Reserved</p>
                            </footer>
                        </div>
                    </div>
                    <!-- row -->

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
