<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="./assets/css/com_header.css">
    <link rel="stylesheet" href="./assets/css/me_info.css">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
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
                    <a class="growth-entry user-importent" href="#">立即登录</a>
                    <a class="extra-entry" href="#">注册</a>
                </div>
            </div>
            <nav class="header-bar-nav">
                <ul class="header-nav-first">
                    <li class="has-child" id="me">
                        <a rel="nofollow" href="#" target="_blank">个人中心</a>
                        <ul class="header-nav-my header-nav-second" id="meList">
                            <a rel="nofollow" href="#" target="_blank"></a>
                            <li>
                                <a rel="nofollow" href="#" target="_blank"></a>
                                <a rel="nofollow" href="#" target="_blank">我的订单</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" target="_blank">我的帖子</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" target="_blank">账户设置</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="header-content clearfix">
        <div class="header-title-module">
            <div class="header-title"><img src="./assets/images/default/logo.png" alt=""></div>
        </div>
        <div class="header-search-module">
            <div class="header-search-block">
                <input class="header-search-input" type="text" placeholder="搜索商家或商品" id="searchText">
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
                window.location.href = "./";
            }
        })
    })
</script>
<div>
    <div class="page index" data-reactroot="">
        <div class="setting-container">
            <div class="clearfix">
                <div style="float:left">
                    <div class="orders-link-box">
                        <div class="link-group"><p class="title">
                            <a href="#">我的美团</a></p>
                            <p class="title"><a href="#">我的订单</a></p>
                            <ul class="link-ul">
                                <li><a href="#">全部订单</a><i class="icon-right"></i></li>
                                <li><a href="#">待付款</a><i class="icon-right"></i></li>
                                <li><a href="#">待评价</a><i class="icon-right"></i></li>
                                <li><a href="#">退款/售后</a><i class="icon-right"></i></li>
                            </ul>
                        </div>
                        <div class="link-group"><p class="title"><a href="#">我的帖子</a></p>
                            <ul class="link-ul">
                                <li><a href="#">我发布的</a><span class="num"></span><i class="icon-right"></i></li>
                                <li><a href="#">我回复的</a><span class="num"></span><i class="icon-right"></i></li>
                                <li><a href="#">回复我的</a><span class="num"></span><i class="icon-right"></i></li>
                            </ul>
                        </div>
                        <div class="link-group"><p class="title">
                            <a href="#">个人信息</a></p>
                            <ul class="link-ul">
                                <li><a href="#">信息修改</a><i class="icon-right"></i></li>
                                <li><a href="#">安全中心</a><i class="icon-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="setting-content" id="basicInfo" hidden>
                    <div class="head">
                        <p class="title">个人信息</p>
                        <p class="des">信息修改</p>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>头像</span></div>
                        <div class="field-value">
                            <img src="#" alt="" class="head-img">
                        </div>
                        <div class="upload-container">
                            <div class="btn-upload">
                                <button class="btn-change">修改</button>
                                <input type="file" name="" class="ipt-file">
                            </div>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>昵称</span></div>
                        <div class="field-value"><span class="value">繁花败叶</span></div>
                        <button class="btn-change change-nickname">修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>生日</span></div>
                        <div class="field-value"><span class="value">1996-02-21</span></div>
                        <button class="btn-change change-birthday">修改</button>
                    </div>
                </div>
                <div class="setting-content" id="passInfo">
                    <div class="head">
                        <p class="title">个人信息</p>
                        <p class="des">安全中心</p>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>密码</span></div>
                        <div class="field-value"><span class="value">**********</span></div>
                        <button class="btn-change change-nickname">修改</button>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>注册时间</span></div>
                        <div class="field-value"><span class="value">1996-02-21</span></div>
                    </div>
                    <div class="item clearfix">
                        <div class="field-name"><span>上次修改</span></div>
                        <div class="field-value"><span class="value">1996-02-21</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>