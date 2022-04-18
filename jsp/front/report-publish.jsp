
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<html>

<body>

<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">
            <div class="col-lg-12 col-md-7">
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header no-collapse">
                        <h4 class="property_block_title">请填写您的报障原因</h4>
                    </div>

                    <div class="block-body">
                        <form class="form-simple" id="reportForm">
                            <div class="row">
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>姓名</label>
                                        <input type="text" name="userName" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>联系方式</label>
                                        <input type="text" name="phone" class="form-control simple">
                                    </div>
                                </div>
                            </div>
                                <input type="hidden" name="ownerId" class="form-control simple" value="${ownerId}">


                            <div class="form-group">
                                <label>报障原因</label>
                                <textarea class="form-control simple" name="content"></textarea>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-theme bg-2" type="button" onclick="reportReplySubmit()">提交</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

        </div>
        <!-- /row -->

    </div>

</section>

<%@ include file="../common/footer.jsp" %>
<script>

    function reportReplySubmit(id) {
        $.ajax({
            type: 'POST',
            url: '/report/submit',
            async: false,
            data: $("#reportForm").serialize(), // 获取该表单下的所有参数
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 如果操作成功，刷新页面
                if (data.code == 1) {
                    window.location.href = '/admin/report';
                }
            }
        });

    }
</script>
</body>
</html>
