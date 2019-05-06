<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>自定义标题</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/default/logo.png" />
    <link rel="stylesheet" href="/assets/css/com_header.css">
    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <script src="/assets/js/jquery.min.js"></script>
</head>
<body>
<header class="com-header">
    <div class="header-bar">
        <div class="header-content clearfix">
            <div class="header-bar-position" style="display: block;">
                <span class="header-icon icon-header_location"></span>
                <span class="current-city">北京</span>
                <a class="change-city" href="#">切换城市</a>
                <div class="user-entry" style="display: inline-block;">
                    <c:if test="${sessionScope.get(\"id\") == null}">
                        <a class="growth-entry user-importent" href="/login">立即登录</a>
                        <a class="extra-entry" href="/register">注册</a>
                    </c:if>
                </div>
            </div>
            <nav class="header-bar-nav">
                <ul class="header-nav-first">
                    <li class="has-child" id="me">
                        <c:if test="${sessionScope.get(\"id\") != null}">
                        <a rel="nofollow" href="/user/me">个人中心</a>
                        <ul class="header-nav-my header-nav-second" id="meList">
                            <a rel="nofollow" href="#"></a>
                            <li>
                                <a rel="nofollow" href="/user/order#statusAll">我的订单</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="/user/post">我的帖子</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="/user/info">账户设置</a>
                            </li>
                            <c:if test="${Integer.parseInt(sessionScope.get(\"pri\").toString()) != 2}">

                                <li>
                                    <a rel="nofollow" href="/admin/index">管理后台</a>
                                </li>
                            </c:if>
                            <li>
                                <a rel="nofollow" href="/logout">退出登录</a>
                            </li>
                        </ul>
                        </c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="header-content clearfix">
        <div class="header-title-module">
            <div class="header-title"><img src="/assets/images/default/logo.png" alt="" style="cursor: pointer" onclick="window.location.href='/'"></div>
        </div>
        <div class="header-search-module">
            <div class="header-search-block">
                <input class="header-search-input" type="text" placeholder="搜索商家" id="searchText" value="${search_key}">
                <button class="header-search-btn" id="search"><span class="header-icon icon-search"></span></button>
            </div>
        </div>
    </div>
</header>
<script>
    $(document).ready(function () {
        $("#me").mouseover(function () {
            $("#meList").show();
        })
            .mouseleave(function () {
                $("#meList").hide();
            });

        $("#search").click(function () {
            let key = $("#searchText").val();
            if (key.length !== 0) {
                window.location.href = "/store/search?key=" +  key;
            }
        })
    })
</script>