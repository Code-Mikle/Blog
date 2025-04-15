<%--
  Created by IntelliJ IDEA.
  User: mikle
  Date: 2024/5/28
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改文章</title>
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
                <li class="active"><a href="../index.jsp"><span class="glyphicon glyphicon-edit"></span>修改博客</a></li>
                <li><a href="manage/manage_articles.jsp" target="_blank"><span class="glyphicon glyphicon-menu-hamburger"></span>文章管理</a></li>
                <li><a href="about.html"><span class="glyphicon glyphicon-comment"></span>评论管理</a></li>
                <li><a href="about.html"><span class="glyphicon glyphicon-tags"></span>标签管理</a></li>
                <li><a href="readerWall.html"><span class="glyphicon glyphicon-info-sign"></span>系统配置</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-lock"></span>修改密码</a></li>
            </ul>
        </div>
    </header>

    <div class="content-wrap"><!--内容-->
        <div class="content">
            <header class="news_header">
                <h2>文章修改页面</h2>
            </header>

            <div class="content-block comment">
                <h2 class="title"><strong>修改文章</strong></h2>
                <form action="articleServlet?action=editArticleByArticleId&articleId=${param.articleId}" method="post" class="form-inline" id="comment-form">

                    <c:set var="articleId" value="${param.articleId}"/>
                    <c:forEach items="${sessionScope.articleList}" var="article">
                        <c:if test="${articleId eq article.id}">
                            <c:set var="targetArticle" value="${article}"/>
                        </c:if>
                    </c:forEach>
                    <div class="comment-title">
                        <div class="form-group">
                            <label for="commentName">文章标题：</label>
                            <input type="text" name="articleTitle" class="form-control" id="commentName" placeholder="请输入文章标题（必填）"
                                   value="${targetArticle.title}">
                        </div>
                        <div class="form-group">
                            <label for="commentName">文章标签：</label>
                            <input type="text" name="articleTags" class="form-control" placeholder="文章标签"
                                   value="${targetArticle.tags}">
                        </div>
                        <div class="form-group">
                            <label for="commentName">文章摘要：</label>
                            <input type="text" name="articleAbstract" class="form-control"  placeholder="文章摘要"
                                   value="${targetArticle.articleAbstract}">
                        </div>
                        <div class="form-group">
                            <label for="commentName">文章分类：</label>
                            <input type="text" name="articleCategory" class="form-control"  placeholder="文章分类"
                                   value="${targetArticle.category}">
                        </div>
                    </div>

                    <h2 class="title"><strong>文章正文</strong></h2>
                    <div class="comment-form">
                        <textarea id="articles-textarea" placeholder="请输入你要发表的文章内容！！！" name="articleBody">
                            <c:out value="${targetArticle.articleBody}"/></textarea>
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
<script type="text/javascript">//页面加载$('body').show();$('.version').text(NProgress.version);NProgress.start();setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);//返回顶部按钮$(function(){	$(window).scroll(function(){		if($(window).scrollTop()>100){			$(".gotop").fadeIn();			}		else{			$(".gotop").hide();		}	});	$(".gotop").click(function(){		$('html,body').animate({'scrollTop':0},500);	});});//提示插件启用$(function () {  $('[data-toggle="popover"]').popover();});$(function () {	$('[data-toggle="tooltip"]').tooltip();});//鼠标滑过显示 滑离隐藏	//banner$(function(){	$(".carousel").hover(function(){		$(this).find(".carousel-control").show();	},function(){		$(this).find(".carousel-control").hide();	});});	//本周热门$(function(){	$(".hot-content ul li").hover(function(){		$(this).find("h3").show();	},function(){		$(this).find("h3").hide();	});});	//相关推荐$(function(){	$(".related-content ul li").hover(function(){		$(this).find("h3").show();	},function(){		$(this).find("h3").hide();	});});//页面元素智能定位$.fn.smartFloat = function() { 	var position = function(element) { 		var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 		var pos = element.css("position"); //当前元素距离页面document顶部的距离		$(window).scroll(function() { //侦听滚动时 			var scrolls = $(this).scrollTop(); 			if (scrolls >top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 				if (window.XMLHttpRequest) { //如果不是ie6 					element.css({ //设置css 						position: "fixed", //固定定位,即不再跟随滚动 						top: 0 //距离页面顶部为0 					}).addClass("shadow"); //加上阴影样式.shadow 				} else { //如果是ie6 					element.css({ 						top: scrolls  //与页面顶部距离 					});     				} 			}else { 				element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 					position: pos, 					top: top 				}).removeClass("shadow");//移除阴影样式.shadow 			} 		}); 	}; 	return $(this).each(function() { 		position($(this));                          	}); }; //启用页面元素智能定位$(function(){	$("#search").smartFloat();});//ajax更新点赞值$(function(){       $(".content .zambia a").click(function(){           var zambia = $(this);           var id = zambia.attr("rel"); //对应id           zambia.fadeOut(1000); //渐隐效果           $.ajax({               type:"POST",               url:"zambia.php",               data:"id="+id,               cache:false, //不缓存此页面               success:function(data){                   zambia.html(data);                   zambia.fadeIn(1000); //渐显效果               }           });           return false;       });   })</script>
</body>
</html>
