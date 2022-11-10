<%@ include file="../common/top.jsp" %>


<div id="Catalog">

  <div>
    <form action="NewOrder" method="post">
      <div>Order</div>
      <div>
        ItemId:<input type="text" name="itemId" readonly="readonly" value="${sessionScope.cart.itemId}">
      </div>
      <div>
        Adress:<input type="text" name="adress" readonly="readonly" value="${sessionScope.loginAccount.address1}">
      </div>
      <div>
        ItemNum:<input type="text" name="num" value="${sessionScope.cart.num}">
      </div>
      <div>
        TotalCost:<input type="text" name="totalcost" readonly="readonly" value="${sessionScope.cart.total_cost}">
      </div>
      <div>
        <button type="submit">Sumbit</button>
      </div>
    </form>




    </div>



</div>

<%@ include file="../common/bottom.jsp" %>