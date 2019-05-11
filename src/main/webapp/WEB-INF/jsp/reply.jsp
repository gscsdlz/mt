<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px">
    <section class="detail-wrap">
        <div class="content">
            <div class="btm-cont clear">
                <div class="btm-left">
                    <div class="recommend">
                        <h3>${post.postTitle}
                            <small style="color: lightgray;margin-left: 10px">${post.username}</small>
                        </h3>
                        <div class="cont" style="margin-top: 10px;padding-top: 5px">
                            <c:forEach items="${replyList}" var="reply">
                            <div class="row" style="border-bottom: 1px solid #e5e5e5;padding-bottom: 5px">
                                <div class="col-md-3">
                                    <div class="reply-info">
                                        <p class="reply-number">#</p>
                                        <img src="${reply.accountImg}">
                                        <p class="reply-info-username">${reply.username}</p>
                                        <p class="reply-info-more">加入于 2019-08-14</p>
                                    </div>
                                </div>
                                <div class="col-md-8" style="border-left: 1px solid #e5e5e5;">
                                    <div class="reply-content">
                                        <c:if test="${reply.replyId != 0}">
                                            <div class="replyed">
                                                    ${reply.replyUsername}@${reply.replyContent}
                                            </div>
                                        </c:if>
                                        <div class="reply">${reply.content}</div>
                                        <div class="reply-more" replyId="${reply.id}">
                                            <c:if test="${sessionScope.get(\"id\") != null}">
                                                <span><img actionReply src="/assets/images/ui/all_reply.png" style="width: 20px"/></span>
                                                <c:if test="${Integer.parseInt(sessionScope.get(\"id\").toString()) == reply.accountId}">
                                                    <span><img actionDel src="/assets/images/ui/trash.png" style="width: 20px"/></span>
                                                    <span><img actionEdit src="/assets/images/ui/edit.png" style="width: 20px"/></span>
                                                </c:if>
                                            </c:if>
                                            <span>发布于 ${reply.createdAt.substring(0, 19)}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div>
                        <ul class="pagination-custom">
                            <c:forEach begin="1" end="${total}" step="1" var="i">
                                <c:if test="${i == page}">
                                    <li><a  style="background-color: #337ab7;color: white;cursor: not-allowed" href="#"><span>${i}</span></a></li>
                                </c:if>
                                <c:if test="${i != page}">
                                    <li><a href="/post/all?page=${i}"><span>${i}</span></a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <script id="container" name="content" type="text/plain"></script>
                    <div style="margin-top: 10px">
                        <button class="modal-btn btn-primary" type="button" id="submit">发布评论</button>
                    </div>
                </div>
                <div class="btm-right">
                    <div class="guess-you-like" style="padding: 10px;text-align: center;margin-top: 10px">
                        <button class="modal-btn btn-danger" type="button" id="delPost">删除整个帖子</button>
                    </div>
                    <div class="guess-you-like" style="margin-top: 10px">
                        <h4 style="text-align: center">统计信息</h4>
                        <hr/>
                        <table style="width: 100%;text-align: center;font-size: 14px">
                            <tbody>
                            <tr>
                                <td style="width: 33.3%"><img style="width: 80%"
                                                              src="/assets/images/ui/today_total.png"></td>
                                <td style="width: 33.3%"><img style="width: 80%" src="/assets/images/ui/all_post.png">
                                </td>
                                <td style="width: 33.3%"><img style="width: 80%" src="/assets/images/ui/all_reply.png">
                                </td>
                            </tr>
                            <tr>
                                <td>今日帖子</td>
                                <td>总帖子</td>
                                <td>总回复</td>
                            </tr>
                            <tr>
                                <td id="today_total">0</td>
                                <td id="all_post">0</td>
                                <td id="all_reply">0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="/assets/js/umeditor.config.js"></script>
<script type="text/javascript" src="/assets/js/umeditor.min.js"></script>
<script>
    let idx = 1;
    let currentId = 0;
    let postId = ${post.id};
    $(document).ready(function () {

        $.get("/post_api/static", function (resp) {
            if (resp.status) {
                $("#all_post").html(resp.data.today_post);
                $("#all_reply").html(resp.data.all_reply);
                $("#today_total").html(resp.data.today_post);
            }
        });

        $(".reply-number").each(function () {
            $(this).html("#" + idx);
            idx++;
        });

        $("#container").css('width', '100%');
        $("#container").css('height', '200px');

        var um = UM.getEditor('container');
        um.ready(function () {

        });

        $("[actionDel]").click(function () {
            let id = $(this).parent().parent().attr('replyId');
            $.post("/post_api/del_reply", {id:id}, function(resp) {
                if (resp.status) {
                    alert("删除成功");
                    window.location.reload();
                } else {
                    alert(resp.info);
                }
            })
        });

        $("[actionEdit]").click(function () {
            currentId = $(this).parent().parent().attr('replyId');
            let content = $(this).parent().parent().prev().html();
            $("#submit").html("提交修改");
            um.setContent(content);
        });

        $("[actionReply]").click(function () {
            currentId = $(this).parent().parent().attr('replyId');
            let content = "";
            let floor = $(this).parent().parent().parent().parent().prev().children().eq(0).children().eq(0).html();
            $("#submit").html("回复" +floor +"楼");
            um.setContent(content);
        });

        $("#submit").click(function () {
            let content = um.getContent();
            let id;
            let url = '';
            if ($(this).html() === "提交修改") {
                id = currentId;
                url = "/post_api/update_reply";
            } else if ($(this).html() === "发布评论") {
                id = 0;
                url = "/post_api/add_reply";
            } else {
                id = currentId;
                url = "/post_api/append_reply";
            }
            $.post(url, {id:id, content:content, postId:postId}, function (resp) {
                if (resp.status) {
                    alert("成功");
                    window.location.reload();
                } else {
                    alert(resp.info);
                }
            })
        });

        $("#delPost").click(function () {
            $.post("/post_api/del_post", {postId: postId}, function (resp) {
                if (resp.status) {
                    alert("删除成功");
                    window.location.href = '/post/index';
                } else {
                    alert(resp.info);
                }
            })
        })
    })
</script>
<%@ include file="./common/footer.jsp" %>