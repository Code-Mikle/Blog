<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章管理</title>
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
                <li class="active"><a href="manage/person_homepage.jsp" target="_blank"><span class="glyphicon glyphicon-menu-hamburger"></span>文章管理</a></li>
                <li><a href="manage/manage_comments.jsp"><span class="glyphicon glyphicon-comment"></span>评论管理</a></li>
                <li><a href="manage/manage_tags.jsp"><span class="glyphicon glyphicon-tags"></span>标签管理</a></li>
                <li><a href="readerWall.html"><span class="glyphicon glyphicon-info-sign"></span>系统配置</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-lock"></span>修改密码</a></li>
            </ul>
        </div>
    </header>


    <div class="content-wrap"><!--内容-->
        <div class="content" id="content-manage">
            <div class="row tags-content content-block">
                <h2 class="title"><strong>文章管理</strong></h2>

                <button type="button" class="input-button-add" id="button-add">
                    <span class="glyphicon glyphicon-plus"></span>新增
                </button>

                <input type="text" class="manage-page-search" size="35" placeholder="请输入关键字">
                <button class="btn btn-default btn-search" type="submit" id="manage-page-search-btn">搜索</button>



                <table class="table table-bordered" id="comment-table">
                    <tr>
                        <th>文章标题</th>
                        <th>浏览量</th>
                        <th>状态</th>
                        <th>博客分类</th>
                        <th>最新修改时间</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${sessionScope.articleList}" var="article">
                        <tr>
                            <td><a href="articleServlet?action=articleDetails&articleId=${article.id}"
                                   target="_blank">${article.title}</a></td>
                            <td>1</td>
                            <td>审核中</td>
                            <td>${article.category}</td>
                            <td>${article.publishDate}</td>
                            <td class="edit-trash-style">
                                <a href="manage/update_article.jsp?articleId=${article.id}"
                                ><span class="glyphicon glyphicon-edit"></span></a>
                                <a href="articleServlet?action=deleteArticleByArticleId&articleId=${article.id}"
                                ><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>


                </table>

                <form id="commentForm" action="commentServlet" method="post" style="display: none">
                    <input type="hidden" name="action" id="actionValue">
                    <input type="hidden" name="deleteIdList" id="paraDeleteIdList">
                </form>

            </div>
        </div>
    </div><!--/内容-->

</section>

<div><a href="javascript:;" class="gotop" style="display:none;"></a></div><!--/返回顶部-->
<script src="static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="static/js/nprogress.js" type="text/javascript"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" >

    <!--给“新增”按钮，添加响应事件-->
    let button_add = document.getElementById("button-add");
    button_add.addEventListener("click", function () {
        window.location.href = "manage/publish_articles.jsp";
    });



</script>
</body>
</html>