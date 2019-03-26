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
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">商品管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">商品列表</h4>
                        <button id="add" class="btn btn-sm btn-primary" type="button">新增 <span class="mdi mdi-plus"></span></button>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>缩略图</th>
                                <th>所属店铺</th>
                                <th>城市</th>
                                <th>类别</th>
                                <th>创建时间</th>
                                <th>上次修改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="store">
                                <tr>
                                    <td>${store.id}</td>
                                    <td><img src="${store.storeImg}" width="100%" height="70px">
                                    </td>
                                    <td>${store.storeName}</td>
                                    <td>${store.province} · ${store.city}</td>
                                    <td>${store.mainType} / ${store.typeName}</td>
                                    <td>${store.createdAt}</td>
                                    <td>${store.updatedAt}</td>
                                    <td>
                                        <button actionDel="${store.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionModify="${store.id}" title="修改" class="btn btn-success btn-sm"
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
<div class="modal fade" id="storeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="background-color: #fff">
            <div class="modal-header">
                <h4>店铺操作</h4>
            </div>
            <div class="modal-body">
                <form id="storeForm">
                    <input type="hidden" id="storeId" />
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3">名称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="" id="storeName">
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
                            <img id="storeImg" src="/assets/images/default/empty_img.png" class="img-thumbnail" width="100%"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">城市</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="province">

                            </select>
                        </div>
                        <div class="col-sm-4">
                            <select class="form-control" id="city">

                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-sm-3">分类</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="mainType">

                            </select>
                        </div>
                        <div class="col-sm-4">
                            <select class="form-control" id="type">

                            </select>
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
</script>
<%@ include file="./common/footer.jsp" %>