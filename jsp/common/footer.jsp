
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ============================ Footer Start ================================== -->
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">


    <div class="footer-bottom">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-lg-12 col-md-12">
                    <p class="mb-0">© 2021 Zzy </p>
                    <p>联系方式：2842096542@qq.com</p>
                    <p>本系统还未开发完全，如有不足之处请海涵且能够反馈给我，我将不胜感激！</p>
                </div>

            </div>
        </div>
    </div>
</footer>
<!-- ============================ Footer End ================================== -->

<!-- 登录弹出框 Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="registermodal" aria-hidden="true" style="height: 500px">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="registermodal">
            <div class="modal-body">
                <div class="login-form">
                    <form id="loginForm">

                        <div class="form-group">
                            <label>账号</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号">
                                <i class="ti-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>密码</label>
                            <div class="input-with-icon">
                                <input type="password" class="form-control" name="userPass" placeholder="*******">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">登录</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>忘记密码? <a href="#" data-toggle="modal"  data-target="#forget"class="link">点此重置</a></p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 注册 Modal -->
<div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">注册</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <div class="login-form">
                    <form id="registerForm">

                        <div class="row">

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="userDisplayName" class="form-control" placeholder="姓名">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>电子邮箱</label>
                                    <div class="input-with-icon">
                                        <input type="email" name="email" class="form-control" placeholder="电子邮箱，用于重置密码">
                                        <i class="ti-email"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>手机号</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="phone" class="form-control" placeholder="手机号">
                                        <i class="ti-mobile"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>账号</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="userName" class="form-control" placeholder="登录账号">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>密码</label>
                                    <div class="input-with-icon">
                                        <input type="password" name="userPass" class="form-control" placeholder="登录密码">
                                        <i class="ti-unlock"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>角色</label>
                                    <div class="simple-input">
                                        <select name="role" class="form-control">
                                            <option value="customer">租客</option>
                                            <option value="owner">房东</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2" id="registB">创建账号</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 找回密码弹出框 Modal -->
<div class="modal fade" id="forget" tabindex="-1" role="dialog" aria-labelledby="forgetmodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">找回密码</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content">
            <div class="modal-body">
                <div class="login-form">
                    <form id="forgetForm">

                        <div class="form-group">
                            <label>账号</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号">
                                <i class="ti-user"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>邮箱地址</label>
                            <div class="input-with-icon">
                                <input type="email" class="form-control" name="email" placeholder="注册时填写的电子邮箱地址">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitForget()" class="btn btn-md full-width pop-login bg-2">重置密码</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>我们会向您的邮箱发送一封邮件，请注意查收</p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 登录弹出框 Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="registermodal" aria-hidden="true" style="height: 500px">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="registermodal">
            <div class="modal-body">
                <div class="login-form">
                    <form id="loginFrom" name="loginF">

                        <div class="form-group">
                            <label>账号</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号" value="">
                                <i class="ti-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>密码</label>
                            <div class="input-with-icon">
                                <input type="password" class="form-control" name="userPass" placeholder="*******" value="">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2" id="loginB">登录</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>忘记密码? <a href="#" data-toggle="modal"  data-target="#forget"class="link">点此重置</a></p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 快速返回顶部 -->
<a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


</div>
<script>
    // 3.登录提交
    function submitLogin() {
        $.ajax({
            type: 'POST',
            url: '/login/submit',
            async: false,
            data: $("#loginForm").serialize(), // 获取该表单下的所有参数
            success: function (data) {
                // 提示信息
                if(data.msg!="登录成功"){
                    alert(data.msg);
                }
                // 如果登录成功，刷新页面
                if (data.code == 1) {
                    window.location.reload();
                }
            }
        });
    }
</script>
<script type="text/javascript">
    //键盘事件
    document.onkeydown = function(e){

        var ev = document.all ? window.event : e;

        if(ev.keyCode==13) {
            $("#loginB").click();//直接调用login()方法
        }
    }
</script>

<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/popper.min.js"></script><%--popper.min.js 用于设置弹窗、提示、下拉菜单，--%>
<script src="/assets/js/bootstrap.min.js"></script><%--bootstrap.min.js 是bootstrap.js的压缩版，内容和bootstrap.js一样的，但是文件大小会小很多，在部署网站的时候就可以不引用bootstrap.js，而换成引用这个文件了。--%>
<script src="/assets/js/ion.rangeSlider.min.js"></script><%--jquery中滑块的插件--%>
<script src="/assets/js/select2.min.js"></script><%--下拉框新版本--%>
<script src="/assets/js/jquery.magnific-popup.min.js"></script><%--弹出框--%>
<script src="/assets/js/slick.js"></script><%--jquery的轮播幻灯片插件--%>
<script src="/assets/js/slider-bg.js"></script><%--可拖拽的滑动组件--%>
<script src="/assets/js/lightbox.js"></script><%--灯箱效果--%>
<script src="/assets/js/imagesloaded.js"></script><%--图片是否正确加载--%>
<script src="/assets/js/daterangepicker.js"></script><%--bootstrap的时间组件--%>
<script src="/assets/js/custom.js"></script><%--前端的一些js函数--%>
<script src="/assets/js/script.js"></script><%--处理一些ajax请求--%>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
