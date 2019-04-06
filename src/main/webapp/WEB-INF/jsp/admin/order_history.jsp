<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                历史订单查询
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/index">首页</a></li>
                    <li class="breadcrumb-item">订单管理</li>
                    <li class="breadcrumb-item active" aria-current="page">历史订单查询</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">订单列表</h4>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>所属店铺</th>
                                <th>购买用户</th>
                                <th>订单详情</th>
                                <th>总价格</th>
                                <th>订单状态</th>
                                <th>用户评分</th>
                                <th>用户评论</th>
                                <th>创建时间</th>
                                <th>上次修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="order">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.storeName}</td>
                                    <td>${order.username}</td>
                                    <td>${order.itemDetails}</td>
                                    <td>￥${order.totalPrice}</td>
                                    <td>${order.status}</td>
                                    <td>${order.star}</td>
                                    <td>${order.remark}</td>
                                    <td>${order.createdAt}</td>
                                    <td>${order.updatedAt}</td>
                                    <td>
                                        <button actionDel="${order.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionClear="${order.id}" title="清空评论" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-eraser mdi-md"></span></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            send("/admin/order_api/del", {id: id});
        });

        $("[actionClear]").click(function () {
            let id = $(this).attr('actionClear');
            send("/admin/order_api/del_remark", {id: id});
        });
    });

    function send(url, param) {
        $.post(url, param, function (resp) {
            if (resp.status) {
                alert("完成");
                window.location.reload();
            } else {
                alert(resp.info)
            }
        })
    }

</script>
<%@ include file="./common/footer.jsp" %>
