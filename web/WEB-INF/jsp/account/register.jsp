<%--
  Created by IntelliJ IDEA.
  User: 崔昊森
  Date: 2022/11/9/0009
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
  <meta charset="UTF-8">

  <title>Register</title>
  <link rel="stylesheet" href="login.css"/>
</head>
<body>
<div class="box">
  <h2>Register</h2>
  <form action="Register" method="post">
    <div class="input-box">
      <label>账号</label>
      <input type="text" name="username"/>
    </div>
    <div class="input-box">
      <label>密码</label>
      <input type="password" name="password"/>
    </div>
    <div class="input-box">
      <label>重复密码</label>
      <input type="password" name="password"/>
    </div>
    <div class="input-box">
      <label>邮箱</label>
      <input type="text" name="email"/>
    </div>
    <div class="input-box">
      <label>地址</label>
      <input type="text" name="adress"/>
    </div>
    <div>
      <div class="btn-box">
        <a href="loginForm">去登录>></a>
        <div>

          <button type="submit">注册</button>

        </div>
      </div>

    </div>
  </form>


</div>
</body>
</html>
