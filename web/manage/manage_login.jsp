<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员登录</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link type="text/css" href="../static/css/nprogress.css" rel="stylesheet">

    <link rel="icon" href="static/picture/icon.png">
</head>
<body style="display: flex;justify-content: center;align-items: center;height: 100vh;margin: 0;background-color: #f0f2f5;">
    <div class="login-container">
        <h2>管理员登录</h2>
        <div class="login-board">
            <%--提示错误信息--%>
            <span style="font-size: 18pt;font-weight: bold;float: right;color: gainsboro">
                ${requestScope.msg}
            </span>
            <form action="adminServlet" method="POST">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" placeholder="username" name="username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" placeholder="password" name="password" required>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>

    </div>
</body>
</html>