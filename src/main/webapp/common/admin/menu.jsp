<%@include file="/common/taglib.jsp" %>
<div class="nk-sidebar">
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">
            <li class="nav-label">Menu</li>
            <li><a href="<c:url value="/admin/home" />"><i class="mdi mdi-view-dashboard"></i> <span class="nav-text">Home</span></a>
            </li>
            <li><a href="<c:url value="/admin/list-user" />"><i class="mdi mdi-table-edit"></i> <span class="nav-text">Users</span></a>
            </li>
            <li><a href="<c:url value="/admin/list-brand" />"><i class="mdi mdi-table-edit"></i> <span class="nav-text">Brands</span></a>
            </li>
            <li><a href="<c:url value="/admin/list-product" />"><i class="mdi mdi-table-edit"></i> <span class="nav-text">Products</span></a>
            </li>
            <li><a href="<c:url value="/admin/list-order" />"><i class="mdi mdi-table-edit"></i> <span class="nav-text">Orders</span></a>
            </li>
        </ul>
    </div>
    <!-- #/ nk nav scroll -->
</div>