
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<html>
<body>
<!-- ============================ All Property ================================== -->
<section class="gray-simple">

    <div class="container">

        <div class="row">

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="hidden-md-down">

                    <div class="page-sidebar">

                        <!-- Find New Property -->
                        <div class="sidebar-widgets" data-select2-id="28">

                            <form action="/admin/house/search" method="post">

                                <div class="form-group">
                                    <div class="simple-input" >
                                        <select id="cityArea" name="cityArea" class="form-control" >
                                            <option value="吉首城区"
                                                    <c:if test="${houseSearchVO.city == '吉首城区'}">selected</c:if>>
                                                吉首城区
                                            </option>

                                        </select>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="simple-input">
                                        <select id="selectRentType" name="rentType" class="form-control">
                                            <option value="">不限</option>
                                            <option value="whole"
                                                    <c:if test="${houseSearchVO.rentType == 'whole'}">selected</c:if>>整租
                                            </option>
                                            <option value="share"
                                                    <c:if test="${houseSearchVO.rentType == 'share'}">selected</c:if>>合租
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-with-icon">
                                        <input type="text" class="form-control" name="address" placeholder="小区"
                                               value="${houseSearchVO.address}">
                                        <i class="ti-search"></i>
                                    </div>
                                </div>





                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
                                        <h6>选择价格范围</h6>
                                        <div class="rg-slider">
                                            <input type="text" class="js-range-slider-price" name="priceRange"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
                                        <h6>选择面积范围</h6>
                                        <div class="rg-slider">
                                            <input type="text" class="js-range-slider-area" name="areaRange" value=""/>
                                        </div>
                                    </div>
                                </div>


                                <div class="ameneties-features">
                                    <button type="submit" class="btn btn-theme full-width bg-2">搜索</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
                <!-- Sidebar End -->

            </div>


            <div class="col-lg-8 col-md-12 col-sm-12">


                <div class="row">

                    <c:forEach items="${pageInfo.records}" var="c">
                        <!-- Single Property -->
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="dashboard_property_list">
                                <div class="dashboard_property_list_thumb">
                                    <img src="${c.thumbnailUrl}" class="img-fluid" alt=""/>
                                    <c:choose>
                                        <c:when test="${c.status == 1}">
                                            <span class="dashboard_pr_status">未租出</span>
                                        </c:when>
                                        <c:when test="${c.status == 0}">
                                            <span class="dashboard_pr_status published">已租出</span>
                                        </c:when>
                                        <c:when test="${c.status == -1}">
                                            <span class="dashboard_pr_status expire">已下架</span>
                                        </c:when>
                                        <c:when test="${c.status == -2}">
                                            <span class="dashboard_pr_status expire">待审核</span>
                                        </c:when>
                                        <c:when test="${c.status == -3}">
                                            <span class="dashboard_pr_status expire">审核驳回</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="dashboard_pr_status ">未知状态</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="dashboard_property_list_content">
                                    <h4>${c.title}</h4>
                                    <span><i class="ti-location-pin"></i>${c.address}</span>
                                </div>
                                <div class="dashboard_property_list_footer">
                                    <a href="/house/detail/${c.id}" data-toggle="tooltip" title="查看"><i
                                            class="ti-eye"></i></a>

                                        <%--   已租出的房子无法修改信息     --%>
                                    <c:if test="${c.status != 0}">
                                        <a href="/admin/house/publish?id=${c.id}" data-toggle="tooltip"
                                           title="编辑"><i
                                                class="ti-pencil"></i></a>
                                    </c:if>

                                    <c:choose>
                                        <c:when test="${c.status == 1}">
                                            <a href="javascript:void(0)" onclick="downHouse(${c.id})"
                                               data-toggle="tooltip" title="下架"><i class="ti-control-pause"></i></a>
                                        </c:when>
                                        <c:when test="${c.status == -1}">
                                            <a href="javascript:void(0)" onclick="upHouse(${c.id})"
                                               data-toggle="tooltip" title="上架" data-original-title="Running"><i
                                                    class="ti-control-play"></i></a>
                                        </c:when>
                                    </c:choose>
                                    <a href="javascript:void(0)" onclick="deleteHouse(${c.id})"
                                       data-toggle="tooltip" title="删除"><i class="ti-close"></i></a>

                                    <c:if test="${isAdmin && c.status == -2}">
                                        <a href="javascript:void(0)" onclick="checkPassHouse(${c.id})"
                                           data-toggle="tooltip" title="审核通过"><i class="ti-arrow-up"></i></a>
                                        <a href="javascript:void(0)" onclick="checkRejectHouse(${c.id})"
                                           data-toggle="tooltip" title="审核驳回"><i class="ti-arrow-down"></i></a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination 分页 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <%@ include file="../common/page.jsp" %>

                    </div>
                </div>

            </div>


        </div>
    </div>
</section>

<!-- ============================ All Property ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    let minPrice = ${houseSearchVO.minPrice};
    let maxPrice = ${houseSearchVO.maxPrice};
    let minArea = ${houseSearchVO.minArea};
    let maxArea = ${houseSearchVO.maxArea};
    // Range Slider Script
    $(".js-range-slider-price").ionRangeSlider({
        type: "double",
        min: 0,
        max: 20000,
        from: minPrice,
        to: maxPrice,
        grid: true
    });


    // Range Slider Script
    $(".js-range-slider-area").ionRangeSlider({
        type: "double",
        min: 0,
        max: 300,
        from: minArea,
        to: maxArea,
        grid: true
    });
    $('#cityArea').select2({
        placeholder: "城市区域",
        allowClear: true
    });
</script>

</body>
</html>
