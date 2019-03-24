<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                商铺管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">商铺管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">商铺列表</h4>
                        <button id="add" class="btn btn-sm btn-primary" type="button">新增 <span
                                class="mdi mdi-plus"></span></button>
                        <button id="moreAction" disabled class="btn btn-sm btn-primary dropdown-toggle" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">批量操作
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">删除</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div role="separator" class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">取消全选</a>
                        </div>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>缩略图</th>
                                <th>名称</th>
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
                                    <td>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input">${store.id}
                                            </label>
                                        </div>
                                    </td>
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
                <form>
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
    let checkedIds = [];
    let provinceCityList = [];
    let typeMapper = [];

    $(document).ready(function () {
        $("#confirm").click(function (){
            let name = $("#storeName").val();
            let city = $("#city").val();
            let type = $("#type").val();
            let img = $("#storeImg").attr('src');
            if (parseInt($("#storeId").val()) > 0 ) {
                //udpate
            } else {
                //add
                let args = {
                    storeName: name,
                    cityId: city,
                    typeId: type,
                    storeImg: img,
                };
                $.post("/admin/store_api/add", {json_str: JSON.stringify(args)}, function (resp) {

                })
            }
        });

        $("#uploadFile").AjaxFileUpload({
            "action": "/upload_api/image",
            "onComplete": function(filename, response) {
                response = response.substr(5, response.length - 11);
                response = JSON.parse(response);
                if (!response.status) {
                    alert(response.info)
                } else {
                    $("#storeImg").attr('src', response.data);
                }
            }
        });

        $(".form-check-input").click(function () {
            checkedIds = [];
            $(".form-check-input").each(function () {
                if ($(this).prop('checked')) {
                    checkedIds.push($(this).parent().text().trim())
                }
            });
            if (checkedIds.length === 0) {
                $("#moreAction").attr("disabled", true);
            } else {
                $("#moreAction").attr("disabled", false);
            }
        });

        $("[actionDel]").click(function () {
            let id = $(this).attr('actionDel');
            $.post("/admin/store_api/del", {id: id}, function (resp) {
                if (resp.status) {
                    alert("删除成功");
                    window.location.reload();
                } else {
                    alert(resp.info);
                }
            })
        });

        $("#add").click(function () {
            $("#storeModal").modal()
        });

        $("#province").change(function () {
            loadCity($(this).val())
        });
        $("#mainType").change(function () {
            loadType($(this).val())
        });

        $.get("/type_api/get_all", function (resp) {
            if (resp.status) {
                let data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    if (typeof typeMapper[data[i].mainType] === 'undefined') {
                        typeMapper[data[i].mainType] = [];
                    }
                    typeMapper[data[i].mainType].push(
                        {
                            "id": data[i].id,
                            "typeName": data[i].typeName,
                        }
                    )
                }
                let t = getAllMainType();
                for (let i = 0; i < t.length; i++) {
                    $("#mainType").append('<option value="' + t[i] + '">' + t[i] + '</option>')
                }
                loadType(t[0]);
            } else {
                console.log("加载类型列表失败，请重试");
            }
        });

        $.get("/city_api/get_all", function (resp) {
            if (resp.status) {
                let data = resp.data;
                for (let i = 0; i < data.length; i++) {
                    if (typeof provinceCityList[data[i].province] === 'undefined') {
                        provinceCityList[data[i].province] = [];
                    }
                    provinceCityList[data[i].province].push(
                        {
                            "id": data[i].id,
                            "city": data[i].city,
                        }
                    )
                }
                let p = getAllProvince();
                for (let i = 0; i < p.length; i++) {
                    $("#province").append('<option value="' + p[i] + '">' + p[i] + '</option>')
                }
                loadCity(p[0]);
            } else {
                console.log("加载城市列表失败，请重试");
            }
        });
    });

    function getAllProvince() {
        let res = [];
        for (let key in provinceCityList) {
            if (provinceCityList.hasOwnProperty(key)) {
                res.push(key)
            }
        }
        return res;
    }

    function getAllCity(provinceName) {
        return provinceCityList[provinceName];
    }


    function getAllMainType() {
        let res = [];
        for (let key in typeMapper) {
            if (typeMapper.hasOwnProperty(key)) {
                res.push(key)
            }
        }
        return res;
    }

    function getAllType(typeName) {
        return typeMapper[typeName];
    }

    function loadCity(cityName) {
        $("#city").html("");
        let cList = getAllCity(cityName);
        for (let i = 0; i < cList.length; i++) {
            $("#city").append('<option value="' + cList[i].id + '">' + cList[i].city + '</option>')
        }
    }

    function loadType(mainType) {
        $("#type").html("");
        let types = getAllType(mainType);
        for (let i = 0; i < types.length; i++) {
            $("#type").append('<option value="' + types[i].id + '">' + types[i].typeName + '</option>')
        }
    }
</script>
<%@ include file="./common/footer.jsp" %>