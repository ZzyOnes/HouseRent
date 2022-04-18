
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<html>
<body>
<!-- ============================ Hero Banner Start================================== -->
<div class="image-cover hero_banner" style="background:#334aca url(/assets/img/backboder.jpg) no-repeat;"
     data-overlay="1">
    <div class="container">

        <h1 class="big-header-capt mb-0">欢迎来的Jishou房屋租赁系统！</h1>
        <p class="text-center mb-5">搜索你需要的地区或房屋类型吧！</p>
        <!-- Type -->
        <div class="full_search_box nexio_search lightanic_search hero_search-radius modern">
            <div class="search_hero_wrapping">
                <form action="/house" method="post">

                    <div class="row">

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>详细地址</label>
                                <div class="input-with-icon">
                                    <input type="text" name="address" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>城市区域名称</label>
                                <div class="input-with-icon">
                                    <select id="cityArea" name="cityArea" class="form-control">
                                        <option value="吉首城区">吉首城区</option>

                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>租房类型</label>
                                <div class="input-with-icon">
                                    <select id="selectRentType" name="rentType" class="form-control">
                                        <option value="">不限</option>
                                        <option value="whole">整租</option>
                                        <option value="share">合租</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>月租金范围</label>
                                <div class="input-with-icon">
                                    <select id="price" class="form-control" name="priceRange">
                                        <option value="">不限</option>
                                        <option value="0;999">1000以内</option>
                                        <option value="1000;1999">1000-1999</option>
                                        <option value="2000;3999">2000-3999</option>
                                        <option value="4000;5999">4000-5999</option>
                                        <option value="6000;7999">6000-7999</option>
                                        <option value="8000;9999">8000-9999</option>
                                        <option value="10000;14999">10000-14999</option>
                                        <option value="15000;19999">15000-19999</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 small-padd">
                            <div class="form-group none">
                                <button type="submit" class="btn search-btn" style="background-color: #0f7dff" >搜索</button>
                            </div>
                        </div>

                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
<!-- ============================ Hero Banner End ================================== -->

<!-- ============================ 最新发布整租 Start ================================== -->
<section class="gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>最新整租</h2>
                    <p>给你推荐了一些最新的发布的整租房子</p>
                </div>
            </div>
        </div>

        <div class="row">
            <%--  最新整租--%>
            <c:forEach items="${recentWholeHouseList}" var="c">

                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/house/detail/${c.id}">
                                    <img src="${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/house/detail/${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/house/detail/${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/house/detail/${c.id}" class="cl-blue">
                                        ¥ ${c.monthRent}<span class="price_status">/月</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="modern_property_footer">
                            <div class="property-lists flex-1">
                                <ul>
                                    <li><span class="flatcons"><img src="/assets/img/color-bed.svg"
                                                                    alt=""></span>${c.bedroomNum} 卧室
                                    </li>
                                    <li><span class="flatcons"><img src="/assets/img/color-bathroom.svg"
                                                                    alt=""></span>${c.toiletNum} 卫生间
                                    </li>
                                    <li><span class="flatcons"><img src="/assets/img/phone.jpg"
                                                                    alt=""></span>${c.contactPhone}
                                    </li>
                                </ul>
                            </div>
                            <c:if test="${sessionScope.user.role == 'customer'}" >
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                     onclick="submitMark(${c.id})">收藏</a></div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=whole" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>
<!-- ============================ 最新发布整租 End ================================== -->


<!-- ============================ 最新发布合租 Start ================================== -->
<section class="gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>最新合租</h2>
                    <p>给你推荐了一些最新的发布的合租房子</p>
                </div>
            </div>
        </div>

        <div class="row">
            <%--  最新整租--%>
            <c:forEach items="${recentShareHouseList}" var="c">
                <!-- Single Property -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/house/detail/${c.id}">
                                    <img src="${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/house/detail/${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/house/detail/${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/house/detail/${c.id}" class="cl-blue">
                                        ¥ ${c.monthRent}<span class="price_status">/月</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="modern_property_footer">
                            <div class="property-lists flex-1">
                                <ul>
                                    <li><span class="flatcons">
                                        <img src="/assets/img/color-bed.svg" alt=""></span>${c.bedroomNum} 卧室
                                    </li>
                                    <li><span class="flatcons">
                                        <img src="/assets/img/color-bathroom.svg"
                                             alt=""></span>${c.toiletNum} 卫生间
                                    </li>
                                    <li><span class="flatcons"><img src="/assets/img/phone.jpg"
                                                                    alt=""></span>${c.contactPhone}
                                    </li>
                                </ul>
                            </div>
                            <c:if test="${sessionScope.user.role == 'customer'}" >
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                     onclick="submitMark(${c.id})">收藏</a></div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=share" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>
<!-- ============================ 最新发布合租 End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script th:inline="javascript">/*内联访问modle中的数据*/
    let openLogin = "${openLogin}";
    if (openLogin == 'Y') {
        $('#gotoLogin').click();
    }
</script>
<script>
    $('#cityArea').select2({
        placeholder: "城市区域",
        allowClear: true
    });
</script>
</body>
</html>
