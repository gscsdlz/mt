<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                发帖管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/index">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">发帖管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">帖子列表</h4>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th style="width: 10%">编号</th>
                                <th style="width: 40%">标题</th>
                                <th style="width: 10%">发布人</th>
                                <th style="width: 15%">发布时间</th>
                                <th style="width: 15%">上次修改时间</th>
                                <th style="width: 10%">操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="post">
                                <tr>
                                    <td>${post.id}</td>
                                    <td><a href="/admin/post/reply?post_id=${post.id}">${post.postTitle}</a></td>
                                    <td>${post.username}</td>
                                    <td>${post.createdAt}</td>
                                    <td>${post.updatedAt}</td>
                                    <td>
                                        <button actionDel="${post.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
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
            send("/admin/post_api/del_post", {post_id: id});
        });
    });

    function send(url, param) {
        $.post(url, param, function (resp) {
            if (resp.status) {
                alert("完成");
                window.location.reload();
            } else {
                alert(resp.info)
            }
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>