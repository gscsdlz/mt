<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                商品管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/admin/index">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">商品管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">商品列表</h4>
                        <button id="add" class="btn btn-sm btn-primary" type="button">新增
                            <span class="mdi mdi-plus"></span></button>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>缩略图</th>
                                <th>名称</th>
                                <th>所属店铺</th>
                                <th>价格</th>
                                <th>销量</th>
                                <th>库存</th>
                                <th>评分</th>
                                <th>创建时间</th>
                                <th>上次修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="item">
                                <tr>
                                    <td>${item.id}</td>
                                    <td><img src="${item.itemImg}" width="100%" height="70px">
                                    </td>
                                    <td>${item.itemName}</td>
                                    <td>${item.storeName}</td>
                                    <td>${item.price}</td>
                                    <td>${item.totalSale}</td>
                                    <td>${item.inventory}</td>
                                    <td>${item.star}</td>
                                    <td>${item.createdAt}</td>
                                    <td>${item.updatedAt}</td>
                                    <td>
                                        <button actionDel="${item.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionModify="${item.id}" title="修改" class="btn btn-success btn-sm"
                                                type="button"><span class="mdi mdi-table-edit mdi-md"></span></button>
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
<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-header">
                <h4>商品操作</h4>
            </div>
            <div class="modal-body">
                <form id="itemForm">
                    <input type="hidden" id="itemId"/>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3">名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="" id="itemName">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3">缩略图</label>
                                <div class="col-sm-9">
                                    <input type="file" class="form-control" id="uploadFile" name="image"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <img id="itemImg" src="/assets/images/default/empty_img.png" class="img-thumbnail" width="100%"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">所属店铺</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="storeId">
                                <c:forEach items="${stores}" var="store">
                                    <option value="${store.id}">${store.storeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">价格</label>
                        <div class="col-sm-8">
                            <input type="text" value="" class="form-control" id="price" placeholder=""/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">库存</label>
                        <div class="col-sm-8">
                            <input type="text" value="" class="form-control" id="inventory" placeholder=""/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirm">确认</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/AjaxFileUpload.js"></script>
<script>
    $(document).ready(function () {
        $("#confirm").click(function () {
            let name = $("#itemName").val();
            let price = $("#price").val();
            let inventory = $("#inventory").val();
            let storeId = $("#storeId").val();
            let img = $("#itemImg").attr('src');
            let id = $("#itemId").val();

            let args = {
                itemName: name,
                price: price,
                inventory: inventory,
                itemImg: img,
                id: id,
                storeId: storeId,
            };
            if (id > 0) {
                //udpate
                $.post("/admin/item_api/modify", {json_str: JSON.stringify(args)}, function (resp) {
                    if (resp.status) {
                        window.location.reload();
                    } else {
                        alert(resp.info);
                    }
                })
            } else {
                //add
                $.post("/admin/item_api/add", {json_str: JSON.stringify(args)}, function (resp) {
                    if (resp.status) {
                        window.location.reload();
                    } else {
                        alert(resp.info);
                    }
                })
            }
        });

        $("#uploadFile").AjaxFileUpload({
            "action": "/upload_api/image",
            "onComplete": function (filename, response) {
                response = response.substr(5, response.length - 11);
                response = JSON.parse(response);
                if (!response.status) {
                    alert(response.info)
                } else {
                    $("#itemImg").attr('src', response.data);
                }
            }
        });

        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            $.post("/admin/item_api/del", {id: id}, function (resp) {
                if (resp.status) {
                    alert("删除成功");
                    window.location.reload();
                } else {
                    alert(resp.info);
                }
            })
        });

        $("[actionModify]").click(function () {
            let id = $(this).attr('actionModify');
            let target = $(this).parent().parent().children();
            $("#itemName").val(target.eq(2).html());
            $("#itemId").val(target.eq(0).html());
            $("#itemImg").attr('src', target.eq(1).children().eq(0).attr('src'));
            $("#price").val(target.eq(4).html());
            $("#inventory").val(target.eq(6).html());
            $("#itemModal").modal();
        });

        $("#add").click(function () {
            document.getElementById("itemForm").reset();
            $("#itemIdm").val(0);
            $("#itemImg").attr('src', '/assets/images/default/empty_img.png');
            $("#itemModal").modal();
        });
    });
</script>
<%@ include file="./common/footer.jsp" %>