<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>jQuery Pagination plugin</title>
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/plugins/bootstrap/css/bootstrap.min.css"/>">
    <script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>" type="text/javascript"></script>
</head>
<body>
        <div id="myList">

        </div>
        <ul class="pagination" id="pagination">

        </ul>
        <script type="text/javascript">
            function appendUl() {
                var total= ${totalPage};
                var getUl = document.getElementById('#pagination');
                for(var i=0;i<total;i++) {
                    var li = document.createElement('li');
                    li.setAttribute("class", "page-item");
                    li.innerHTML = '<a class="page-link" href="#">' + i +'</a>';
                    getUl.appendChild(r);
                }
            }
            appendUl();
        </script>
<script >
    // $(function () {
    //     window.pagObj = $('#pagination').twbsPagination({
    //         totalPages: 35,
    //         visiblePages: 10,
    //         onPageClick: function (event, page) {
    //             console.info(page + ' (from options)');
    //         }
    //     }).on('page', function (event, page) {
    //         console.info(page + ' (from event listening)');
    //     });
    // });
</script>
</body>
</html>