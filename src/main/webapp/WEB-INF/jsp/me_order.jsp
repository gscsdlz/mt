<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div>
    <div class="page index" style="margin-top: -70px">
        <div class="orders-container">
            <div class="clearfix">
                <div style="float:left">
                    <%@ include file="./common/me_left_menu.jsp"%>
                </div>
                <div class="orders-box">
                    <div class="orders">
                        <div class="orders-head">
                            <ul class="orders-ul clearfix">
                                <li class="active" tab-target="statusAll">全部订单</li>
                                <li class="" tab-target="statusPay">待付款</li>
                                <li class="" tab-target="statusConfirm">待签收</li>
                                <li class="" tab-target="statusMark">待评价</li>
                                <li class="" tab-target="statusDone">已完成</li>
                            </ul>
                        </div>
                        <div class="orders-body" id="statusAll">
                            <c:forEach items="${data}" var="order">
                            <div>
                                <div class="order-item clearfix">
                                    <div class="order-img">
                                        <a href="/store/detail?store_id=${order.storeId}" class="link">
                                            <div><img src="${order.storeImg}" class="image"></div>
                                        </a></div>
                                    <div class="order-info">
                                        <div class="info-box">
                                            <a href="#" class="link" target="_blank">
                                                <p class="order-title">${order.storeName}</p></a>
                                            <p class="info">时间: ${order.createdAt}</p></div>
                                    </div>
                                    <div class="order-price">总价: ￥${order.totalPrice}</div>
                                    <div class="order-status">${order.status}</div>
                                    <div class="order-btn"></div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <div class="orders-body" id="statusPay" hidden>
                            <c:forEach items="${data}" var="order">
                                <c:if test="${order.status.equals(\"用户创建订单\")}">
                                    <div>
                                        <div class="order-item clearfix">
                                            <div class="order-img">
                                                <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                    <div><img src="${order.storeImg}" class="image"></div>
                                                </a></div>
                                            <div class="order-info">
                                                <div class="info-box">
                                                    <a href="#" class="link" target="_blank">
                                                        <p class="order-title">${order.storeName}</p></a>
                                                    <p class="info">时间: ${order.createdAt}</p></div>
                                            </div>
                                            <div class="order-price">总价: ￥${order.totalPrice}</div>
                                            <div class="order-status">${order.status}</div>
                                            <div class="order-btn"></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="orders-body" id="statusConfirm" hidden>
                            <c:forEach items="${data}" var="order">
                                <c:if test="${order.status.equals(\"订单已送出\")}">
                                <div>
                                    <div class="order-item clearfix">
                                        <div class="order-img">
                                            <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                <div><img src="${order.storeImg}" class="image"></div>
                                            </a></div>
                                        <div class="order-info">
                                            <div class="info-box">
                                                <a href="#" class="link" target="_blank">
                                                    <p class="order-title">${order.storeName}</p></a>
                                                <p class="info">时间: ${order.createdAt}</p></div>
                                        </div>
                                        <div class="order-price">总价: ￥${order.totalPrice}</div>
                                        <div class="order-status">${order.status}</div>
                                        <div class="order-btn"></div>
                                    </div>
                                </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="orders-body" id="statusMark" hidden>
                            <c:forEach items="${data}" var="order">
                                <c:if test="${order.status.equals(\"订单已签收\")}">
                                    <div>
                                        <div class="order-item clearfix">
                                            <div class="order-img">
                                                <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                    <div><img src="${order.storeImg}" class="image"></div>
                                                </a></div>
                                            <div class="order-info">
                                                <div class="info-box">
                                                    <a href="#" class="link" target="_blank">
                                                        <p class="order-title">${order.storeName}</p></a>
                                                    <p class="info">时间: ${order.createdAt}</p></div>
                                            </div>
                                            <div class="order-price">总价: ￥${order.totalPrice}</div>
                                            <div class="order-status">${order.status}</div>
                                            <div class="order-btn"></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="orders-body" id="statusDone" hidden>
                            <c:forEach items="${data}" var="order">
                                <c:if test="${order.status.equals(\"订单已完成\")}">
                                    <div>
                                        <div class="order-item clearfix">
                                            <div class="order-img">
                                                <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                    <div><img src="${order.storeImg}" class="image"></div>
                                                </a></div>
                                            <div class="order-info">
                                                <div class="info-box">
                                                    <a href="#" class="link" target="_blank">
                                                        <p class="order-title">${order.storeName}</p></a>
                                                    <p class="info">时间: ${order.createdAt}</p></div>
                                            </div>
                                            <div class="order-price">总价: ￥${order.totalPrice}</div>
                                            <div class="order-status">${order.status}</div>
                                            <div class="order-btn"></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
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

        $("#orderMenu").children().each(function () {
            let href = $(this).children().eq(0).attr('href');
            $(this).children().eq(0).attr('tab-key', href.substr(href.indexOf("#")));
            $(this).children().eq(0).attr('href', 'javascript:;');
        }).children().click(function () {
            let id = $(this).attr('tab-key');
            window.location.href = window.location.href.substr(0, location.href.indexOf("#")) + id;
            handleURL()
        });

        $("[tab-target]").click(function() {
            $(this).parent().children().removeClass('active');
            $(this).addClass('active');

            let id = $(this).attr('tab-target');
            $('.orders-body').hide();
            $('#'+id).show();
            window.location.href = window.location.href.substr(0, location.href.indexOf("#"))+"#" + id;
        })
    });

    function handleURL() {
        let tag = window.location.href.substr(window.location.href.indexOf("#") + 1);
        if (tag.length === 0) {
            tag = "statusAll";
        }
        $("[tab-target]").parent().children().removeClass('active');
        let key = "[tab-target='"+tag+"']";
        $(key).addClass('active');
        let id = $(key).attr('tab-target');
        $('.orders-body').hide();
        $('#'+id).show();
    }
</script>
<%@ include file="./common/footer.jsp" %>