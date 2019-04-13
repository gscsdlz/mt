<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px;">
    <section class="poiList-wrap clear">
        <div class="content clear">
            <div class="left">
                <div class="filter">
                    <div class="hasSelect">
                        <span class="nor">已选条件</span>
                        <span class="sel">火锅</span>
                        <span class="clearAll">· 清除全部</span>
                    </div>
                    <div class="condition">
                        <div class="cont clear">
                            <div class="classification">分类</div>
                            <div class="all">全部</div>
                            <ul class="more clear">
                                <li><a class="on" href="#">京菜鲁菜</a></li>
                            </ul>
                        </div>
                        <div class="cont clear">
                            <div class="classification">特色</div>
                            <div class="all on">全部</div>
                            <ul class="more clear">
                                <li><a class="" href="#">京菜鲁菜</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="list">
                        <div>
                            <div class="tags">
                                <span><a href="#" class="on">默认</a></span>
                                <span><a href="#" class="">销量</a></span>
                                <span><a href="#" class="price onUpLight">价格</a></span>
                                <span><a href="#" class="">好评最多</a></span>
                            </div>
                            <div class="line"></div>
                        </div>
                        <ul class="list-ul">
                            <li class="clear btm">
                                <div class="img">
                                    <a href="#">
                                        <div class="fl-count">1</div>
                                        <div class="imgbox" style="height: 125px; width: 220px;">
                                            <img src="#">
                                        </div>
                                    </a>
                                </div>
                                <div class="info"><a href="#"><h4>Name</h4>
                                    <div class="source clear">
                                        <div class="star-cont">
                                            <ul class="stars-ul">
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                            </ul>
                                            <ul class="stars-ul stars-light" style="width: 55.44px;">
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                                <li><i class="iconfont icon-star_icon"></i></li>
                                            </ul>
                                        </div>
                                        <p>3.3分<span>50条评论</span></p>
                                    </div>
                                    <p class="desc">学院路<span>人均￥67</span></p>
                                </a>
                                </div>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="guess-you-like"><h4>猜你喜欢</h4>
                    <ul>
                        <li>
                            <a href="#">
                                <div class="pic"><div class="imgbox" style="height:100%;width:100%;"><img src="#"></div></div>
                                <p class="name">Name</p>
                                <p class="desc">长阳镇</p>
                                <p class="price"><b>￥</b>95.0</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    let storeList = [];
    $(document).ready(function () {
        $("[sort]").click(function () {
            let op = $(this).attr('sort');
            $("[sort]").removeClass('');
            $(this).addClass("");

            if (op === "name") {
                storeList.sort(function (a, b) {
                   //
                });
            }
        });
        
        $("[fetch]").click(function () {

        })
    });

    function render() {
        if (storeList.length === 0) {
          //empty description
        } else {
            for (let i = 0; i < storeList.length; i++) {
                //
            }
        }
    }

    function loadData() {
        $.get("", function (resp) {
            if (resp.status) {
                const data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    storeList.push(data[i]);
                }
                render();
            } else {
                //
            }
        })
    }

</script>
<%@ include file="./common/footer.jsp" %>