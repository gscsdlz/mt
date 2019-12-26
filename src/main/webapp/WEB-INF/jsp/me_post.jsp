<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div>
    <div class="page index" style="margin-top: -70px">
        <div class="orders-container">
            <div class="clearfix">
                <div style="float:left">
                    <%@ include file="./common/me_left_menu.jsp" %>
                </div>
                <div class="orders-box">
                    <div class="orders">
                        <div class="orders-head">
                            <ul class="orders-ul clearfix">
                                <li class="active" tab-target="post">我发布的</li>
                                <li class="" tab-target="reply">我回复的</li>
                                <li class="" tab-target="replyMe">回复我的</li>
                            </ul>
                        </div>
                        <div class="orders-body" id="post">
                            <div>
                                <c:forEach items="${my_post}" var="post">
                                    <div class="order-item clearfix">
                                        <div class="order-info">

                                            <div class="info-box">
                                                <a href="/post/show?id=${post.id}" class="link">
                                                    <p class="order-title">${post.postTitle}</p></a>
                                                <p class="info">发布时间: ${post.createdAt.substring(0, 10)}</p>
                                            </div>

                                        </div>
                                        <div class="order-price">回复数: ${post.replyNum}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="orders-body" id="reply" hidden>
                            <div>
                                <c:forEach items="${me_reply}" var="reply">
                                    <div class="order-item clearfix">
                                        <div class="order-info">
                                            <div class="info-box">
                                                <a href="/post/show?id=${reply.postId}" class="link">
                                                    <p class="order-title">${postMap[reply.postId]}</p></a>
                                                <p class="info">回复时间: ${reply.createdAt.substring(0, 10)}</p></div>
                                        </div>
                                        <div class="order-price">我的回复${reply.contentText}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="orders-body" id="replyMe" hidden>
                            <div>
                                <c:forEach items="${reply_me}" var="reply">
                                    <div class="order-item clearfix">
                                        <div class="order-info">
                                            <div class="info-box">
                                                <a href="/post/show?id=${reply.postId}" class="link">
                                                    <p class="order-title">${postMap[reply.postId]}</p></a>
                                                <p class="info">回复时间: ${reply.createdAt.substring(0, 10)}</p></div>
                                        </div>
                                        <div class="order-price">他的回复${reply.contentText}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="btn-box">
                            <a class="left-arrow iconfont icon-btn_left"></a>
                            <a class="right-arrow iconfont icon-btn_right"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

        handleURL();

        $("#postMenu").children().each(function () {
            let href = $(this).children().eq(0).attr('href');
            $(this).children().eq(0).attr('tab-key', href.substr(href.indexOf("#")));
            $(this).children().eq(0).attr('href', 'javascript:;');
        }).children().click(function () {
            let id = $(this).attr('tab-key');
            window.location.href = window.location.href.substr(0, location.href.indexOf("#")) + id;
            handleURL()
        });

        $("[tab-target]").click(function () {
            $(this).parent().children().removeClass('active');
            $(this).addClass('active');

            let id = $(this).attr('tab-target');
            $('.orders-body').hide();
            $('#' + id).show();
            window.location.href = window.location.href.substr(0, location.href.indexOf("#")) + "#" + id;
        });
    });

    function handleURL() {
        let tag = window.location.href.substr(window.location.href.indexOf("#") + 1);
        if (window.location.href.indexOf("#") === -1) {
            tag = "post";
        }
        $("[tab-target]").parent().children().removeClass('active');
        let key = "[tab-target='" + tag + "']";
        $(key).addClass('active');
        let id = $(key).attr('tab-target');
        $('.orders-body').hide();
        $('#' + id).show();
    }
</script>
<%@ include file="./common/footer.jsp" %>