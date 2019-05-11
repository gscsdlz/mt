<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>管理后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/default/logo.png" />
    <script src="${pageContext.request.contextPath}/assets/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vendor.bundle.addons.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/misc.js"></script>
</head>
<body>
<div class="container-scroller">
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="/admin/index"><img src="/assets/images/default/logo.png" alt="logo"/></a>
            <a class="navbar-brand brand-logo-mini" href="/admin/index"><img src="/assets/images/default/logo.png" alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                        <div class="nav-profile-img">
                            <img src="${sessionScope.get("accountImg").toString()}" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black">${sessionScope.get("username").toString()}</p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/center">
                            <i class="mdi mdi-account-location mr-2 text-success"></i>
                            用户中心
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/">
                            <i class="mdi mdi-home mr-2 text-primary"></i>
                            返回前台
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                            <i class="mdi mdi-logout mr-2 text-primary"></i>
                            退出登录
                        </a>
                    </div>

                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <nav class="sidebar sidebar-offcanvas">
            <ul class="nav">
                <li class="nav-item <c:if test="${menu == \"index\" || menu == \"\"}"> active</c:if>">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/index">
                        <span class="menu-title">主页</span>
                        <i class="mdi mdi-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item <c:if test="${menu == \"store\"}"> active</c:if>">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/store/index">
                        <span class="menu-title">店铺管理</span>
                        <i class="mdi mdi-store menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item <c:if test="${menu == \"item\"}"> active</c:if>">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/item/index">
                        <span class="menu-title">商品管理</span>
                        <i class="mdi mdi-food menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item <c:if test="${menu == \"his_order\" || menu == \"order\"}"> active</c:if>">
                    <a class="nav-link" data-toggle="collapse" href="#order-menu" aria-expanded="true" aria-controls="ui-basic">
                        <span class="menu-title">订单管理</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-image-filter-vintage menu-icon"></i>
                    </a>
                    <div class="collapse show" id="order-menu">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link <c:if test="${menu == \"order\"}"> active</c:if>" href="${pageContext.request.contextPath}/admin/order/index">未完成订单管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link <c:if test="${menu == \"his_order\"}"> active</c:if>" href="${pageContext.request.contextPath}/admin/order/history">历史订单查询</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item <c:if test="${menu == \"type\"}"> active</c:if>">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/type/index">
                        <span class="menu-title">分类管理</span>
                        <i class="mdi mdi-animation menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item <c:if test="${menu == \"post\"}"> active</c:if>">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/post/index">
                        <span class="menu-title">发帖管理</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item <c:if test="${menu == \"normal_user\" || menu == \"admin_user\"}"> active</c:if>">
                    <a class="nav-link" data-toggle="collapse" href="#menu-user" aria-expanded="true" aria-controls="ui-basic">
                        <span class="menu-title">用户管理</span>
                        <i class="menu-arrow"></i>
                        <i class=" mdi mdi-account-multiple  menu-icon"></i>
                    </a>
                    <div class="collapse show" id="menu-user">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link  <c:if test="${menu == \"normal_user\"}"> active</c:if>" href="${pageContext.request.contextPath}/admin/account/normal">普通用户管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  <c:if test="${menu == \"admin_user\"}"> active</c:if>" href="${pageContext.request.contextPath}/admin/account/admin">管理员管理</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
