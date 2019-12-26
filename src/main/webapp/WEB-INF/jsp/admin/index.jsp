<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./common/header.jsp" %>
<div class="main-panel">
    <div class="page-header">
        <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
          <i class="mdi mdi-home"></i>
        </span>
            主页
        </h3>
    </div>
    <div class="row">
        <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-danger card-img-holder text-white">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">总店铺数量</h4>
                            <h2 class="mb-5">${info.get("all_store")}</h2>
                        </div>
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">总商品数量</h4>
                            <h2 class="mb-5">${info.get("all_item")}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-info card-img-holder text-white">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">总订单数量</h4>
                            <h2 class="mb-5">${info.get("all_order")}</h2>
                        </div>
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">未完成订单数量</h4>
                            <h2 class="mb-5">${info.get("order_done")}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-success card-img-holder text-white">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">总帖子数量</h4>
                            <h2 class="mb-5">${info.get("all_post")}</h2>
                        </div>
                        <div class="col-sm-6">
                            <h4 class="font-weight-normal mb-3">总跟帖数量</h4>
                            <h2 class="mb-5">${info.get("all_reply")}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <h4 class="card-title float-left">近一个月订单情况</h4>
                    </div>
                    <div id="orderImg" style="width: 100%; height: 400px"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">仅一个月用户数量</h4>
                    <div id="accountImg" style="width: 100%; height: 400px"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/assets/js/echarts.min.js"></script>
<script>
    $(document).ready(function () {

        let date = [
            <c:forEach items="${account_data}" var="d">
            '${d.key}',
            </c:forEach>
        ];
        let accountData = [
            <c:forEach items="${account_data}" var="d">
            ${d.value},
            </c:forEach>
        ];

        let orderData = [
            <c:forEach items="${order_data}" var="d">
            ${d.value},
            </c:forEach>
        ];
        let accountImg = echarts.init(document.getElementById('accountImg'));
        accountImg.setOption({
            tooltip: {
                trigger: 'axis'
            },
            toolbox: {
                show: true,
                feature: {
                    magicType: {type: ['line', 'bar']},
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: date
            },
            yAxis: {
                type: 'value',
            },
            series: [
                {
                    name: '人数',
                    type: 'line',
                    data: accountData,
                    markPoint: {
                        data: [
                            {type: 'max', name: '最大值'},
                            {type: 'min', name: '最小值'}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        });

        let orderImg = echarts.init(document.getElementById('orderImg'));
        orderImg.setOption({
            tooltip: {
                trigger: 'axis'
            },
            toolbox: {
                show: true,
                feature: {
                    magicType: {type: ['line', 'bar']},
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: date
            },
            yAxis: {
                type: 'value',
            },
            series: [
                {
                    name: '数量',
                    type: 'line',
                    data: orderData,
                    color: "#2f4554",
                    markPoint: {
                        data: [
                            {type: 'max', name: '最大值'},
                            {type: 'min', name: '最小值'}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        });
    })
</script>
<%@ include file="./common/footer.jsp" %>
