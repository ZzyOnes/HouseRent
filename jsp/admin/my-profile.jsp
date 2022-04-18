
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">
<html>
<body>
<!-- ============================ User Dashboard ================================== -->
<section class="gray p-0">
    <div class="container-fluid p-0">

        <div class="row">

            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">

                    <div class="dashboard-wraper">

                        <!-- Basic Information -->
                        <div class="frm_submit_block">
                            <h4>个人信息</h4>
                            <div class="frm_submit_wrap">
                                <div>
                                    <div style="position: relative;border: 5px solid lightblue;width: 150px;height:150px;margin: 5px auto;border-radius: 50%;">
                                        <img src="${user.userAvatar}" alt="选择并上传头像" id="avatar_img"
                                             style="width: 140px;height: 140px;left:0;top: 0;border-radius: 50%;"/>
                                        <input type="file" id="avatar_file" name="avatar_file"
                                               accept="image/jpg,image/png,image/gif"
                                               style="width: 100%;height:100%;opacity: 0;position: absolute;left:0;top: 0;"/>
                                    </div>
                                    <br/>
                                </div>
                                <form action="" id="profileForm">
                                    <input type="hidden" id="key" name="key">
                                    <div class="form-row">


                                        <div class="form-group col-md-6">
                                            <label>账号</label>
                                            <input type="text" class="form-control" name="userName" value="${user.userName}" disabled>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>姓名</label>
                                            <input type="text" class="form-control" name="userDisplayName" value="${user.userDisplayName}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>电子邮箱</label>
                                            <input type="email" class="form-control" name="email" value="${user.email}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>手机号</label>
                                            <input type="text" class="form-control" name="phone" value="${user.phone}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>身份证号码</label>
                                            <input type="text" class="form-control" name="idCard" value="${user.idCard}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>性别</label>
                                            <select name="sex" class="form-control">
                                                <option value="外星人" <c:if test="${user.sex == '外星人'}">selected</c:if>>
                                                    外星人
                                                </option>
                                                <option value="男" <c:if test="${user.sex == '男'}">selected</c:if>>
                                                    男
                                                </option>
                                                <option value="女" <c:if test="${user.sex == '女'}">selected</c:if>>
                                                    女
                                                </option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>职业</label>
                                            <select name="job" class="form-control">
                                                <option value="其他" <c:if test="${user.job == '其他'}">selected</c:if>>其他</option>
                                                <option value="互联网/计算机" <c:if test="${user.job == '互联网/计算机'}">selected</c:if>>互联网/计算机</option>
                                                <option value="生产/制造" <c:if test="${user.job == '生产/制造'}">selected</c:if>>生产/制造</option>
                                                <option value="教育/培训" <c:if test="${user.job == '教育/培训'}">selected</c:if>>教育/培训</option>
                                                <option value="教育/培训" <c:if test="${user.job == '教育/培训'}">selected</c:if>>教育/培训</option>
                                                <option value="金融/银行" <c:if test="${user.job == '金融/银行'}">selected</c:if>>金融/银行</option>
                                                <option value="保险/投资" <c:if test="${user.job == '保险/投资'}">selected</c:if>>保险/投资</option>
                                                <option value="文化/传媒" <c:if test="${user.job == '文化/传媒'}">selected</c:if>>文化/传媒</option>
                                                <option value="公务员" <c:if test="${user.job == '公务员'}">selected</c:if>>公务员</option>
                                                <option value="服务行业" <c:if test="${user.job == '服务行业'}">selected</c:if>>服务行业</option>
                                                <option value="学生" <c:if test="${user.job == '学生'}">selected</c:if>>学生</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>爱好</label>
                                            <input type="text" class="form-control" name="hobby" value="${user.hobby}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>个人说明</label>
                                            <textarea class="form-control" name="userDesc">${user.userDesc}</textarea>
                                        </div>

                                        <div class="form-group col-md-12">
                                            <div class="frm_submit_block">
                                                <label>头像上传</label>
                                                <div class="frm_submit_wrap">
                                                    <div class="form-row">
                                                        <input type="file" name="file" id="file" class="file-loading" />
                                                    </div>
                                                </div>
                                            </div>

                                        <div class="form-group col-lg-12 col-md-12">
                                            <button class="btn btn-theme bg-2" type="button" onclick="submitProfile()">
                                                保存
                                            </button>
                                        </div>


                                    </div>
                                </form>
                            </div>
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
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
    $(function () {
        var timestamp = Date.parse(new Date());
        $('#key').val(timestamp);
        var control = $("#file");
        var uploadUrl = "/file/upload?key=" + timestamp;
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['png', 'jpeg', 'jpg', 'gif'],//接收的文件后缀
            showUpload: true, //显示批量上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-theme bg-2", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            minFileCount: 0,
            maxFileCount: 100,
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });
        //导入文件上传完成之后的事件
        $("#file").on("fileuploaded", function (event, data, previewId, index) {
            // alert('上传成功');
        });
    });
</script>
<script>
    // 头像预览
    $("#avatar_file").change(function () {
        // 获取上传文件对象
        var file = $(this)[0].files[0];
        // 读取文件URL
        var reader = new FileReader();
        reader.readAsDataURL(file);
        // 阅读文件完成后触发的事件
        reader.onload = function () {
            // 读取的URL结果：this.result
            $("#avatar_img").attr("src", this.result);
        }
    });
</script>
</body>
</html>
