<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发布文章</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link rel="icon" href="static/picture/icon.png">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link href="static/css/nprogress.css" type="text/css" rel="stylesheet">
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
                <li class="active"><a href="../index.jsp"><span class="glyphicon glyphicon-edit"></span>发布博客</a></li>
                <li><a href="manage/manage_articles.jsp" target="_blank"><span class="glyphicon glyphicon-menu-hamburger"></span>文章管理</a></li>
                <li><a href="manage/manage_comments.jsp"><span class="glyphicon glyphicon-comment"></span>评论管理</a></li>
                <li><a href="manage/manage_tags.jsp"><span class="glyphicon glyphicon-tags"></span>标签管理</a></li>
                <li><a href="readerWall.html"><span class="glyphicon glyphicon-info-sign"></span>系统配置</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-lock"></span>修改密码</a></li>
            </ul>
        </div>
    </header>

    <div class="content-wrap"><!--内容-->
        <div class="content">
            <header class="news_header">
                <h2>文章编辑页面</h2>
            </header>

            <div class="content-block comment">
                <h2 class="title"><strong>编辑文章</strong></h2>
                <form action="articleServlet?action=addArticle" method="post" class="form-inline" id="comment-form">
                    <div class="comment-title">
                        <div class="form-group">
                            <label for="commentName">文章标题：</label>
                            <input type="text" name="articleTitle" class="form-control" id="commentName" placeholder="请输入文章标题（必填）">
                        </div>
                        <div class="form-group">
                            <label for="commentName">文章摘要：</label>
                            <input type="text" name="articleAbstract" class="form-control"  placeholder="文章摘要">
                        </div>

                        <div id="select-menu">
                            <div class="form-group">
                                <label for="commentName">文章标签：</label>
                                <%--<input type="text" id="articleTags" name="articleTags" class="form-control" placeholder="文章标签">--%>
                                <!-- 添加下拉菜单 -->
                                <select id="tagSelect" class="form-control" name="articleTags" onchange="setTagToInput(this)">
                                    <option value="">请选择标签</option>
                                    <!-- 动态生成的选项将插入此处 -->
                                    <c:forEach items="${sessionScope.tagList}" var="tag">
                                        <option value="${tag.tagName}">${tag.tagName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="commentName">文章分类：</label>
                                <%--<input type="text" name="articleCategory" class="form-control"  placeholder="文章分类">--%>
                                <select id="tagSelect" class="form-control" name="articleTags" onchange="setTagToInput(this)">
                                    <option value="">请选择标签</option>
                                    <!-- 动态生成的选项将插入此处 -->
                                    <c:forEach items="${sessionScope.tagList}" var="tag">
                                        <option value="">${tag.tagName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                    </div>

                    <h2 class="title"><strong>文章正文</strong></h2>
                    <div class="comment-form">
                        <textarea id="articles-textarea" placeholder="请输入你要发表的文章内容！！！" name="articleBody"></textarea>
                        <div class="comment-form-footer">
                            <div class="comment-form-text">
                                请先 <a href="javascript:;">登录</a>或 <a href="javascript:;">注册</a>，也可匿名评论
                            </div>
                            <div class="comment-form-btn">
                                <button type="submit" class="btn btn-default btn-comment">确认发表</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div><!--/内容-->

</section>
<div><a href="javascript:;" class="gotop" style="display:none;"></a></div><!--/返回顶部-->
<script src="static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="static/js/nprogress.js" type="text/javascript"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</body>
</html>