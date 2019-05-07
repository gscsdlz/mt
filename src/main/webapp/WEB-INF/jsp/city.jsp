<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div style="width: 60%; margin-left: 15%">
    <div class="shadow-border" style="margin-top: 20px">
        <c:forEach items="${province}" var="p">
        <div>
            <div class="city-area">
                <span class="city-label">${p}</span>
                <span class="cities">
                    <c:forEach items="${city}" var="c">
                        <c:if test="${c.province.equals(p)}">
                            <span href="javascript:;" key="${c.id}">${c.city}</span>
                        </c:if>
                    </c:forEach>
                </span>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("[key]").click(function () {
            let id = $(this).attr("key");
            $.post("/account_api/change_city", {id:id}, function (resp) {
                if (resp.status) {
                    window.location.href = "/";
                } else {
                    alert(resp.info)
                }
            })
        })
    })
</script>
<%@ include file="./common/footer.jsp" %>