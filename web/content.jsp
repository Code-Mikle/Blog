<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mile's Blog</title>
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
            <h1 class="logo"><a href="" title="Mile's Blog - POWERED BY WY ALL RIGHTS RESERVED"></a></h1>
            <ul class="nav hidden-xs-nav">
                <li><a><span class="glyphicon glyphicon-user"></span>Welcome：${sessionScope.Admin.username}</a></li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>Homepage</a></li>
                <li><a href="manage/person_homepage.jsp" target="_blank"><span class="glyphicon glyphicon-erase"></span>Admin Panel</a></li>
                <li><a href="about.html"><span class="glyphicon glyphicon-inbox"></span>About Me</a></li>
                <li><a href="readerWall.jsp"><span class="glyphicon glyphicon-globe"></span>Reader's Wall</a></li>
                <li><a href="tags.html"><span class="glyphicon glyphicon-user"></span>TAGS</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-tags"></span>Friendship link</a></li>
            </ul>
        </div>
    </header>

    <div class="content-wrap"><!--content-->
        <div class="content">
            <header class="news_header">
                <h2>${requestScope.targetArticle.title}</h2>
                <ul>
                    <li>${sessionScope.Admin.username} published at ${requestScope.targetArticle.publishDate}</li>
                    <li>category：<a href="" title="" target="_blank">${requestScope.targetArticle.category}</a></li>
                    <li>source：<a href="" title="" target="_blank">Internet</a></li>
                    <li>共 <strong>2345</strong>人围观</li>
                    <li><strong>123</strong>个不明物体</li>
                </ul>
            </header>

            <article class="news_content">
                <p>${requestScope.targetArticle.articleBody}</p>
            </article>

            <div class="reprint">
                Please indicate the source when reprinting：<a href="" title="" target="_blank">Mile's Blog</a>» <a href="" title="" target="_blank">Welcome!</a>
            </div>

            <div class="zambia">
                <a href="javascript:;" name="zambia" rel="">
                    <span class="glyphicon glyphicon-thumbs-up"></span>赞（0）</a>
            </div>

            <div class="tags news_tags">
                tags：
                <span data-toggle="tooltip" data-placement="bottom" title="查看关于 本站 的文章">
                <a href="">本站</a>
                </span>

            </div>

            <nav class="page-nav">
                <span class="page-nav-prev">Previous<br><a href="" rel="prev">欢迎来到异清轩技术博客</a>
                </span>

                <span class="page-nav-next">Next<br><a href="" rel="next">欢迎来到异清轩技术博客</a>
                </span>
            </nav>

            <div class="content-block comment">
                <h2 class="title"><strong>Comment</strong></h2>
                <form action="comment.php" method="post" class="form-inline" id="comment-form">
                    <div class="comment-title">
                        <div class="form-group">
                            <label for="commentName">Nickname：</label>
                            <input type="text" name="commentName" class="form-control" id="commentName" placeholder="nickname">
                        </div>

                        <div class="form-group">
                            <label for="commentEmail">Email：</label>
                            <input type="email" name="commentEmail" class="form-control" id="commentEmail" placeholder="admin@ylsat.com">
                        </div>

                    </div>

                    <div class="comment-form">
                        <textarea placeholder="Your comment can be right to the point." name="commentContent"></textarea>
                        <div class="comment-form-footer">
                            <div class="comment-form-text">
                                Please <a href="javascript:;">login in</a> or <a href="javascript:;">register</a> first, or you can also comment anonymously.
                            </div>
                            <div class="comment-form-btn">
                                <button type="submit" class="btn btn-default btn-comment">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="comment-content">
                    <ul>
                        <li><span class="face"><img src="static/picture/icon.png" alt=""></span><span
                                class="text"><strong>异清轩站长</strong>(2015-10-18) 说：<br>              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等在这里可以看到网站前端和后端的技术等在这里可以看到网站前端和后端的技术等 ...</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div><!--/内容-->

    <aside class="sidebar visible-lg"><!--右侧>992px显示-->

        <div class="sentence">
            <strong>Quote of the Day</strong>
            <h2>Sunday, June 1, 2025</h2>
            <p>No Limits To Life!</p>
        </div>

        <div id="search" class="sidebar-block search" role="search">
            <h2 class="title"><strong>Search</strong></h2>
            <form class="navbar-form" action="search.php" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" size="35" placeholder="please enter key words...">
                    <span class="input-group-btn">
                        <button class="btn btn-default btn-search" type="submit">Search</button>
                    </span>
                </div>
            </form>
        </div>

        <div class="sidebar-block comment">
            <h2 class="title"><strong>Latest Comments</strong></h2>
            <ul>
                <li data-toggle="tooltip" data-placement="top" title="The webmaster's comment">
                    <a target="_blank" href="readerWall.jsp">
                        <span class="face">
                            <img src="static/picture/icon.png" alt="">
                        </span>
                        <span class="text">
                            <strong>Miles</strong>(2015-10-18) said：<br>欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </aside><!--/右侧>992px显示-->

    <footer class="footer">POWERED BY &copy;<a href="/">Miles YLSAT.COM</a>ALL RIGHTS RESERVED &nbsp;&nbsp;&nbsp;
        <span>
        <a href="http://www.miitbeian.gov.cn/" target="_blank">Yu ICP No. 15026801-1</a>
        </span>
        <span style="display:none">
            <a href="">Site Statistics</a>
        </span>
    </footer>

