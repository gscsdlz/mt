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
                <div class="setting-content" id="basicInfo">
                    <div class="head">
                        <p class="title">个人信息</p>
                        <p class="des">信息修改</p>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>头像</span></div>
                        <div class="field-value">
                            <img src="${account.accountImg}" alt="" class="head-img">
                            <div class="input-form-block" hidden>
                                <input type="file" class="form-control" id="uploadFile" name="image"/>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden id="imgCancel">取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>昵称</span></div>
                        <div class="field-value">
                            <span class="value">${account.username}</span>
                            <div class="input-form-block" hidden>
                                <input type="text" id="username" value="" class="input-form"/>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>生日</span></div>
                        <div class="field-value">
                            <span class="value">${account.birth}</span>
                            <div class="input-form-block" hidden>
                                <input type="text" id="birth" value="" class="input-form"/>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>性别</span></div>
                        <div class="field-value">
                            <span class="value">${account.sexStr}</span>
                            <div class="input-form-block" hidden>
                                <select class="input-form" id="sex">
                                    <option value="0">未知</option>
                                    <option value="1">女</option>
                                    <option value="2">男</option>
                                </select>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>星座</span></div>
                        <div class="field-value"><span class="value">${account.constellationStr}</span>
                            <div class="input-form-block" hidden>
                                <select class="input-form" id="constellation">
                                    <option value="0">未知</option>
                                    <option value="1">白羊座</option>
                                    <option value="2">金牛座</option>
                                    <option value="3">双子座</option>
                                    <option value="4">巨蟹座</option>
                                    <option value="5">狮子座</option>
                                    <option value="6">处女座</option>
                                    <option value="7">天秤座</option>
                                    <option value="8">天蝎座</option>
                                    <option value="9">射手座</option>
                                    <option value="10">摩羯座</option>
                                    <option value="11">水瓶座</option>
                                    <option value="12">双鱼座</option>
                                </select>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>爱好</span></div>
                        <div class="field-value"><span class="value">${account.hobby}</span>
                            <div class="input-form-block" hidden>
                                <input type="text" id="hobby" value="" class="input-form"/>
                            </div>
                        </div>
                        <button class="btn-change" actionCancel hidden>取消</button>
                        <button class="btn-change" actionChange>修改</button>
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
            "onComplete": function (filename, response) {
                response = response.substr(5, response.length - 11);
                response = JSON.parse(response);
                if (!response.status) {
                    alert(response.info)
                } else {
                    $("#uploadFile").parent().prev().attr('src', response.data);
                    $("#uploadFile").parent().hide();
                    $("#uploadFile").parent().prev().show();

                    $("#imgCancel").next().html("修改")
                        .hide()
                        .prev().children().eq(0).show()
                        .prev().children().eq(1).hide();
                    $("[actionChange]").show();

                    $.post("/account_api/update", {
                        needUpdate: "accountImg",
                        accountImg: response.data,
                    }, function (resp) {
                        if (resp.status) {
                            alert("修改完成");
                        } else {
                            alert(resp.info);
                        }
                        window.location.reload();
                    })
                }
            }
        });


        $("[actionChange]").click(function () {
            if ($(this).html() === "修改") {
                $(this).prev().show();
                $(this).prev().prev().children().eq(0).hide();
                $(this).prev().prev().children().eq(1).show();
                $(this).html("确认");

                $("[actionChange]").hide();
                if ($(this).prev().attr("id") !== "imgCancel") {
                    $(this).show();
                }
            } else {
                let val = $(this).prev().prev().children().eq(1).children().eq(0).val();
                let field = $(this).prev().prev().children().eq(1).children().eq(0).attr('id');
                if (field === "uploadFile") {
                    return;
                }
                if (val.length === 0) {
                    alert("字段不能为空");
                } else {
                    $.post("/account_api/update", {
                        needUpdate: field,
                        username: val,
                        birth: val,
                        sex: val,
                        constellation: val,
                        hobby: val,
                    }, function (resp) {
                        if (resp.status) {
                            alert("修改完成");
                        } else {
                            alert(resp.info);
                        }
                        window.location.reload();
                    })
                }
            }
        });

        $("[actionCancel]").click(function () {
            $(this).next().html("修改");
            $(this).hide();
            $(this).prev().children().eq(0).show();
            $(this).prev().children().eq(1).hide();
            $("[actionChange]").show();
        })
    })
</script>
<%@ include file="./common/footer.jsp" %>