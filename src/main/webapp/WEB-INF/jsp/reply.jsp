<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="margin-top: 10px">
    <section class="detail-wrap">
        <div class="content">
            <div class="btm-cont clear">
                <div class="btm-left">
                    <div class="recommend">
                        <h3>热门话题</h3>
                        <div class="cont">
                            <table style="width: 100%">
                                <tbody id="hotDate">
                                <tr>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>为啥还不开空调?</span></td>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>kindle paperwhite3 二手售卖</span></td>
                                </tr>
                                <tr class="post-tr">
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>为啥还不开空调?</span></td>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>kindle paperwhite3 二手售卖</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="recommend">
                        <h3>最多讨论</h3>
                        <div class="cont">
                            <table style="width: 100%">
                                <tbody id="hotReply">
                                <tr>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>为啥还不开空调?</span></td>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>kindle paperwhite3 二手售卖</span></td>
                                </tr>
                                <tr class="post-tr">
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>为啥还不开空调?</span></td>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title"><span>kindle paperwhite3 二手售卖</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="btm-right">
                    <div class="guess-you-like">
                        <h4>今日榜单</h4>
                        <table style="width: 100%">
                            <tbody>
                            <c:forEach items="${todayP}" var="post">
                                <tr>
                                    <td class="post-td-img"><img src="/assets/images/ui/point.png"</td>
                                    <td class="post-td-title" postId="${post.id}"><span>${post.postTitle}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="guess-you-like" style="margin-top: 10px">
                        <h4 style="text-align: center">统计信息</h4>
                        <hr/>
                        <table style="width: 100%">
                            <tbody>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <td>总帖子数</td>
                                <td>12</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
</script>
<%@ include file="./common/footer.jsp" %>