<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px;">
    <section class="poiList-wrap clear">
        <div class="content clear">
            <div class="left">
                <div>
                    <div class="list">
                        <div>
                            <div class="tags">
                                <span>
                                    共找到${data.size()}个符合条件的商家
                                </span>
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
                                                        <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                                                    </ul>
                                                    <ul class="stars-ul stars-light" style="width: ${store.storeStar.avgStar * 10}px;">
                                                        <li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li><li><i class="iconfont icon-star_icon"></i></li>
                                                    </ul>
                                                </div>
                                                <p>${store.storeStar.avgStar}分<span>${store.storeStar.totalRemark}条评论</span></p>
                                            </div>
                                            <p class="desc">${store.address}<span>人均￥${store.storeStar.avgPrice}</span></p>
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
    $(document).ready(function () {
        getHot();

    });
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
<%@ include file="./common/footer.jsp" %>