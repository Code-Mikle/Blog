<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>标签管理</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link rel="icon" href="static/picture/icon.png">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link type="text/css" href="static/css/nprogress.css" rel="stylesheet">
</head>

<body>
<section class="container user-select">
    <header>
        <div class="hidden-xs header">
            <h1 class="logo"><a href="" title="羽翼技术博客 - POWERED BY WY ALL RIGHTS RESERVED"></a></h1>
            <ul class="nav hidden-xs-nav">
                <li><a href="manage/manage_login.jsp"><span class="glyphicon glyphicon-user"></span>欢迎：${sessionScope.Admin.username}</a></li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span>数据面板</a></li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>网站首页</a></li>
                <li><a href="manage/publish_articles.jsp"><span class="glyphicon glyphicon-edit"></span>发布博客</a></li>
                <li><a href="manage/manage_articles.jsp" target="_blank"><span class="glyphicon glyphicon-menu-hamburger"></span>文章管理</a></li>
                <li><a href="manage/manage_comments.jsp"><span class="glyphicon glyphicon-comment"></span>评论管理</a></li>
                <li class="active"><a href="manage/manage_tags.jsp"><span class="glyphicon glyphicon-tags"></span>标签管理</a></li>
                <li><a href="readerWall.html"><span class="glyphicon glyphicon-info-sign"></span>系统配置</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-lock"></span>修改密码</a></li>
            </ul>
        </div>
    </header>


    <div class="content-wrap"><!--内容-->
        <div class="content" id="content-manage">
            <div class="row tags-content content-block">
                <h2 class="title"><strong>标签管理</strong></h2>

                <form action="tagServlet?action=addNewTagToDatabase" method="post">
                    <input type="text" class="manage-page-search" size="35" id="new-tag-input"
                           placeholder="请输入想要添加的新标签名" name="newTagName">
                    <button class="btn btn-default btn-search" type="submit" id="manage-page-search-btn">添加标签</button>
                </form>


                <table class="table table-bordered" id="comment-table">
                    <tr>
                        <th>标签名</th>
                        <th>添加时间</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${sessionScope.tagList}" var="tag">
                        <tr>
                            <td>${tag.tagName}</td>
                            <td>${tag.createTime}</td>
                            <td class="edit-trash-style">
                                <a href="tagServlet?action=deleteTagById&tagId=${tag.id}"
                                ><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>

                </table>

            </div>
        </div>
    </div><!--/内容-->

</section>

<div><a href="javascript:;" class="gotop" style="display:none;"></a></div><!--/返回顶部-->
<script src="static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="static/js/nprogress.js" type="text/javascript"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" ></script>
</body>
</html>