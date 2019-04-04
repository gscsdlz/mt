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
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
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
                            <c:forEach items="${data}" var="account">
                                <tr>
                                    <td>${account.id}</td>
                                    <td><img src="${account.accountImg}" width="100%" height="70px">
                                    </td>
                                    <td>${account.username}</td>
                                    <td>********</td>
                                    <td>${account.priStr}</td>
                                    <td>${account.disabledStr}</td>
                                    <td>${account.createdAt}</td>
                                    <td>${account.updatedAt}</td>
                                    <td>
                                        <button actionDel="${account.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionModify="${account.id}" title="修改" class="btn btn-success btn-sm"
                                                type="button"><span class="mdi mdi-table-edit mdi-md"></span></button>
                                        <button actionReset="${account.id}" title="重置密码" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-autorenew mdi-md"></span></button>
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
<div id="statusForm">
    <form>
        <div class="">
            <input type="hidden" value="" name="oldVal">
            <select class="form-control" title="" name="status" onchange="updateStatus($(this))">
                <option value=""></option>
            </select>
        </div>
    </form>
</div>
<script>
    let statusMapper = [
      '', '', ''
    ];

    $(document).ready(function() {
        $("[actionChange]").click(function() {
            let id = $(this).attr('actionChange');
            let target = $(this).parent().parent();
            let dist = target.children().eq();
            let oldVal = dist.html();
            dist.html($("#statusForm").html());
            dist.find(':oldVal').val(oldVal);
            //dist.find(':status').val()
        });

        $("[actionDel]").click(function() {
            let id = $(this).attr('actionDel');
            send("/admin/order_api/del", {id:id});
        });

        $("[actionClear]").click(function() {
            let id = $(this).attr('actionClear');
            send("/admin/order_api/clearRemark", {id:id});
        });
    });

    function updateStatus(target) {

    }

    function send(url, param) {
        $.post(url, param, function(resp) {
            if (resp.status) {
                window.location.reload();
            } else {
                alert(resp.info)
            }
        })
    }

</script>
<%@ include file="./common/footer.jsp" %>
