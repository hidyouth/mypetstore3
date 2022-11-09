<%--
  Created by IntelliJ IDEA.
  User: 崔昊森
  Date: 2022/11/9/0009
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body b>
<div class="box" >
    <h2>Login</h2>
    <form action="Login" method="post">

        <c:if test="${requestScope.loginMsg != null}">
            <p><font color="#4169e1">${requestScope.loginMsg}</font></p>
        </c:if>
        <div class="input-box">
            <label>账号</label>
            <input type="text" name="username"/>
        </div>
        <div class="input-box">
            <label>密码</label>
            <input type="password" name="password"/>
        </div>
        <div>
            <div class="btn-box">
                <a href="#">去注册>></a>
                <div>
                    <button type="submit">登录</button>
                </div>
            </div>

        </div>
    </form>


</div>
</body>
</html>
