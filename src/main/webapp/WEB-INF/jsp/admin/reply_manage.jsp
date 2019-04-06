<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                回复管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a
                            href="${pageContext.request.contextPath}/admin/post/index">发帖管理</a></li>
                    <li class="breadcrumb-item active" aria-current="page">回复管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2 class="card-title">
                                    ${post.postTitle}
                                </h2>
                                <p class="card-description">
                                    ${post.username}@${post.createdAt}
                                </p>
                            </div>
                            <div class="col-sm-6 text-right">
                                <button class="btn btn-gradient-danger" actionDelAll="${post.id}" type="button">删除整个帖子</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:forEach items="${data}" var="reply">
            <div class="row" style="margin: -20px 0">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                #${reply.idx} ${reply.username}
                                <small class="text-muted">${reply.createdAt}</small>
                                <button actionDel="${reply.id}" class="btn btn-sm btn-gradient-danger" type="button" style="float: right;">
                                    <span class="mdi mdi-delete mdi-md"></span></button>
                            </h4>
                            <hr/>
                            <c:if test="${reply.replyTime != null}">
                                <blockquote class="blockquote blockquote-light" style="font-size: 12px">
                                        ${reply.replyUsername}在${reply.replyTime}写下：${reply.replyContent}
                                </blockquote>
                            </c:if>
                            <p>${reply.content}</p>
                        </div>
                    </div>

                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            send("/admin/post_api/del_reply", {id:id})
        });
        
        $("[actionDelAll]").click(function () {
            let id = $(this).attr('actionDelAll');
            send("/admin/post_api/del_post", {post_id:id})
        })
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