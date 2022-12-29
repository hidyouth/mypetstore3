
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PetStore</title>
    <link rel="stylesheet" href="css/newpetstore1.css"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/377da027eb.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="top">
    <div class="top-logo">
        <a href="mainForm">PetStore</a>
    </div>
    <div class="top-search">
        <form method="post" action="SearchForm">
            <input type="text" name="keyword" id="keyword">
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <div id="productAutoComplete">
            <ul id="productAutoList">
<%--                <li class="productAutoItem">Amazon Parrot</li>--%>
<%--                <li class="productAutoItem">Labrador Retriever</li>--%>
<%--                <li class="productAutoItem">Rattlesnakes</li>--%>
<%--                <li class="productAutoItem">Chihuahua</li>--%>
<%--                <li class="productAutoItem">Tiger Shark</li>--%>
            </ul>
        </div>

    </div>
    <div class="top-account">
        <c:if test="${sessionScope.loginAccount != null }">
            <span><a href="cartForm">ShoppingCart</a></span>
            <span><a href="OrderForm">MyOrder</a></span>
            <span><a href="MyAccountForm">MyAccount</a></span>
            <span><a href="recordForm">BrowseRecords</a></span>
            <span><a href="DeleteSession">LoginOut</a></span>
        </c:if>
        <c:if test="${sessionScope.loginAccount == null}">
            <span><a href="loginForm">Login</a></span>
            <span><a href="RegisterForm">Register</a></span>
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



