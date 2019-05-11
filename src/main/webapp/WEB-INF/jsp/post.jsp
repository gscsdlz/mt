<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px">
    <section class="detail-wrap">
        <div class="content">
            <div class="btm-cont clear">
                <div class="btm-left">
                    <div class="recommend">
                        <h3>热门话题</h3>
                        <div class="cont">
                            <table style="width: 100%">
                                <tbody id="hotDate">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="recommend">
                        <h3>最多讨论</h3>
                        <div class="cont">
                            <table style="width: 100%">
                                <tbody id="hotReply">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="btm-right">
                    <div class="guess-you-like" style="padding: 10px;text-align: center">
                        <button class="modal-btn btn-primary" type="button">我要发帖</button>
                    </div>
                    <div class="guess-you-like"  style="margin-top: 10px">
                        <h4>今日榜单</h4>
                        <table style="width: 100%">
                            <tbody>
                            <c:forEach items="${todayP}" var="post">
                                <tr>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title" postId="${post.id}"><span>${post.postTitle}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="guess-you-like" style="margin-top: 10px">
                        <h4 style="text-align: center">统计信息</h4>
                        <hr/>
                        <table style="width: 100%">
                            <tbody>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    $(document).ready(function () {
        $.get("/post_api/get_hot_date", function (resp) {
            if (resp.status) {
                renderData(resp.data, $("#hotDate"));
            }
        });

        $.get("/post_api/get_hot_reply", function (resp) {
            if (resp.status) {
                renderData(resp.data, $("#hotReply"));
            }
        });

        $("[postId]").click(function () {
            let id = $(this).attr('postId');
            window.location.href = "/post/show?id=" + id;
        })
    });

    function renderData(data, target) {
        let str = '';
        let count = 0;
        for (let i = 0; i < data.length; i++) {
            if (count === 0) {
                str += '<tr>';
            }
            str += '<td class="post-td-img">' +
                    '<img src="/assets/images/ui/point.png"</td>' +
                    '<td class="post-td-title" postId="'+data[i].id+'"><span>'+data[i].postTitle+'</span>' +
                '</td>';
            count++;
            if (count === 2) {
                str += '</tr><tr>';
            }
            if (count === 4) {
                str += '<tr>';
                count = 0;
            }
        }
        if (count === 1) {
            str += '';
        } else if (count === 2) {
            str += '';
        }
        target.html(str);
    }
</script>
<%@ include file="./common/footer.jsp" %>