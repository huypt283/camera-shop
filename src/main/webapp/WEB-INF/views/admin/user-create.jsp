<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Create user</title>
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/template/admin/assets/images/favicon.png" />">
    <link href="<c:url value="/template/admin/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/template/admin/js/modernizr-3.6.0.min.js" />"></script>
</head>
<body class="v-light vertical-nav fix-header fix-sidebar">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>
<div id="main-wrapper">
    <!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->

    <!-- sidebar -->
    <%@ include file="/common/admin/menu.jsp" %>
    <!-- sidebar -->

    <div class="content-body" style="min-height: 814px;">
        <div class="container">
            <div class="row page-titles">
                <div class="col p-0">
                    <h4>Hello, <span>Welcome here</span></h4>
                </div>
                <div class="col p-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">From</a>
                        </li>
                        <li class="breadcrumb-item active">Validation</li>
                    </ol>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-validation">
                                <form:form class="form-valide" action="/admin/user" method="POST"
                                           modelAttribute="userRequest">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-userName">User name <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-userName" name="userName"
                                                   placeholder="Enter username.." value="">
                                            <form:errors path="userName" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-fullName">Full name <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-fullName" name="fullName"
                                                   placeholder="Enter full name..">
                                            <form:errors path="fullName" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-email">Email <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-email" name="email"
                                                   placeholder="Enter email.." value="">
                                            <form:errors path="email" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-password">Password <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="password" class="form-control" id="val-password"
                                                   name="password" placeholder="Enter password..">
                                            <form:errors path="password" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Phone <span class="text-danger"></span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-phone" name="phone"
                                                   placeholder="Enter phone.." value="">
                                            <form:errors path="phone" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Address <span class="text-danger"></span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-address" name="address"
                                                   placeholder="Enter address.." value="">
                                            <form:errors path="address" cssStyle="color: red"></form:errors>
                                        </div>
                                    </div>
                                    <c:forEach items="${roles}" var="role">
                                        <p>
                                            <input type="checkbox" class="check-box" name="ids"
                                                   value="${role.id}"> ${role.name}
                                        </p>
                                    </c:forEach>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="/common/admin/footer.jsp" %>
    <!-- footer -->
</div>

<!-- Common JS -->
<script src="<c:url value="/template/admin/assets/plugins/common/common.min.js" />"></script>
<!-- Custom script -->
<script src="<c:url value="/template/admin/js/custom.min.js" />"></script>
</body>
</html>