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
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" href="css/login2.css"/>
</head>
<body>
<div class="box">
  <h2>Register</h2>
  <form action="Register" method="post">
    <c:if test="${requestScope.registerMsg != null}">
      <p><font color=white>${requestScope.registerMsg}</font></p>
    </c:if>
      <p><font color=white id="feedback"></font></p>
  <div class="reg-box">
    <div class="reg-box1">
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
          <input type="password" name="repeatpassword"/>
        </div>
        <div class="input-box">
          <label>邮箱</label>
          <input type="text" name="email"/>
        </div>

        <div class="input-box">
          <label>电话</label>
          <input type="text" name="phone"/>
        </div>
      </div>
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
<script src="js/check-username.js"></script>
</body>
</html>
