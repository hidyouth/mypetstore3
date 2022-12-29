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
    <div class="item-show">
        <div>
            ${sessionScope.product.description}
        </div>
        <div>
            <h2>${sessionScope.product.name}</h2>
            <p class="price"></p>
            <c:forEach var="item" items="${sessionScope.itemList}">
                <input type="radio" id="item-type" name="item" value="${item.itemId}">${item.itemId}
            </c:forEach>
            <p>${sessionScope.product.desc}</p>
            <div>
                <button class="returnANDsubmit" id="cart">Add to Cart</button>
                <button class="returnANDsubmit" id="order">Make An Order</button>
            </div>
        </div>
    </div>
<%--    <c:forEach var="item" items="${sessionScope.itemList}">--%>
<%--        <div class="product">--%>
<%--            <label>Item Id:</label><a href="itemForm?itemId=${item.itemId}">${item.itemId}</a>--%>
<%--            <label>Product Id:</label><label>${item.product.productId}</label>--%>
<%--            <label>Description:</label><label>${item.attribute1} ${item.attribute2} ${item.attribute3}--%>
<%--                ${item.attribute4} ${item.attribute5} ${sessionScope.product.name}</label>--%>
<%--            <label>List Price:</label><label>${item.listPrice}</label>--%>
<%--            <a href="addItemToCart?workingItemId=${item.itemId}" >--%>
<%--                <button class="returnANDsubmit">Add to Cart</button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
    <a class="btn-box" href="categoryForm?categoryId=${sessionScope.category.categoryId}">
        <button class="returnANDsubmit">Return to ${sessionScope.category.name}</button>
    </a>

</div>
<div id="overlay">
    <div class="popup">
        <form action="NewOrder" method="post" id="orderform">
            <p class="popup_title">Order</p>
            <p class="popup-content"><span>ProductName:</span><span class="product-name" ></span></p>
            <p class="popup-content"><span>ItemName:</span><span class="item-name" ></span></p>
            <p class="popup-content"><span>ListPrice:$</span><span class="item-price"></span></p>
            <p class="popup-content"><span>Num:</span><input type="number" value="1" class="item-num"></p>
            <p class="popup-content"><span>TotalPrice:$</span><span class="item-totalprice"></span></p>
            <p class="popup_title">Address</p>
            <div class="user-address">

            </div>
            <button value="yes" type="submit">Yes</button>
        </form>
        <button value="no">No</button>
    </div>
</div>
<script src="js/item-type1.js"></script>

<%@ include file="../common/bottom.jsp" %>


