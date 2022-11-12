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
  <link rel="stylesheet" href="css/login2.css"/>
</head>
<body>
<div class="box">
  <h2>Register</h2>
  <form action="Register" method="post">
    <c:if test="${requestScope.registerMsg != null}">
      <p><font color=white>${requestScope.registerMsg}</font></p>
    </c:if>
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
          <label>地址1</label>
          <input type="text" name="address1"/>
        </div>
        <div class="input-box">
          <label>地址2</label>
          <input type="text" name="address2"/>
        </div>
        <div class="input-box">
          <label>姓</label>
          <input type="text" name="firstname"/>
        </div>
    </div>
      <div class="reg-box1">
        <div class="input-box">
          <label>名</label>
          <input type="text" name="lastname"/>
        </div>
        <div class="input-box">
          <label>国家</label>
          <input type="text" name="country"/>
        </div>
        <div class="input-box">
          <label>城市</label>
          <input type="text" name="city"/>
        </div>
        <div class="input-box">
          <label>州</label>
          <input type="text" name="state"/>
        </div>
        <div class="input-box">
          <label>电话</label>
          <input type="text" name="phone"/>
        </div>
        <div class="input-box">
          <label>邮政编码</label>
          <input type="text" name="zip"/>
        </div>
        <div class="input-box">
          <label>职业</label>
          <input type="text" name="status"/>
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
</body>
</html>
