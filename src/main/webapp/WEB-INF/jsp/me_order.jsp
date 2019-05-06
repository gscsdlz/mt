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
                                            <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                <p class="order-title">${order.storeName}</p></a>
                                            <p class="info">时间: ${order.createdAt}</p></div>
                                    </div>
                                    <div class="order-price">总价: ￥${order.totalPrice}</div>
                                    <div class="order-status">${order.status}</div>
                                    <div class="order-btn">
                                        <input type="hidden" value="${order.id}"/>
                                        <c:if test="${order.status.equals(\"用户创建订单\")}">
                                        <button class="btn-fff">去支付</button>
                                        </c:if>
                                        <c:if test="${order.status.equals(\"订单已送出\")}">
                                            <button class="btn-fff">确认签收</button>
                                        </c:if>
                                        <c:if test="${order.status.equals(\"订单已签收\")}">
                                            <button class="btn-fff">去评价</button>
                                        </c:if>

                                    </div>
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
                                                    <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                        <p class="order-title">${order.storeName}</p></a>
                                                    <p class="info">时间: ${order.createdAt}</p></div>
                                            </div>
                                            <div class="order-price">总价: ￥${order.totalPrice}</div>
                                            <div class="order-status">${order.status}</div>
                                            <div class="order-btn">
                                                <input type="hidden" value="${order.id}"/>
                                                <button class="btn-fff">去支付</button>
                                            </div>
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
                                                <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                    <p class="order-title">${order.storeName}</p></a>
                                                <p class="info">时间: ${order.createdAt}</p></div>
                                        </div>
                                        <div class="order-price">总价: ￥${order.totalPrice}</div>
                                        <div class="order-status">${order.status}</div>
                                        <div class="order-btn">
                                            <input type="hidden" value="${order.id}"/>
                                            <button class="btn-fff">确认签收</button>
                                        </div>
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
                                                    <a href="/store/detail?store_id=${order.storeId}" class="link">
                                                        <p class="order-title">${order.storeName}</p></a>
                                                    <p class="info">时间: ${order.createdAt}</p></div>
                                            </div>
                                            <div class="order-price">总价: ￥${order.totalPrice}</div>
                                            <div class="order-status">${order.status}</div>
                                            <div class="order-btn">
                                                <input type="hidden" value="${order.id}"/>
                                                <button class="btn-fff">去评价</button>
                                            </div>
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
                                                    <a href="/store/detail?store_id=${order.storeId}" class="link">
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
<div class="modal" id="remarkModal" hidden>
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-body">
                <h3 style="padding-bottom:10px; margin-bottom: 10px;border-bottom: 1px solid #e5e5e5">添加评价</h3>
                <input type="hidden" id="orderId">
                <table>
                    <tr style="border-bottom: 1px solid #e5e5e5">
                        <td class="td-field-name">
                            星级
                        </td>
                        <td class="td-field-value">
                            <div class="star-cont">
                                <ul class="stars-ul" id="starDown">
                                    <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                                </ul>
                                <ul class="stars-ul stars-light" style="width: 20%;" id="starUp">
                                    <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-field-name">
                            评价
                        </td>
                        <td class="td-field-value">
                            <div class="input-form-block" style="height: 100%">
                                <textarea class="input-form" rows="4" id="remark"></textarea>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="modal-btn btn-primary" type="button" id="submitRemark">确认</button>
                <button class="modal-btn btn-danger" type="button" onclick="$('#remarkModal').fadeOut()">取消</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#starDown").children().click(function () {
            let star = $(this).parent().children().index(this);
            $("#starUp").css('width', ((star + 1) * 20) + "%");
        });

        $("#starUp").children().click(function () {
            let star = $(this).parent().children().index(this);
            $("#starUp").css('width', ((star + 1) * 20) + "%");
        });


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
        });

        $(".btn-fff").click(function () {
           if ($(this).html() === "去评价") {
                $("#orderId").val($(this).prev().val());
                $("#remarkModal").fadeIn();
           } else {
               let id = $(this).prev().val();
               let status = $(this).html() === "去支付" ? 1 : 4;
               $.post("/order_api/update_status", {id:id, status:status}, function (resp) {
                   if (!resp.status) {
                       alert(resp.info);
                   } else {
                       if (status === 1) {
                           alert("支付成功");
                       } else {
                           alert("已确认收货");
                       }
                   }
                   window.location.reload();
               })
           }
        })

        $("#submitRemark").click(function () {
            let remark = $("#remark").val();
            if (remark.length === 0) {
                remark = "此用户未填写任何评论";
            }
            let star = parseInt($("#starUp").css('width'));
            let orderId = $("#orderId").val();

            $.post("/order_api/add_remark", {id:orderId, remark:remark, star:star}, function (resp) {
                if (resp.status) {
                    alert("评价成功");
                 } else {
                    alert(resp.info);
                }
                window.location.reload()
            })
        })
    });

    function handleURL() {
        let tag = window.location.href.substr(window.location.href.indexOf("#") + 1);
        if (tag.length <= 0) {
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