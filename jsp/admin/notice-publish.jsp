
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


                <!-- ============================ Submit Property Start ================================== -->
                <section>

                    <div class="container">
                        <div class="row">

                            <!-- Submit Form -->
                            <div class="col-lg-12 col-md-12">

                                <div class="submit-page form-simple">

                                    <!-- Basic Information -->
                                    <div class="frm_submit_block">
                                        <h3>发布公告</h3>
                                        <div class="frm_submit_wrap">
                                            <form action="" id="noticeForm">
                                                <div class="form-row">

                                                    <input type="hidden" name="id" value="${notice.id}">
                                                    <div class="form-group col-md-12">
                                                        <label>标题</label>
                                                        <input type="text" name="title" value="${notice.title}"
                                                               class="form-control">
                                                    </div>


                                                    <div class="form-group col-md-12">
                                                        <label>内容</label>
                                                        <textarea class="form-control h-240" name="content"
                                                                  style="min-height: 300px;">${notice.content}</textarea>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-lg-12 col-md-12">
                                                            <button class="btn btn-theme bg-2" type="button"
                                                                    onclick="submitNotice()">发布
                                                            </button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>

                </section>
                <!-- ============================ Submit Property End ================================== -->

            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    function submitNotice() {
        $.ajax({
            type: 'POST',
            url: '/admin/notice/publish/submit',
            async: false,
            data: $("#noticeForm").serialize(), // 获取该表单下的所有参数
            success: function (data) {
                // 提示信息
                alert(data.msg);
                // 如果更新成功，刷新页面
                if (data.code == 1) {
                    window.location.href = "/news/detail/" + data.result;
                }
            }
        });
    }
</script>
</body>
</html>
