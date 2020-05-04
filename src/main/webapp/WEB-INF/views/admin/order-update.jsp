<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Update order status</title>
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
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-validation">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Order by</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" value="${order.userName}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Order date</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" value="${order.orderDate}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Shipping address</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" value="${order.shippingAddress}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Note</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" value="${order.note}"
                                               disabled="disabled">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">List item</label><br>
                                    <table class="table" style="width: 85%; margin-left: 50px">
                                        <thead class="thead-muted">
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Unit price</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order.itemList}" var="item" varStatus="itr">
                                            <tr>
                                                <td>${itr.index +1}</td>
                                                <td>${item.product.name}</td>
                                                <td>${item.quantity}</td>
                                                <td>${item.unitPrice}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <label>Status</label>
                                <form:form class="form-valide" action="/admin/order/${order.id}" method="POST"
                                           modelAttribute="updateOrder">
                                    <c:forEach items="${listStatus}" var="status">
                                        <c:if test="${order.status == status}">
                                            <p>
                                                <input type="radio" class="check-box" name="status" checked="checked"
                                                       value="${status}"> ${status}
                                            </p>
                                        </c:if>
                                        <c:if test="${order.status != status}">
                                            <p>
                                                <input type="radio" class="check-box" name="status"
                                                       value="${status}"> ${status}
                                            </p>
                                        </c:if>
                                    </c:forEach>
                                    <form:errors path="status" cssStyle="color: red"></form:errors>
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