
<%@ include file="../common/top.jsp"%>

<%--<div id="BackLink">--%>
<%--    <a href="mainForm">Return to Main Menu</a>--%>
<%--</div>--%>


<%--<div id="Catalog">--%>

<%--    <h2>${sessionScope.category.name}</h2>--%>

<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Product ID</th>--%>
<%--            <th>Name</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="product" items="${sessionScope.productList}">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                <a href="productForm?productId=${product.productId}">${product.productId}</a>--%>
<%--                </td>--%>
<%--                <td>${product.name}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>


<div class="category-box">
    <div>
        <h2>You are browsing ${sessionScope.category.name}</h2>
    </div>
    <div class="product-list">
        <c:forEach var="product" items="${sessionScope.productList}">
            <div class="product-show">
                <a href="productForm?productId=${product.productId}">${product.description}</a>
                <a href="productForm?productId=${product.productId}" class="pro-name">${product.name}</a>
            </div>
            <%--        <div class="category">--%>
            <%--            <label>PeoductId:</label>--%>
            <%--            <a href="productForm?productId=${product.productId}">${product.productId}</a>--%>
            <%--            <label>Name:</label><label>${product.name}</label>--%>
            <%--        </div>--%>
        </c:forEach>
    </div>

    <a class="btn-box" href="mainForm">
            <button class="returnANDsubmit">Return To Main Menu</button>
    </a>
</div>






<%@ include file="../common/bottom.jsp"%>
