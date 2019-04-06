<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                用户中心
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/index">首页</a></li>
                    <li class="breadcrumb-item">用户中心</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">${sessionScope.get("username").toString()}</h4>
                        <p class="card-description">账户设置</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">缩略图</label>
                                    <div class="col-sm-9">
                                        <input type="file" class="form-control" id="uploadFile" name="image"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-sm-3">用户名</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="username" value="${sessionScope.get("username").toString()}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <img id="accountImg" src="${sessionScope.get("accountImg")}" class="img-thumbnail"
                                     width="100%"/>
                            </div>
                        </div>
                        <hr/>
                        <p class="text-center">
                            <button class="btn btn-gradient-success" type="button" id="submit">提交</button>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">旧密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="oldPassword"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">新密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="password"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-sm-3">确认新密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="confirmPassword"/>
                            </div>
                        </div>
                        <hr/>
                        <p class="text-center">
                            <button class="btn btn-gradient-success" type="button" id="passChange">提交</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/AjaxFileUpload.js"></script>
<script>
    $(document).ready(function () {

        $("#uploadFile").AjaxFileUpload({
            "action": "/upload_api/image",
            "onComplete": function(filename, response) {
                response = response.substr(5, response.length - 11);
                response = JSON.parse(response);
                if (!response.status) {
                    alert(response.info)
                } else {
                    $("#accountImg").attr('src', response.data);
                }
            }
        });

        $("#submit").click(function () {
            let username = $("#username").val();
            let accountImg = $("#accountImg").attr('src');
            send("/account_api/update", {username:username, accountImg:accountImg, needUpdate:"username:accountImg"})
        });

        $("#passChange").click(function () {
            let oldPassword = $("#oldPassword").val();
            let password = $("#password").val();
            let confirmPassword = $("#confirmPassword").val();
            if (password !== confirmPassword) {
                alert("两次输入的密码不匹配");
            } else {
                send("/account_api/set_password", {password:password, old_password:oldPassword});
            }
        })
    });

    function send(url, param) {
        $.post(url, param, function (resp) {
            if (resp.status) {
                alert("完成");
            } else {
                alert(resp.info);
            }
            window.location.reload();
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>