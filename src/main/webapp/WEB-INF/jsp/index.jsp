<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="page index">
    <div class="index-container">
        <div class="banner-container clearfix">
            <div class="left-banner">
                <div class="category-nav-container">
                    <div class="category-nav-title-wrapper">
                        <span class="category-nav-title">全部分类</span><span class="title-icon"></span>
                    </div>
                    <div class="category-nav-content-wrapper">
                        <ul id="mainTypeList">
                        </ul>
                    </div>
                    <div id="typeTab">

                    </div>
                </div>
            </div>
            <div class="right-banner">
                <div class="home-header-links">
                    <a href="/store/hot" class="link waimai-link">热门店铺</a>
                    <a href="/post/index" class="link waimai-link">贴吧平台</a>
                    <a href="/me" class="link waimai-link">个人中心</a>
                    <a href="/register" class="link waimai-link">注册账号</a>
                </div>
                <div class="banner-row clearfix">
                    <div class="item banner-slider shadow">
                        <div class="slider" id="banner-slider">

                        </div>
                    </div>
                    <a href="#" class="link">
                        <div class="item pic-1 shadow" style="background-image:url('')"></div>
                    </a>
                    <div class="item banner-logincard">
                        <div style="float:left">
                            <div class="login-container">
                                <c:if test="${sessionScope.get(\"id\") == null }">
                                    <div class="default" style="display:block;text-align: center">
                                        <div class="head-img-row">
                                            <img src="/assets/images/default/user.png" alt="">
                                        </div>
                                        <p class="user-name">Hi！你好</p>
                                        <a class="btn-login" href="/login">立即登录</a>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.get(\"id\") != null }">
                                    <div class="default" style="display:block;text-align: center">
                                        <div class="head-img-row">
                                            <a href="/user/me"><img src="/assets/images/default/user.png" alt=""></a>
                                        </div>
                                        <div class="nickname-row">
                                            <a href="/user/me"><p class="user-name">你好</p></a>
                                            <a href="/user/me"><i class="iconfont iconfont_level icon-lable_level_undefined"></i></a>
                                        </div>
                                        <div class="fn-row clearfix">
                                            <div class="fn-item">
                                                <a href="/user/order#statusAll">
                                                    <div class="icon"><i class="iconfont icon-order_iconx"></i></div>
                                                    <p class="fn-name">我的订单</p>
                                                </a>
                                            </div>
                                            <div class="fn-item">
                                                <a href="/user/post">
                                                    <div class="icon"><i class="iconfont icon-collection_iconx"></i>
                                                    </div>
                                                    <p class="fn-name">我的帖子</p>
                                                </a>
                                            </div>
                                            <div class="fn-item">
                                                <a href="/user/info">
                                                    <div class="icon"><i class="iconfont icon-ticket_iconx"></i></div>
                                                    <p class="fn-name">账号设置</p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="banner-row clearfix">
                    <a href="#" class="link">
                        <div class="item pic-2 shadow" style="background-image:url('')"></div>
                    </a>
                    <a href="#" class="link">
                        <div class="item pic-3 shadow" style="background-image:url('')"></div>
                    </a>
                    <a href="#" class="link">
                        <div class="item pic-4 shadow" style="background-image:url('')"></div>
                    </a>
                    <a href="#" class="link">
                        <div style="width:228px;margin-right: 0px;" class="item pic-4 shadow"
                             style="background-image:url('')"></div>
                    </a>
                </div>
            </div>
        </div>
        <div class="recommend-container">
            <div class="index-nav-container undefined"
                 style="background: rgb(18, 210, 198) linear-gradient(to right, rgb(18, 210, 198) 2%, rgb(14, 190, 212) 97%) repeat scroll 0% 0%;">
                <ul class="clearfix ">
                    <li class="title nav-item mf-shang-hei-regular">猜你喜欢</li>
                    <li class="nav-item active">精选店铺</li>
                </ul>
            </div>
            <div class="recommend-list" id="recommendStore" style="margin: 0px">
                <a href="#" class="link link recommend-item">

                </a>
            </div>
        </div>
    </div>
</div>
<script>
    let hidden = true;
    let t1;
    $(document).ready(function () {
        getTypeList();
        getHotList();

        $("#mainTypeList").on('mouseenter', 'li', function () {
            let key = $(this).text();
            $("#typeTab").children().removeClass('active');
            $("[typeTarget=" + key + "]").addClass('active');
        }).on('mouseleave', 'li', function () {
            t1 = window.setTimeout(function () {
                $("#typeTab").children().removeClass('active');
            }, 100);
        });
        $("#typeTab").on('mouseleave', '.category-nav-detail-wrapper', function () {
            $("#typeTab").children().removeClass('active');
        }).on('mouseover', 'div', function () {
            clearTimeout(t1);
        });
    });

    function getHotList() {
        $.get("/store_api/show_index", function (resp) {
            if (resp.status) {
                const data = resp.data;
                let str = '';
                for (let i = 0; i < data.length; i++) {
                    str += '<a href="/store/detail?store_id=' + data[i].id + '" class="link link recommend-item">' +
                        '    <div class="card-container">' +
                        '        <div class="recommend-card-wrapper">' +
                        '            <div class="img-box">' +
                        '                <img src="' + data[i].storeImg + '" class="image">' +
                        '            </div>' +
                        '            <div class="info-box">' +
                        '                <div class="title aligned">' + data[i].storeName + '</div>' +
                        '                <div class="score-line aligned">' +
                        '<div class="score">' +
                        '    <div class="rate-stars">' +
                        '        <ul class="rate-stars-ul rate-stars-dark"><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li></ul>' +
                        '        <ul class="rate-stars-ul rate-stars-light" style="width: ' + (data[i].storeStar.avgStar * 10) + '%;"><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li></ul>' +
                        '    </div>' +
                        '</div>' +
                        '<div class="comment-number">' + data[i].storeStar.totalRemark + '个评价</div>' +
                        '                </div>' +
                        '                <div class="bottom-line aligned">' +
                        '<div class="price-box">' +
                        '    <span><span class="yuan">￥</span><span class="price-number numfont">' + parseInt(data[i].storeStar.avgPrice) + '</span><span class="price-desc">起</span></span>' +
                        '</div>' +
                        '                </div>' +
                        '            </div>' +
                        '        </div>' +
                        '    </div>' +
                        '</a>'
                }
                $("#recommendStore").html(str);
            } else {
                //
            }
        })
    }

    function getTypeList() {
        let typeList = {};
        $.get("/type_api/get_all", function (resp) {
            if (resp.status) {
                const data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    if (typeof typeList[data[i].mainType] === "undefined") {
                        typeList[data[i].mainType] = [
                            {
                                'id': data[i].id,
                                'typeName': data[i].typeName,
                            }
                        ]
                    } else {
                        typeList[data[i].mainType].push(
                            {
                                'id': data[i].id,
                                'typeName': data[i].typeName,
                            }
                        )
                    }
                }
                let mainList = '';
                for (let name in typeList) {
                    if (typeList.hasOwnProperty(name)) {
                        const data = typeList[name];
                        if (data.length === 0) {
                            continue;
                        }
                        mainList += '<li class="nav-li"><span class="nav-text-wrapper"><span><a href="#" class="link nav-text">' + name + '</a></span></span><i class="nav-right-arrow"></i></li>'
                        let id = data[0].id;

                        let str = '<div class="category-nav-detail-wrapper" typeTarget="'+name+'">' +
                            '<div class="category-nav-detail active">' +
                            '        <div class="detail-area">' +
                            '            <div class="detail-title-wrapper clearfix">' +
                            '                <h2><a href="/store/list?type_id=' + id + '&display=all" class="link detail-title">' + name + '</a></h2>' +
                            '                <a href="/store/list?type_id=' + id + '&display=all" class="link detail-more">更多<i class="detail-right-arrow"></i></a>' +
                            '            </div><div class="detail-content">';

                        for (let i = 0; i < data.length; i++) {
                            str += '<a href="/store/list?type_id=' + data[i].id + '&display=key" class="link detail-text">' + data[i].typeName + '</a>'
                        }
                        str += '</div></div></div></div>';

                        $("#typeTab").append(str);
                    }
                }
                $("#mainTypeList").html(mainList);
            } else {
                //
            }
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>