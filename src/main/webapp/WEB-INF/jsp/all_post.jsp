<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px">
    <section class="detail-wrap">
        <div class="content">
            <div class="btm-cont clear">
                <div class="btm-left">
                    <div class="recommend">
                        <h3>全部帖子 第${page}页</h3>
                        <div class="cont">
                            <table style="width: 100%">
                                <tbody>
                                <c:forEach items="${data}" var="post">
                                    <tr>
                                        <td class="post-td-img"><img src="${post.accountImg}"></td>
                                        <td class="post-td-title">
                                            <span onclick="window.location.href='/post/show?post_id=${post.id}'">${post.postTitle}</span>
                                        </td>
                                        <td style="text-align: right;width: 20%">${post.username} @</td>
                                        <td style="text-align: left;width: 20%">${post.createdAt.substring(0, 19)}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                        <ul class="pagination-custom">
                            <c:forEach begin="1" end="${total}" step="1" var="i">
                                <c:if test="${i == page}">
                                    <li>
                                        <a style="background-color: #337ab7;color: white;cursor: not-allowed" href="#"><span>${i}</span></a>
                                    </li>
                                </c:if>
                                <c:if test="${i != page}">
                                    <li><a href="/post/all?page=${i}"><span>${i}</span></a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="btm-right">
                    <div class="guess-you-like" style="padding: 10px;text-align: center">
                        <button class="modal-btn btn-primary" type="button" onclick="window.location.href='/post/index'">热门帖子</button>
                    </div>
                    <div class="guess-you-like" style="padding: 10px;text-align: center;margin-top: 10px">
                        <c:if test="${sessionScope.get('id') == null}">
                            <button class="modal-btn btn-primary" type="button" onclick="window.location.href='/login'">我要发帖</button>
                        </c:if>
                        <c:if test="${sessionScope.get('id') != null}">
                            <button class="modal-btn btn-primary" type="button" onclick="$('#postModal').fadeIn()">我要发帖</button>
                        </c:if>
                    </div>
                    <div class="guess-you-like" style="margin-top: 10px">
                        <h4 style="text-align: center">统计信息</h4>
                        <hr/>
                        <table style="width: 100%;text-align: center;font-size: 14px">
                            <tbody>
                            <tr>
                                <td style="width: 33.3%">
                                    <img style="width: 80%" src="/assets/images/ui/today_total.png"></td>
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
                    <div class="guess-you-like" style="margin-top: 10px">
                        <h4>今日榜单</h4>
                        <table style="width: 100%">
                            <tbody>
                            <c:forEach items="${todayP}" var="post">
                                <tr>
                                    <td class="post-td-img"><img src="${post.accountImg}"></td>
                                    <td class="post-td-title" style="padding-top: 12px;height:40px; line-height: 20px;overflow-x: hidden;white-space:nowrap;text-overflow:ellipsis;display: block">
                                        <span onclick="window.location.href='/post/show?post_id=${post.id}'">${post.postTitle}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<div class="modal" id="postModal" hidden>
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-body">
                <h3 style="padding-bottom:10px; margin-bottom: 10px;border-bottom: 1px solid #e5e5e5">发帖</h3>
                <div class="input-form-block">
                    <input type="text" class="input-form" id="title"/>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn btn-primary" type="button" id="addPost">确认</button>
                <button class="modal-btn btn-danger" type="button" onclick="$('#postModal').fadeOut()">取消</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#addPost").click(function () {
            let title = $("#title").val();
            $.post("/post_api/add_post", {title: title}, function (resp) {
                if (resp.status) {
                    alert("添加成功");
                    window.location.reload();
                } else {
                    alert(resp.info);
                }
            })
        });

        $.get("/post_api/static", function (resp) {
            if (resp.status) {
                $("#all_post").html(resp.data.today_post);
                $("#all_reply").html(resp.data.all_reply);
                $("#today_total").html(resp.data.today_post);
            }
        })
    })
</script>
<%@ include file="./common/footer.jsp" %>