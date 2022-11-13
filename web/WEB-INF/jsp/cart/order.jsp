<%@ include file="../common/top.jsp"%>





<div class="cart-box">
    <c:if test="${sessionScope.loginAccount ==null}">
        你还没有<a href="LoginForm">登录</a>.
    </c:if>
    <c:if test="${sessionScope.loginAccount !=null}">
        <h2>My Order</h2>
        <c:if test="${sessionScope.orderList == null}">
            There is no order.
        </c:if>
        <c:if test="${sessionScope.orderList != null}">
            <c:forEach var="order" items="${sessionScope.orderList}">
                <div class="Cart">
                    <a href="itemForm?itemId=${order.itemId}">${order.itemId}</a>
                    <label>num:</label>${order.num}
                    <label>$: ${order.total_cost}</label>
                    <label>address:${order.address}</label>
                    <a href="RemoveOrder?id=${order.id}" ><button class="remove">Remove</button></a>

                </div>
            </c:forEach>
            <a href="mainForm">
                <button class="returnANDsubmit">Return to Main Menu</button></a>

        </c:if>
    </c:if>



</div>






<%@ include file="../common/bottom.jsp"%>
