<%@ page import="cus21047.web.mypetstore.web.servlet.LoginServlet" %>
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
<body >
<div class="box" >
    <h2>Login</h2>
    <form action="Login" method="post">

        <c:if test="${requestScope.loginMsg != null}">
            <p><font color=white>${requestScope.loginMsg}</font></p>
        </c:if>
        <div class="input-box">
            <label>账号</label>
            <input type="text" name="username"/>
        </div>
        <div class="input-box">
            <label>密码</label>
            <input type="password" name="password"/>
        </div>
        <div class="input-box">
            <label>验证码</label>
            <input type="text" name="VerificationCode"/>
            <div class="verification">
                <input type="text" name="Verification" value="${requestScope.VerificationCode}"/>
                <a href="Verification">换一个</a>

            </div>

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
