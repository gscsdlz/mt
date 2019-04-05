<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="page-header">
            <h3 class="page-title">
                分类管理
            </h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">分类管理</li>
                </ol>
            </nav>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">类别列表</h4>
                        <button id="add" class="btn btn-sm btn-primary" type="button">新增 <span
                                class="mdi mdi-plus"></span></button>
                        <form class="form-inline" id="addForm" style="display: none">
                            <select class="form-control mr-sm-2" id="mainTypeSelect">
                                <option></option>
                            </select>
                            <input type="text" value="" placeholder="" class="form-control mr-sm-2" id="mainTypeInput">
                            <div class="form-check mr-sm-2">
                                <label class="form-check-label"><input id="newType" type="checkbox"
                                                                       class="form-check-input" checked="">使用新的主分类<i
                                        class="input-helper"></i></label>
                            </div>
                            <input type="text" value="" placeholder="" class="form-control mr-sm-2" id="typeName">
                            <button class="btn-sm btn-gradient-danger" style="margin: 0 10px" type="button"
                                    id="addType">确认
                            </button>
                            <button class="btn-sm btn-gradient-primary" type="button" id="cancelAdd">取消</button>
                        </form>
                        <hr/>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th style="width: 10%">编号</th>
                                <th style="width: 35%;">主分类名称</th>
                                <th style="width: 35%">次分类名称</th>
                                <th style="width: 20%;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="dataArea">
                            <c:forEach items="${data}" var="type">
                                <tr>
                                    <td>${type.id}</td>
                                    <td>${type.mainType}</td>
                                    <td>${type.typeName}</td>
                                    <td>
                                        <button actionDel="${type.id}" title="删除" class="btn btn-danger btn-sm"
                                                type="button"><span class="mdi mdi-delete mdi-md"></span></button>
                                        <button actionModify="${type.id}" title="修改" class="btn btn-success btn-sm"
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
<script>
    let preM, preT;

    $(document).ready(function () {
        $.get("/admin/type_api/get_mainType", function (resp) {
            if (resp.status) {
                const data = resp.data;
                let str = '';
                for (let i = 0; i < data.length; i++) {
                    str += '<option value="' + data[i].mainType + '">' + data[i].mainType + '</option>';
                }
                $("#mainTypeSelect").html(str);
            } else {
                alert(resp.info);
            }
        });

        $("[actionDel]").click(function () {
            let id = $(this).parent().parent().children().eq(0).html();
            send('/admin/type_api/del_by_id', {id: id});
        });

        $("[actionModify]").click(function () {
            let target = $(this).parent().parent().children();
            preM = target.eq(1).html();
            preT = target.eq(2).html();

            target.eq(1).html('<input type="text" class="form-control" value="' + preM + '"/>');
            target.eq(2).html('<input type="text" class="form-control" value="' + preT + '"/>');
            target.eq(3).children().hide();
            target.eq(3).children().eq(1).after('<button class="btn btn-danger btn-sm" type="button" onclick="submitUpdate($(this))">提交</button>' + '<button onclick="submitCancel($(this))" style="margin: 0 10px;" class="btn btn-primary btn-sm" type="button">取消</button>');
        });

        toggleSI();

        $("#newType").click(function () {
            toggleSI();
        });

        $("#add").click(function () {
            $("#addForm").attr('style', "");
            toggleSI();
        });

        $("#cancelAdd").click(function () {
            $("#addForm").fadeOut();
        });

        $("#addType").click(function () {
            let mainType = $("#newType").prop("checked") ? $("#mainTypeInput").val() : $("#mainTypeSelect").val();
            let typeName = $("#typeName").val();

            let str = JSON.stringify({
                mainType: mainType, typeName: typeName
            });
            send("/admin/type_api/add", {json_str:str});
        });

    });

    function toggleSI() {
        if ($("#newType").prop("checked")) {
            $("#mainTypeInput").show();
            $("#mainTypeSelect").hide();
        } else {
            $("#mainTypeInput").hide();
            $("#mainTypeSelect").show();
        }
    }

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

    function submitCancel(target) {
        target.parent().parent().children().eq(1).html(preM);
        target.parent().parent().children().eq(2).html(preT);
        target.parent().children().show();
        target.prev().remove();
        target.remove();
    }

    function submitUpdate(target) {
        let id = target.parent().parent().children().eq(0).html();
        let mainType = target.parent().parent().children().eq(1).children().eq(0).val();
        let typeName = target.parent().parent().children().eq(2).children().eq(0).val();

        let str = JSON.stringify({
            id: id, mainType: mainType, typeName: typeName
        });
        send("/admin/type_api/modify", {json_str:str});
    }
</script>
<%@ include file="./common/footer.jsp" %>