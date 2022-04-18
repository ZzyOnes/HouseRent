
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
                            <h4>订单管理</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> 订单列表</th>
                                <th>租客</th>
                                <th>房东</th>
                                <th>操作</th>
                            </tr>

                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}" alt="">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></h4>
                                            <span>${c.house.address}</span>
                                            <span class="table-property-price">开始时间：
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${c.startDate}"/><br/>
                                                到期时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${c.endDate}"/>
                                            </span>
                                            <span class="table-property-price">总金额：¥ ${c.totalAmount}</span>
                                                <%--                                            订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3已取消，2申请退租，3申请退租不通过--%>
                                            <c:choose>
                                                <c:when test="${c.status == -2}"> <span
                                                        class="text-warning"> 待签合同 </span></c:when>
                                                <c:when test="${c.status == -1}"> <span
                                                        class="text-warning"> <a href="/order/pay?orderId=${c.id}">待付款</a> </span></c:when>
                                                <c:when test="${c.status == 0}"> <span
                                                        class="text-success"> 合同已生效 </span></c:when>
                                                <c:when test="${c.status == 1}"> <span
                                                        class="text-danger"> 已退租 </span></c:when>
                                                <c:when test="${c.status == -3}"> <span
                                                        class="text-warning"> 订单已取消 </span></c:when>
                                                <c:when test="${c.status == 2}"> <span
                                                        class="text-warning"> 已申请退租 </span></c:when>
                                                <c:when test="${c.status == 3}"> <span
                                                        class="text-warning"> 申请退租驳回 </span></c:when>
                                            </c:choose>

                                        </div>
                                    </td>
                                    <td>
                                        <a href="/admin/order/query/customer?userId=${c.customerUser.id}">${c.customerUser.userDisplayName}</a>&nbsp;(${c.customerUser.userName})<br/>${c.customerUser.phone}
                                    </td>
                                    <td>
                                        <a href="/admin/order/query/owner?userId=${c.ownerUser.id}">  ${c.ownerUser.userDisplayName}</a>&nbsp;(${c.ownerUser.userName})<br/>${c.ownerUser.phone}
                                    </td>
                                    <td>
                                        <a class="delete" href="/order/agreement/view?orderId=${c.id}" target="_blank">查看合同</a>
                                        <br>

                                        <c:if test="${c.status == -2 || c.status == -1}">
                                            <a class="delete" href="javascript:void(0)"
                                               onclick="cancelOrder(${c.id})">取消订单</a>
                                        </c:if>
                                        <c:if test="${c.status   == 0 || c.status == 3}">
                                            <a class="delete" href="javascript:void(0)"
                                               onclick="endOrder(${c.id})">申请退租</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role != 'customer' && c.status == 2}">
                                            <a class="delete" href="javascript:void(0)" onclick="endOrderPass(${c.id})">退租申请通过</a>
                                            <a class="delete" href="javascript:void(0)" onclick="endOrderReject(${c.id})">退租申请拒绝</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.role == 'customer' && c.status == 0}">
                                            <a href="/report?ownerId=${c.ownerUserId}" class="delete" >我要报障</a>
                                        </c:if>
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
                    <!-- row -->

                </div>
            </div>
        </div>
    </div>
</section>
<%--<!-- 报障弹出窗 Modal -->
<div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">报障</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <div class="login-form">
                    <form id="reportForm">
                        <div class="row">

                            <input type="hidden" name="id" id="feedbackId">
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>报障内容</label>
                                    <div class="input-with-icon">
                                        <textarea class="form-control" name="content"
                                                  style="padding-left: 15px!important ;height: 300px"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>姓名</label>
                                <div class="input-with-icon">
                                    <input type="text" class="form-control" name="userName" placeholder="姓名">
                                    <i class="ti-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>联系方式</label>
                                <div class="input-with-icon">
                                    <input type="email" class="form-control" name="phone" placeholder="您的联系方式">
                                    <i class="ti-unlock"></i>
                                </div>
                            </div>
                            <input type="hidden" name="ownerId" value="">

                        </div>

                        <div class="form-group">
                            <button type="button" onclick="reportReplySubmit()"
                                    class="btn btn-md full-width pop-login bg-2">回复提交
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
