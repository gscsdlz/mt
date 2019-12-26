<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px;">
    <section class="poiList-wrap clear">
        <div class="content clear">
            <div class="left">
                <div class="filter">
                    <div class="hasSelect" id="conditionList">
                        <span class="nor">已选条件</span>
                        <span class="clearAll" id="clearAll">· 清除全部</span>
                    </div>
                    <div class="condition">
                        <div class="cont clear">
                            <div class="classification">分类</div>
                            <div class="all" id="typeAll">全部</div>
                            <ul class="more clear" id="typeList">
                                <c:forEach items="${types}" var="type">
                                    <c:if test="${type.id == curr_type && !curr_display.equals(\"all\")}">
                                        <li style="min-width: 50px">
                                            <a class="on" href="javascript:;" typeId="${type.id}">${type.typeName}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type.id != curr_type}">
                                        <li style="min-width: 50px">
                                            <a class="" href="javascript:;" typeId="${type.id}">${type.typeName}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="cont clear">
                            <div class="classification">特色</div>
                            <div class="all" id="specialAll">全部</div>
                            <ul class="more clear" id="specialList">
                                <c:forEach items="${special}" var="s">
                                    <c:if test="${s.equals(curr_special)}">
                                        <li style="min-width: 50px"><a class="on" href="javascript:;">${s}</a></li>
                                    </c:if>
                                    <c:if test="${!s.equals(curr_special)}">
                                        <li style="min-width: 50px"><a class="" href="javascript:;">${s}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="list">
                        <div>
                            <div class="tags">
                                <span><a href="javascript:;" sortTarget="0" class="<c:if test="${curr_order == 0}">on</c:if>">默认</a></span>
                                <span><a href="javascript:;" sortTarget="1" class="<c:if test="${curr_order == 1}">on</c:if>">高价优先</a></span>
                                <span><a href="javascript:;" sortTarget="2" class="<c:if test="${curr_order == 2}">on</c:if>">低价优先</a></span>
                                <span><a href="javascript:;" sortTarget="3" class="<c:if test="${curr_order == 3}">on</c:if>">好评最多</a></span>
                            </div>
                            <div class="line"></div>
                        </div>
                        <ul class="list-ul">
                            <c:forEach items="${data}" var="store">
                                <li class="clear btm">
                                    <div class="img">
                                        <a href="/store/detail?store_id=${store.id}">
                                            <div class="fl-count"></div>
                                            <div class="imgbox" style="height: 125px; width: 220px;">
                                                <img src="${store.storeImg}">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="info">
                                        <a href="/store/detail?store_id=${store.id}">
                                            <h4>${store.storeName}</h4>
                                            <div class="source clear">
                                                <div class="star-cont">
                                                    <ul class="stars-ul">
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                    </ul>
                                                    <ul class="stars-ul stars-light" style="width: ${store.storeStar.avgStar * 10}%;">
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                        <li><i class="iconfont icon-star_icon"></i></li>
                                                    </ul>
                                                </div>
                                                <p>${store.storeStar.avgStar}分<span>${store.storeStar.totalRemark}条评论</span>
                                                </p>
                                            </div>
                                            <p class="desc">${store.address}<span>人均￥${store.storeStar.avgPrice}</span>
                                            </p>
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="guess-you-like"><h4>猜你喜欢</h4>
                    <ul id="hotList">
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    let hrefArgs = {
        'type_id': ${curr_type},
        'display': "${curr_display}",
        'special': "${curr_special}",
        'order_by': ${curr_order},
        'page': 1,
        'size': 15,
    };

    $(document).ready(function () {
        getHot();
        let notSpecial = true;
        $("#specialList").children().each(function () {
            if ($(this).children().eq(0).hasClass("on")) {
                $("#clearAll").before('<span class="sel" selTarget="special">' + $(this).children().eq(0).html() + '</span>');
                notSpecial = false;
            }
        });
        if (notSpecial) {
            $("#specialList").prev().addClass("on");
        }
        $("#specialList").on('click', 'li', function () {
            hrefArgs.special = $(this).children().eq(0).html();
            redirect();
        });


        let notType = true;
        $("#typeList").children().each(function () {
            if ($(this).children().eq(0).hasClass("on")) {
                $("#clearAll").before('<span class="sel" selTarget="type">' + $(this).children().eq(0).html() + '</span>');
                notType = false;
            }
        });
        if (notType) {
            $("#typeList").prev().addClass("on");
        }
        $("#typeList").on('click', 'li', function () {
            hrefArgs.display = "key";
            hrefArgs.type_id = $(this).children().eq(0).attr('typeId');
            redirect();
        });

        if (notType && notSpecial) {
            $("#clearAll").hide();
        }

        $("#clearAll").click(function () {
            hrefArgs.display = "all";
            hrefArgs.special = "all";
            redirect();
        });

        $("#conditionList").on('click', '.sel', function () {
            if ($(this).attr('selTarget') === "type") {
                hrefArgs.display = "all";
            } else {
                hrefArgs.special = "all";
            }
            redirect();
        });

        $("#typeAll").click(function () {
            hrefArgs.display = "all";
            redirect();
        });

        $("#specialAll").click(function () {
            hrefArgs.special = "all";
            redirect();
        });

        $("[sortTarget]").click(function () {
            hrefArgs.order_by = $(this).attr('sortTarget');
            redirect();
        })
    });

    function redirect() {
        let str = '';
        for (let key in hrefArgs) {
            if (hrefArgs.hasOwnProperty(key)) {
                if (str.length === 0) {
                    str += "?" + key + "=" + hrefArgs[key]
                } else {
                    str += "&" + key + "=" + hrefArgs[key]
                }
            }
        }
        window.location.href = str;
    }

    function getHot() {
        $.get("/store_api/get_hot?limit=10", function (resp) {
            if (resp.status) {
                const data = resp.data;
                let str = '';
                for (let i = 0; i < data.length; i++) {
                    str += ' <li>' +
                        '  <a href="/store/detail?store_id=' + data[i].id + '">' +
                        '  <div class="pic"><div class="imgbox" style="height:100%;width:100%;"><img src="' + data[i].storeImg + '"></div></div>' +
                        '  <p class="name">' + data[i].storeName + '</p>' +
                        '  <p class="desc">' + data[i].address + '</p>' +
                        '  <p class="price"><b>￥</b>' + data[i].storeStar.avgPrice + '</p>' +
                        '  </a>' +
                        '</li>'
                }
                $("#hotList").html(str);
            } else {
                //
            }
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>