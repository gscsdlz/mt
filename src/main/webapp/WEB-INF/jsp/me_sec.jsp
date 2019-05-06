<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div>
    <div class="page index" style="">
        <div class="setting-container">
            <div class="clearfix">
                <div style="float:left">
                    <%@ include file="./common/me_left_menu.jsp"%>
                </div>
                <div class="setting-content" id="passInfo">
                    <div class="head">
                        <p class="title">个人信息</p>
                        <p class="des">安全中心</p>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>密码</span></div>
                        <div class="field-value">
                            <span class="value">**********</span>
                            <div class="input-form-block" hidden>
                                <input type="password" id="password" value="" class="input-form"/>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>注册时间</span></div>
                        <div class="field-value"><span class="value">${account.createdAt}</span></div>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>上次修改</span></div>
                        <div class="field-value"><span class="value">${account.updatedAt}</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("[actionChange]").click(function () {
            if ($(this).html() === "修改") {
                $(this).prev().show();
                $(this).prev().prev().children().eq(0).hide();
                $(this).prev().prev().children().eq(1).show();
                $(this).html("确认");
            } else {
                let password = $("#password").val();
                if (password.length === 0) {
                    alert("密码不能为空");
                } else {
                    $.post("/account_api/change_password", {password: password}, function (resp) {
                        if (resp.status) {
                            alert("修改完成");
                            window.location.reload();
                        } else {
                            alert(resp.info);
                        }
                    })
                }
            }
        });

        $("[actionCancel]").click(function () {
            $(this).next().html("修改");
            $(this).hide();
            $(this).prev().children().eq(0).show();
            $(this).prev().children().eq(1).hide();
        })
    })
</script>
<%@ include file="./common/footer.jsp" %>