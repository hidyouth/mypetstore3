<%@ include file="../common/top.jsp" %>


  <div class="newOrder">
    <form action="NewOrder" method="post">
      <h2>Order</h2>
      <div>
        <label>ItemId:</label>
        <input type="text" name="itemId" readonly="readonly" value="${sessionScope.itemId}">
      </div>
      <div>
        <label>Adress:</label>
        <input type="text" name="adress" readonly="readonly" value="${sessionScope.loginAccount.address1}">
      </div>
      <div>
        <label>ItemNum:</label>
        <input type="text" name="num" value="${sessionScope.num}">
      </div>
      <div>
        <label>ListPrice:</label>
        <input type="text" name="listprice" readonly="readonly" value="${sessionScope.listprice}">
      </div>
      <div class="btn">
        <button class="returnANDsubmit" type="submit">Sumbit</button>
      </div>
    </form>


    </div>





<%@ include file="../common/bottom.jsp" %>