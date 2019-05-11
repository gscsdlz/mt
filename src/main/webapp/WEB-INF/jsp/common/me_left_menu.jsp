<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="orders-link-box">
    <div class="link-group"><p class="title">
        <a href="/user/me">个人中心</a></p>
        <p class="title"><a href="/user/order">我的订单</a></p>
        <ul class="link-ul" id="orderMenu">
            <li><a href="/user/order#statusAll">全部订单</a><i class="icon-right"></i></li>
            <li><a href="/user/order#statusPay">待付款</a><i class="icon-right"></i></li>
            <li><a href="/user/order#statusConfirm">待签收</a><i class="icon-right"></i></li>
            <li><a href="/user/order#statusMark">待评价</a><i class="icon-right"></i></li>
            <li><a href="/user/order#statusDone">已完成</a><i class="icon-right"></i></li>
        </ul>
    </div>
    <div class="link-group"><p class="title"><a href="/user/post">我的帖子</a></p>
        <ul class="link-ul" id="postMenu">
            <li><a href="/user/post#post">我发布的</a><span class="num"></span><i class="icon-right"></i></li>
            <li><a href="/user/post#reply">我回复的</a><span class="num"></span><i class="icon-right"></i></li>
            <li><a href="/user/post#replyMe">回复我的</a><span class="num"></span><i class="icon-right"></i></li>
        </ul>
    </div>
    <div class="link-group"><p class="title">
        <a href="/user/info">个人信息</a></p>
        <ul class="link-ul">
            <li><a href="/user/info">信息修改</a><i class="icon-right"></i></li>
            <li><a href="/user/sec">安全中心</a><i class="icon-right"></i></li>
        </ul>
    </div>
</div>
