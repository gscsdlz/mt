<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp"%>
<div style="margin-top: 10px">
    <section class="detail-wrap">
        <div class="content">
            <div class="details clear">
                <div class="d-left">
                    <div class="name">${store.storeName}</div>
                    <div class="score clear">
                        <div class="star-cont">
                            <ul class="stars-ul">
                                <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                            </ul>
                            <ul class="stars-ul stars-light" style="width: ${store.storeStar.avgStar * 10}px;">
                                <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                            </ul>
                        </div>
                        <p>${store.storeStar.avgStar}分<span> 人均￥${store.storeStar.avgPrice}</span></p>
                    </div>
                    <div class="address">
                        <p>地址：${store.address}</p>
                        <p>电话：${store.storePhone}</p>
                        <p>营业时间：${store.workTime}</p>
                    </div>
                </div>
                <div class="d-right">
                    <div class="big">
                        <div class="imgbox" style="height: 100%; width: 100%;">
                            <img src="${store.storeImg}">
                        </div>
                    </div>
                </div>
                <c:if test="${sessionScope.get(\"id\") == null}">
                    <button type="button" class="normal-btn" onclick="window.location.href='/login?redirect=' + window.location.pathname + window.location.search">开始下单</button>
                </c:if>
                <c:if test="${sessionScope.get(\"id\") != null}">
                    <button type="button" class="normal-btn" >开始下单</button>
                </c:if>
            </div>
            <div class="btm-cont clear">
                <div class="btm-left">
                    <div class="recommend"><h3>推荐菜</h3>
                        <div class="cont">
                            <ul class="clear">
                                <c:forEach items="${hotItem}" var="item">
                                <li>
                                    <div class="pic">
                                        <div class="imgbox" style="height: 100%; width: 100%;">
                                            <img src="${item.itemImg}">
                                        </div>
                                        <div class="desc">
                                            <span class="truncate">${item.itemName}</span> <b>￥${item.price}</b>
                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                            <!--<div class="list clear">
                                <span>重庆老火锅</span>
                            </div>-->
                        </div>
                    </div>
                    <div class="comment">
                        <div class="total">
                            <div class="sort">
                                <span class="on" id="orderDate">最近的评论</span>
                                <span class="" id="orderStar">好评优先</span>
                            </div>
                            <span id="totalRemark">0</span>条点评
                        </div>
                        <div class="com-cont">
                            <ul class="tags clear">
                                <li class="">好评(<span id="remarkV1">0</span>)</li>
                                <li class="">中评(<span id="remarkV2">0</span>)</li>
                                <li class="">差评(<span id="remarkV3">0</span>)</li>
                            </ul>
                            <div id="remarkList">

                            </div>
                            <div class="mt-pagination">
                                <ul class="pagination clear">
                                    <li><span class="iconfont icon-btn_left" id="pagePrev"></span></li>
                                    <li><span class="iconfont icon-btn_right" id="pageNext"></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btm-right">
                    <div class="guess-you-like"><h4>猜你喜欢</h4>
                        <ul id="hotList">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    let remarkCurrPage = 1;
    let orderArg = 0;
    $(document).ready(function () {
       getHot();
       getRemarkInfo();
       getRemark(orderArg, 1, 15);

       $("#pagePrev").click(function () {
           if ($(this).hasClass("disabled")) {
               return;
           }
           getRemark(orderArg, remarkCurrPage - 1, 15);
       });

       $("#pageNext").click(function () {
           if ($(this).hasClass("disabled")) {
               return;
           }
           getRemark(orderArg, remarkCurrPage + 1, 15);
       });

       $("#orderDate").click(function () {
           $(this).addClass('on');
           $("#orderStar").removeClass("on");
           orderArg = 1;
           getRemark(orderArg, 1, 15);
       });

       $("#orderStar").click(function () {
           $(this).addClass('on');
           $("#orderDate").removeClass("on");
           orderArg = 0;
           getRemark(orderArg, 1, 15);
       });
    });

    function getRemarkInfo() {
        $.get("/order_api/get_remark_info", {store_id:${store.id}}, function (resp) {
            if (resp.status) {
                $("#totalRemark").html(resp.data.total);
                $("#remarkV1").html(resp.data.r1);
                $("#remarkV2").html(resp.data.r2);
                $("#remarkV3").html(resp.data.r3);
            } else {
                //
            }
        })
    }

    function getRemark(orderBy, page, size) {
        $.get("/order_api/get_remark", {store_id:${store.id}, order_by:orderBy, page:page, size:size}, function (resp){
            if (resp.status) {
                const data = resp.data;
                let str = '';
                for (let i = 0; i < data.length; i++) {
                    str += '<div class="list clear">' +
                        ' <div class="header"><div class="imgbox" style="height: 100%; width: 100%;"><img src="'+data[i].accountImg+'"></div></div>' +
                        ' <div class="info">' +
                        '     <div class="name">'+data[i].username+'</div>' +
                        '     <div class="date"><span>'+data[i].createdAt+'</span></div>' +
                        '     <div class="source">' +
                        '         <div class="star-cont">' +
                        '             <ul class="stars-ul"><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li></ul>' +
                        '             <ul class="stars-ul stars-light" style="width: '+(data[i].star * 10)+'px;"><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li></ul>' +
                        '         </div>' +
                        '     </div>' +
                        '     <div class="desc">'+data[i].remark+'</div>' +
                        '<div class="line"></div>' +
                        '</div>' +
                        '</div>'
                }
                $("#remarkList").html(str);

                if (resp.totalPage === resp.currPage) {
                    $("#pageNext").addClass("disabled");
                }
                if (resp.currPage === 1) {
                    $("#pagePrev").addClass("disabled");
                }
                remarkCurrPage = resp.currPage;
            } else {
                //
            }
        })
    }

    function getHot() {
        $.get("/store_api/get_hot?limit=10", function (resp) {
            if (resp.status) {
                const data = resp.data;
                let str = '';
                for (let i = 0; i < data.length; i++) {
                    str += ' <li>' +
                        '  <a href="/store/detail?store_id='+data[i].id+'">' +
                        '  <div class="pic"><div class="imgbox" style="height:100%;width:100%;"><img src="'+data[i].storeImg+'"></div></div>' +
                        '  <p class="name">'+data[i].storeName+'</p>' +
                        '  <p class="desc">'+data[i].address+'</p>' +
                        '  <p class="price"><b>￥</b>'+data[i].storeStar.avgPrice+'</p>' +
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
<%@ include file="./common/footer.jsp"%>