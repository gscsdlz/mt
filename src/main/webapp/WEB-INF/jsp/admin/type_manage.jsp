<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<form id="modifyForm" hidden>
    <input type="text" class="form-control" value="" placeholder="">
    <input type="hidden" value="" placeholder="">
    <button class="btn-sm" type="button" onclick="onSubmitClick($(this))"></button>
    <button class="btn-sm" type="button" onclick="onCancelClick($(this))"></button>
</form>
<script>
    $(document).ready(function () {
        loadMainType();
        $("#mainList").on('click', 'li', function () {
            $("#mainList").children().removeClass('.active');
            $(this).addClass(".active");
            let mainType = $(this).html();
            loadSubType(mainType);
        }).on('dblclick', 'li', function () {
            let mainType = $(this).html();
            $(this).html($("#modifyForm").html());
        })
    });

    function onCancelClick(target) {
        let val = $(this).prev().val();
        target.parent().parent().html(val);
    }

    function onSubmitClick(target) {

        $.post("/admin/type_api/modify", {}, function(resp) {
            if (resp.status) {

            } else {
                alert(resp.info)
            }
        })
    }

    function loadMainType() {
        $.get("/admin/type_api/get_mainType", function (resp) {
            if (resp.status) {
                let str = '';
                for (let i = 0; i < resp.data.length; i++) {
                    if (i === 0) {
                        loadSubType(resp.data[i].mainType)
                    }
                    str += '<li>'+resp.data[i].mainType+'</li>';
                }
                $("#mainList").html(str);
            } else {
                alert("error");
            }
        })
    }
    
    function loadSubType(mainType) {
        $.get("/admin/type_api/get_subType", {mainType:mainType}, function (resp) {
            if (resp.status) {
                let str = '';
                for (let i = 0; i < resp.data.length; i++) {
                    str += '<li>'+resp.data[i].typeName+'</li>';
                }
                $("#subList").html(str);
            } else {
                alert("error");
            }
        })
    }
</script>
<%@ include file="./common/footer.jsp" %>