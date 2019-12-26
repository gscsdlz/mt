<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/default/logo.png"/>
    <script src="${pageContext.request.contextPath}/assets/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vendor.bundle.addons.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
</head>
<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
            <div class="row w-100">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left p-5">
                        <div class="brand-logo">
                            <img src="/assets/images/default/logo.png">
                        </div>
                        <h4>你好，请登录</h4>
                        <form class="pt-3">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="username" placeholder="请输入用户名">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg" id="password" placeholder="请输入密码">
                            </div>
                            <div class="mt-3">
                                <button type="button" id="login" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">登录</button>
                            </div>
                            <div class="text-center mt-4 font-weight-light">
                                还没有任何账号？
                                <a href="${pageContext.request.contextPath}/register" class="text-primary">创建</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#login").click(function () {
            let username = $("#username").val();
            let password = $("#password").val();
            let redirect = "";
            let queryList = window.location.search.substr(1).split("&");
            for (let k in queryList) {
                if (queryList.hasOwnProperty(k)) {
                    if (queryList[k].startsWith("redirect=")) {
                        redirect = queryList[k].substr(9);
                    }
                }
            }
            $.post("/account_api/login", {username: username, password: password}, function (resp) {
                if (resp.status) {
                    if (redirect !== "") {
                        window.location.href = redirect;
                    } else {
                        window.location.href = resp.data;
                    }
                } else {
                    alert(resp.info);
                }
            })
        })
    })
</script>
</body>
</html>
