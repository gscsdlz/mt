<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                订单管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/index">首页</a></li>
                    <li class="breadcrumb-item">订单管理</li>
                    <li class="breadcrumb-item active" aria-current="page">未完成订单管理</li>
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
                                        <button actionChange="${order.id}" title="修改状态" class="btn btn-success btn-sm"
                                                type="button"><span class="mdi mdi-table-edit mdi-md"></span></button>
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
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-header">
                <h4>订单状态</h4>
            </div>
            <div class="modal-body">
                <form id="storeForm">
                    <input type="hidden" id="orderId"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirm">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
    let statusMapper = [
        <c:forEach items="${status}" var="item">
        '${item.toString()}',
        </c:forEach>
    ];

    $(document).ready(function () {
        let str = "";
        for (let i = 0; i < statusMapper.length; i++) {
            str += '<div class="form-check">' +
                '<label class="form-check-label">' +
                '<input type="radio" class="form-check-input" name="status" value="' + i + '">' + statusMapper[i] + '<i class="input-helper"></i></label>\n' +
                '</div>'
        }
        $("#orderId").after(str);

        $("[actionChange]").click(function () {
            let id = $(this).attr('actionChange');
            let statusStr = $(this).parent().parent().children().eq(5).html();
            let statusId = 0;
            for (let i = 0; i < statusMapper.length; i++) {
                if (statusMapper[i] === statusStr) {
                    statusId = i;
                    break;
                }
            }

            $(":radio[name='status'][value='" + statusId + "']").prop("checked", true);
            $("#orderId").val(id);
            $("#statusModal").modal();
        });

        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            send("/admin/order_api/del", {id: id});
        });

        $("[actionClear]").click(function () {
            let id = $(this).attr('actionClear');
            send("/admin/order_api/del_remark", {id: id});
        });

        $("#confirm").click(function () {
            let id = $("#orderId").val();
            let status = $(":radio[name='status']:checked").val();
            send("/admin/order_api/change_status", {id: id, status: status});
        })
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
