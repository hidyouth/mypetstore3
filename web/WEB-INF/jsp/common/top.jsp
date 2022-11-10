
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html >

<head>

    <title>MyPetStore</title>
    <link rel="StyleSheet" href="css/mypetstore.css" type="text/css" media="screen" />

</head>

<body>
<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="mainForm"> <img src="images/logo-topbar.gif" /> </a>
        </div>
    </div>

    <div id="Menu">
        <c:if test="${sessionScope.loginAccount ==null}">
            <div id="MenuContent">
                您还没有登录，请<a href="loginForm">登录</a> | 没有账号？点这里<a href="#">注册</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.loginAccount != null}">
            <div id="MenuContent">
                欢迎您，${sessionScope.loginAccount.username}
            </div>
        </c:if>
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

    <div id="Search">
        <div id="SearchContent">
            <form action="" method="post">
                <input type="text" name="keyword" size="14">
                <input type="submit" name="searchProducts" value="Search">
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="categoryForm?categoryId=FISH"> <img src="images/sm_fish.gif" /> </a>
        <img src="images/separator.gif" />
        <a href="categoryForm?categoryId=DOGS"> <img src="images/sm_dogs.gif" /> </a>
        <img src="images/separator.gif" />
        <a href="categoryForm?categoryId=REPTILES"> <img src="images/sm_reptiles.gif" /> </a>
        <img src="images/separator.gif" />
        <a href="categoryForm?categoryId=CATS"> <img src="images/sm_cats.gif" /> </a>
         <img src="images/separator.gif" />
        <a href="categoryForm?categoryId=BIRDS"> <img src="images/sm_birds.gif" /> </a>
    </div>

</div>

<div id="Content"></div>

