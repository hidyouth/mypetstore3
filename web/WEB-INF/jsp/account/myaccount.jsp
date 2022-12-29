<%@ include file="../common/top.jsp"%>

<div class="myaccount">
<h1>My Account</h1>
    <form action="UpdateAccount" method="post">
        <div>
            <label>username:</label>
            <input type="text" readonly="readonly" name="username" value="${sessionScope.loginAccount.username}">
        </div>
        <div>
            <label>e-mail:</label>
            <input type="text" name="email" value="${sessionScope.loginAccount.email}">
        </div>
        <div>
            <label>phone:</label>
            <input type="text" name="phone" value="${sessionScope.loginAccount.phone}">
        </div>
        <div>
            <button class="returnANDsubmit" type="submit">Update</button>
        </div>
    </form>

</div>

<%@ include file="../common/bottom.jsp"%>
