<%@ include file="../common/top.jsp"%>





    <div class="cart-box">
        <c:if test="${sessionScope.loginAccount ==null}">
            你还没有<a href="LoginForm">登录</a>.
        </c:if>
        <c:if test="${sessionScope.loginAccount !=null}">
            <h2>Shopping Cart</h2>
            <c:if test="${sessionScope.cartList == null}">
                    There is no product in your cart.
            </c:if>
            <c:if test="${sessionScope.cartList != null}">
                <c:forEach var="cart" items="${sessionScope.cartList}" >
                    <div class="Cart">
                            ${cart.desc}
                        <label id="productname">${cart.productId}</label>
                        <a href="productForm?productId=${cart.productid}" id="itemname">${cart.itemId}</a>
                        <label id="cart_num">num:${cart.num}</label>
                        <label>Update num:</label>
                        <form action="updateCart" method="post" id="cartContent">
                            <input type="hidden" name="itemId" value="${cart.itemId}">
                            <input type="text" name="num" id="cartNum" value="${cart.num}"/>
                        </form>
                        <label id="total_cost" data-totalcost="${cart.total_cost}">$: ${cart.total_cost}</label>
                        <button id="remove">Remove</button>
                        <button  id="order">Place an order</button>

                    </div>
                </c:forEach>
                <a href="mainForm">
                    <button class="returnANDsubmit">Return to Main Menu</button>
                </a>

            </c:if>
        </c:if>



    <%--                                    <tr>--%>
<%--                                        <td>--%>
<%--                                            <a href="itemForm?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>--%>
<%--                                        </td>--%>
<%--                                        <td>${cartItem.item.product.productId}</td>--%>
<%--                                        <td>${cartItem.item.attribute1} ${cartItem.item.attribute2}--%>
<%--                                                ${cartItem.item.attribute3} ${cartItem.item.attribute4}--%>
<%--                                                ${cartItem.item.attribute5} ${cartItem.item.product.name}</td>--%>
<%--                                        <td>${cartItem.inStock}</td>--%>
<%--                                        <td>--%>
<%--                                            <input type="text" name="${cartItem.item.itemId}" value="${cartItem.quantity}">--%>
<%--                                        </td>--%>
<%--                                        <td><fmt:formatNumber value="${cartItem.item.listPrice}"--%>
<%--                                                              pattern="$#,##0.00" /></td>--%>
<%--                                        <td><fmt:formatNumber value="${cartItem.total}"--%>
<%--                                                              pattern="$#,##0.00" /></td>--%>
<%--                                        <td>--%>
<%--                                            <a href="removeCartItem?workingItemId=${cartItem.item.itemId}" class="Button">remove</a>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>



<%--        <h2>Shopping Cart</h2>--%>

<%--        <form action="updateCart" method="post">--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <th><b>Item ID</b></th>--%>
<%--                    <th><b>Product ID</b></th>--%>
<%--                    <th><b>Description</b></th>--%>
<%--                    <th><b>In Stock?</b></th>--%>
<%--                    <th><b>Quantity</b></th>--%>
<%--                    <th><b>List Price</b></th>--%>
<%--                    <th><b>Total Cost</b></th>--%>
<%--                    <th>&nbsp;</th>--%>
<%--                </tr>--%>

<%--                <c:if test="${sessionScope.cartList == null}">--%>
<%--                    <tr>--%>
<%--                        <td colspan="8"><b>���ﳵ�ǿյġ�</b></td>--%>
<%--                    </tr>--%>
<%--                </c:if>--%>

<%--                <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            <a href="itemForm?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>--%>
<%--                        </td>--%>
<%--                        <td>${cartItem.item.product.productId}</td>--%>
<%--                        <td>${cartItem.item.attribute1} ${cartItem.item.attribute2}--%>
<%--                                ${cartItem.item.attribute3} ${cartItem.item.attribute4}--%>
<%--                                ${cartItem.item.attribute5} ${cartItem.item.product.name}</td>--%>
<%--                        <td>${cartItem.inStock}</td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="${cartItem.item.itemId}" value="${cartItem.quantity}">--%>
<%--                        </td>--%>
<%--                        <td><fmt:formatNumber value="${cartItem.item.listPrice}"--%>
<%--                                              pattern="$#,##0.00" /></td>--%>
<%--                        <td><fmt:formatNumber value="${cartItem.total}"--%>
<%--                                              pattern="$#,##0.00" /></td>--%>
<%--                        <td>--%>
<%--                            <a href="removeCartItem?workingItemId=${cartItem.item.itemId}" class="Button">remove</a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                <tr>--%>
<%--                    <td colspan="7">--%>
<%--                        Sub Total: <fmt:formatNumber value="${sessionScope.cart.subTotal}" pattern="$#,##0.00" />--%>
<%--                        <input type="submit" value="Update Cart">--%>
<%--                    </td>--%>
<%--                    <td>&nbsp;</td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </form>--%>

<%--        <c:if test="${sessionScope.cart.numberOfItems > 0}">--%>
<%--            <a href="newOrderForm" class="Button">Proceed to Checkout</a>--%>
<%--        </c:if>--%>
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

   <%-- <div id="MyList">
        <c:if test="${sessionScope.loginAccount != null}">
            <c:if test="${!empty sessionScope.loginAccount.listOption}">
                <%@ include file="includeMyList.jsp"%>
            </c:if>
        </c:if>
    </div>--%>

<script src="./js/cart-update1.js"></script>


<%@ include file="../common/bottom.jsp"%>