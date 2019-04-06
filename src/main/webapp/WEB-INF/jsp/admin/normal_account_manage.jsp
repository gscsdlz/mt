<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                普通用户管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
                    <li class="breadcrumb-item">用户管理</li>
                    <li class="breadcrumb-item active" aria-current="page">普通用户管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">用户列表</h4>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>头像</th>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>状态</th>
                                <th>最近登录城市</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>星座</th>
                                <th>爱好</th>
                                <th>注册时间</th>
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
                                    <td>${account.disabledStr}</td>
                                    <td>${account.city}</td>
                                    <td>${account.sexStr}</td>
                                    <td>${account.birth}</td>
                                    <td>${account.constellationStr}</td>
                                    <td>${account.hobby}</td>
                                    <td>${account.createdAt}</td>
                                    <td>${account.updatedAt}</td>
                                    <td>
                                        <button actionDel="${account.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <c:if test="${account.disabled == 0}">
                                            <button actionLock="${account.id}" title="禁用" class="btn btn-danger btn-sm"
                                                    type="button"><span class="mdi mdi-lock mdi-md"></span></button>
                                        </c:if>
                                        <c:if test="${account.disabled == 1}">
                                            <button actionUnlock="${account.id}" title="解除禁用" class="btn btn-danger btn-sm"
                                                    type="button"><span class="mdi mdi-lock-open mdi-md"></span></button>
                                        </c:if>

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
<script>
    $(document).ready(function () {
        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            send("/admin/account_api/del", {id: id});
        });

        $("[actionReset]").click(function () {
            let id = $(this).attr('actionReset');
            send("/admin/account_api/reset_password", {id: id});
        });

        $("[actionLock]").click(function () {
            let id = $(this).attr('actionLock');
            send("/admin/account_api/lock", {id:id, disabled:1});
        });

        $("[actionUnlock]").click(function () {
            let id = $(this).attr('actionUnlock');
            send("/admin/account_api/lock", {id:id, disabled:0});
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