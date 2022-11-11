
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PetStore</title>
    <link rel="stylesheet" href="css/petstore.css"/>
</head>
<body>
<div class="top">
    <div class="top-returnmain">
        <a href="mainForm">PetStore</a>
    </div>
    <div class="top-account">
        <c:if test="${sessionScope.loginAccount ==null}">
            <div>
                <a href="loginForm">Login</a>
            </div>
            <div>
                <a href="">Register</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.loginAccount != null}">
            <div>
                Welcome,${sessionScope.loginAccount.username}
            </div>
            <div>
                <a href="cartForm">Shopping Cart</a>
            </div>
            <div>
                <a href="">MyAccount</a>
            </div>
            <div>
                <a href="">Login Out</a>
            </div>
        </c:if>
    </div>
</div>

<div class="middle">





<%--        <div id="MenuContent">--%>
<%--            <a href="cartForm" methods="post"> <img align="middle" name="img_cart" src="images/cart.gif" /> </a>--%>
<%--            <img align="middle" src="images/separator.gif" />--%>
<%--            <a href="#">登录</a>--%>
<%--            <a href="#">登出</a>--%>
<%--            <img align="middle" src="images/separator.gif" />--%>
<%--            <a href="#">我的账号</a>--%>
<%--            <img align="middle" src="images/separator.gif" />--%>
<%--            <a href="help.html">?</a>--%>
<%--        </div>--%>
<%--    </div>--%>



