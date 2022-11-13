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
            <label>FirstName:</label>
            <input type="text" name="firstName" value="${sessionScope.loginAccount.firstName}">
        </div>
        <div>
            <label>LastName:</label>
            <input type="text" name="lastName" value="${sessionScope.loginAccount.lastName}">
        </div>
        <div>
            <label>status:</label>
            <input type="text" name="status" value="${sessionScope.loginAccount.status}">
        </div>
        <div>
            <label>address1:</label>
            <input type="text" name="address1" value="${sessionScope.loginAccount.address1}">
        </div>
        <div>
            <label>address2:</label>
            <input type="text" name="address2" value="${sessionScope.loginAccount.address2}">
        </div>
        <div>
            <label>city:</label>
            <input type="text" name="city" value="${sessionScope.loginAccount.city}">
        </div>
        <div>
            <label>state:</label>
            <input type="text" name="state" value="${sessionScope.loginAccount.state}">
        </div>
        <div>
            <label>zip:</label>
            <input type="text" name="zip" value="${sessionScope.loginAccount.zip}">
        </div>
        <div>
            <label>country:</label>
            <input type="text" name="country" value="${sessionScope.loginAccount.country}">
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
