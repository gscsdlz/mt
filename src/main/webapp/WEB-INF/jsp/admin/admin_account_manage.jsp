<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                管理员管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
                    <li class="breadcrumb-item">用户管理</li>
                    <li class="breadcrumb-item active" aria-current="page">管理员管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">用户列表</h4>
                        <button id="add" class="btn btn-sm btn-primary" type="button">新增普通管理员 <span
                                class="mdi mdi-plus"></span></button>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>权限</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th>上次修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="account">
                                <tr>
                                    <td>${account.id}</td>
                                    <td><img src="${account.accountImg}" width="100%" height="70px">
                                    </td>
                                    <td>${account.username}</td>
                                    <td>********</td>
                                    <td>${account.priStr}</td>
                                    <td>${account.disabledStr}</td>
                                    <td>${account.createdAt}</td>
                                    <td>${account.updatedAt}</td>
                                    <td>
                                        <button actionDel="${account.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionModify="${account.id}" title="修改" class="btn btn-success btn-sm"
                                                type="button"><span class="mdi mdi-table-edit mdi-md"></span></button>
                                        <button actionReset="${account.id}" title="重置密码" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-autorenew mdi-md"></span></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="accountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-header">
                <h4>用户操作</h4>
            </div>
            <div class="modal-body">
                <form id="accountForm">
                    <input type="hidden" id="accountId"/>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="" id="accountName">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">权限</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="pri">
                                <option value="1">管理员</option>
                                <option value="0">超级管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">状态</label>
                        <div class="col-sm-8">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" id="d0" name="disabled" value="0"> 正常使用<i
                                        class="input-helper"></i>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" id="d1" name="disabled" value="1"> 禁用<i
                                        class="input-helper"></i>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirm">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#add").click(function () {
            document.getElementById("accountForm").reset();
            $("#accountId").val(0);
            $("#accountModal").modal();
        });

        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            send("/admin/account_api/del", {id: id});
        });

        $("[actionReset]").click(function () {
            let id = $(this).attr('actionReset');
            send("/admin/account_api/reset_password", {id: id});
        });

        $("[actionModify]").click(function () {
            document.getElementById("accountForm").reset();
            $("#accountId").val($(this).attr('actionModify'));
            let target = $(this).parent().parent().children();
            $("#accountName").val(target.eq(2).html());
            $("#pri").children().each(function () {
                if ($(this).html() === target.eq(4).html()) {
                    $("#pri").val($(this).attr('value'));
                }
            });
            if (target.eq(5).html() === "正常使用") {
                $("#d0").prop('checked', true);
            } else {
                $("#d1").prop("checked", true);
            }
            $("#accountModal").modal();
        });

        $("#confirm").click(function () {
            let id = $("#accountId").val();
            let username = $("#accountName").val();
            let pri = $("#pri").val();
            let status = 0;
            if ($("#d1").prop("checked") === "checked") {
                status = 1;
            }

            if (id > 0) {
                send("/admin/account_api/set_adminInfo", {id: id, username: username, pri: pri, disable: status})
            } else {
                send("/admin/account_api/add", {username: username, pri: pri, disable: status})
            }
        })
    });

    function send(url, param) {
        $.post(url, param, function (resp) {
            if (resp.status) {
                alert("成功");
                window.location.reload();
            } else {
                alert(resp.info);
            }
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>