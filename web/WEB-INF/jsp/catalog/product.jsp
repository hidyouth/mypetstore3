<%@ include file="../common/top.jsp" %>
<%--<div id="BackLink">--%>
<%--    <a href="categoryForm?categoryId=${sessionScope.category.categoryId}">--%>
<%--        Return to ${sessionScope.category.name}--%>
<%--    </a>--%>
<%--</div>--%>

<%--<div id="Catalog">--%>

<%--    <h2>${sessionScope.product.name}</h2>--%>

<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Item ID</th>--%>
<%--            <th>Product ID</th>--%>
<%--            <th>Description</th>--%>
<%--            <th>List Price</th>--%>
<%--            <th>&nbsp;</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="item" items="${sessionScope.itemList}">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <a href="itemForm?itemId=${item.itemId}">${item.itemId}</a>--%>
<%--                </td>--%>
<%--                <td>${item.product.productId}</td>--%>
<%--                <td>--%>
<%--                        ${item.attribute1} ${item.attribute2} ${item.attribute3}--%>
<%--                        ${item.attribute4} ${item.attribute5} ${sessionScope.product.name}--%>
<%--                </td>--%>
<%--                <td><fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/></td>--%>
<%--                <td>--%>
<%--                    <a href="addItemToCart?workingItemId=${item.itemId}" class="Button">Add to Cart</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>

<%--</div>--%>
<div class="product-box">
    <h2>You are browsing ${sessionScope.product.name} of ${sessionScope.category.name}</h2>
    <c:forEach var="item" items="${sessionScope.itemList}">
        <div class="product">
            <label>Item Id:</label><a href="itemForm?itemId=${item.itemId}">${item.itemId}</a>
            <label>Product Id:</label><label>${item.product.productId}</label>
            <label>Description:</label><label>${item.attribute1} ${item.attribute2} ${item.attribute3}
                ${item.attribute4} ${item.attribute5} ${sessionScope.product.name}</label>
            <label>List Price:</label><label>${item.listPrice}</label>
            <a href="addItemToCart?workingItemId=${item.itemId}" >
                <button class="returnANDsubmit">Add to Cart</button>
            </a>
        </div>
    </c:forEach>
    <a class="btn-box" href="categoryForm?categoryId=${sessionScope.category.categoryId}">
        <button class="returnANDsubmit">Return to ${sessionScope.category.name}</button>
    </a>
</div>

<%@ include file="../common/bottom.jsp" %>


