<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<html>

<body>

<section class="p-0">
    <div class="container-fluid p-0">

        <!-- row Start -->
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">

                    <div class="dashboard-wraper">

                        <!-- Bookmark Property -->
                        <div class="frm_submit_block">
                            <h4>我的报障</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> 报障列表</th>
                                <th></th>
                            </tr>

                            <c:forEach items="${Info}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <div class="title">
                                            <h4>报障时间</h4>
                                            <p><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" /></p>
                                            <p>内容：${c.content}</p>
                                            <%--<p>姓名：${c.user_name}  联系方式：${c.user_phone}</p>--%>
                                            <p><c:choose>
                                                <c:when test="${c.status == 0}"><span
                                                        class="text-warning">未处理</span></c:when>
                                                <c:when test="${c.status == 1}"><span
                                                        class="text-success">已处理请看房东回复</span></c:when>
                                            </c:choose>
                                                 </p>
                                        </div>
                                    </td>
                                    <td class="action">

                                        <a href="javascript:void(0)" class="delete" onclick="deleteReport(${c.id})">删除报障</a>
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
                                <p class="mb-0">© 2021 Zzy. All Rights Reserved</p>
                            </footer>
                        </div>
                    </div>
        <!-- /row -->

    </div>

</section>

<%@ include file="../common/footer.jsp" %>
<script>

    function deleteReport(id) {
        $.ajax({
            type: 'POST',
            url: '/admin/report/delete',
            async: false,
            data: {
                "id": id
            },
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 如果操作成功，刷新页面
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
</script>
</body>
</html>