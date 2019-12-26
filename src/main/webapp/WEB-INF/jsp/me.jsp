<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div>
    <div class="page index">
        <div class="userexinfo-container">
            <div class="clearfix">
                <div style="float:left">
                    <%@ include file="./common/me_left_menu.jsp" %>
                </div>
                <div class="userinfo-box">
                    <div class="my-page">
                        <div class="user-info-box">
                            <div class="user-info">
                                <div class="head-img">
                                    <a href="#"><img src="${sessionScope.get("accountImg").toString()}" alt=""></a>
                                </div>
                                <div class="nick-name">
                                    <a href="javascript:;">
                                        <p class="nick-name-txt">${sessionScope.get("username").toString()}</p></a>
                                    <p class="user-money">加入时间：${account.createdAt}</p>
                                </div>
                                <a href="/user/info" class="user-setting">个人信息设置 &gt;</a>
                            </div>
                            <div class="userfn-ls">
                                <ul class="userfn-ul clearfix">
                                    <li>
                                        <a href="/user/order#statusAll"><i class="icon-userinfo icon-orders"></i><span>全部订单</span></a>
                                    </li>
                                    <li>
                                        <a href="/user/order#statusPay"><i class="icon-userinfo icon-nonpayment"></i><span>已完成</span></a>
                                    </li>
                                    <li>
                                        <a href="/user/order#statusMark"><i class="icon-userinfo icon-comment"></i><span>待评论</span></a>
                                    </li>
                                    <li>
                                        <a href="/user/order#statusDone"><i class="icon-userinfo icon-refund"></i><span>待付款</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="./common/footer.jsp" %>