</section>
<div><a href="javascript:;" class="gotop" style="display:none;"></a></div><!--/返回顶部-->
<script src="static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="static/js/nprogress.js" type="text/javascript"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">//页面加载$('body').show();$('.version').text(NProgress.version);NProgress.start();setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);//返回顶部按钮$(function(){	$(window).scroll(function(){		if($(window).scrollTop()>100){			$(".gotop").fadeIn();			}		else{			$(".gotop").hide();		}	});	$(".gotop").click(function(){		$('html,body').animate({'scrollTop':0},500);	});});//提示插件启用$(function () {  $('[data-toggle="popover"]').popover();});$(function () {	$('[data-toggle="tooltip"]').tooltip();});//鼠标滑过显示 滑离隐藏	//banner$(function(){	$(".carousel").hover(function(){		$(this).find(".carousel-control").show();	},function(){		$(this).find(".carousel-control").hide();	});});	//本周热门$(function(){	$(".hot-content ul li").hover(function(){		$(this).find("h3").show();	},function(){		$(this).find("h3").hide();	});});	//相关推荐$(function(){	$(".related-content ul li").hover(function(){		$(this).find("h3").show();	},function(){		$(this).find("h3").hide();	});});//页面元素智能定位$.fn.smartFloat = function() { 	var position = function(element) { 		var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 		var pos = element.css("position"); //当前元素距离页面document顶部的距离		$(window).scroll(function() { //侦听滚动时 			var scrolls = $(this).scrollTop(); 			if (scrolls >top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 				if (window.XMLHttpRequest) { //如果不是ie6 					element.css({ //设置css 						position: "fixed", //固定定位,即不再跟随滚动 						top: 0 //距离页面顶部为0 					}).addClass("shadow"); //加上阴影样式.shadow 				} else { //如果是ie6 					element.css({ 						top: scrolls  //与页面顶部距离 					});     				} 			}else { 				element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 					position: pos, 					top: top 				}).removeClass("shadow");//移除阴影样式.shadow 			} 		}); 	}; 	return $(this).each(function() { 		position($(this));                          	}); }; //启用页面元素智能定位$(function(){	$("#search").smartFloat();});//ajax更新点赞值$(function(){       $(".content .zambia a").click(function(){           var zambia = $(this);           var id = zambia.attr("rel"); //对应id           zambia.fadeOut(1000); //渐隐效果           $.ajax({               type:"POST",               url:"zambia.php",               data:"id="+id,               cache:false, //不缓存此页面               success:function(data){                   zambia.html(data);                   zambia.fadeIn(1000); //渐显效果               }           });           return false;       });   })</script>
</body>
</html>