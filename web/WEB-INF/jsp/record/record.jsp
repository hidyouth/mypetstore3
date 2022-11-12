<%@ include file="../common/top.jsp"%>

<div class="record_background">

    <a class="record_delete" href="clearRecord">
        <button class="remove">Clear Records</button>
    </a>


    <c:forEach items="${sessionScope.recordList}" var="user">
    <div >
        <a href="itemForm?itemId=${user.records}">${user.records}
    </div>
    <div style="border:5px solid #CCC"></div>
    </c:forEach>


</div>

<%@ include file="../common/bottom.jsp"%>


