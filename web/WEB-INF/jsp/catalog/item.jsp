<%@ include file="../common/top.jsp"%>

<%--<div id="BackLink">--%>
<%--  <a href="productForm?productId=${sessionScope.product.productId}">--%>
<%--    Return to ${sessionScope.product.productId}--%>
<%--  </a>--%>
<%--</div>--%>

<%--<div id="Catalog">--%>

<%--  <table>--%>
<%--    <tr>--%>
<%--      <td>${sessionScope.product.description}</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td><b> ${sessionScope.item.itemId} </b></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td><b><font size="4">--%>
<%--        ${sessionScope.item.attribute1}--%>
<%--        ${sessionScope.item.attribute2} ${sessionScope.item.attribute3}--%>
<%--        ${sessionScope.item.attribute4} ${sessionScope.item.attribute5}--%>
<%--        ${sessionScope.product.name}--%>
<%--      </font></b></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>${sessionScope.product.name}</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>--%>
<%--        <c:if test="${sessionScope.item.quantity <= 0}">--%>
<%--          Back ordered.--%>
<%--        </c:if>--%>
<%--        <c:if test="${sessionScope.item.quantity > 0}">--%>
<%--          ${sessionScope.item.quantity} in stock.--%>
<%--        </c:if>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td><fmt:formatNumber value="${sessionScope.item.listPrice}" pattern="$#,##0.00" /></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td>--%>
<%--        <a href="addItemToCart?workingItemId=${sessionScope.item.itemId}" class="Button">Add to Cart</a>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--  </table>--%>

<%--</div>--%>

<div class="item-box">
  <div>
    ${sessionScope.product.description}
  </div>
  <div class="introduce">
    <label>
      ${sessionScope.item.itemId}
    </label>
    <label>
      ${sessionScope.item.attribute1}
      ${sessionScope.item.attribute2} ${sessionScope.item.attribute3}
      ${sessionScope.item.attribute4} ${sessionScope.item.attribute5}
      ${sessionScope.product.name}
    </label>
    <label>
      ${sessionScope.product.name}
    </label>
    <label>
      <c:if test="${sessionScope.item.quantity <= 0}">
        Back ordered.
      </c:if>
      <c:if test="${sessionScope.item.quantity > 0}">
        ${sessionScope.item.quantity} in stock.
      </c:if>
    </label>
    <label>
      List Price:$${sessionScope.item.listPrice}
    </label>
    <a href="addItemToCart?workingItemId=${sessionScope.item.itemId}">
      <button class="returnANDsubmit">Add to Cart</button>
    </a>
    <a href="NewOrderForm?ItemId=${sessionScope.item.itemId}">
      <button class="returnANDsubmit">Make An Order</button>
    </a>

  </div>
</div>

<%@ include file="../common/bottom.jsp"%>



