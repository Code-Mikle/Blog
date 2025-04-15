<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mile's Blog</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link type="text/css" href="static/css/nprogress.css" rel="stylesheet">

    <!--web page icon-->
    <link rel="icon" href="static/picture/icon.png">

</head>

<body>
<section class="container user-select">
    <header>
        <div class="hidden-xs header">
            <h1 class="logo"><a href="" title="Mile's Blog - POWERED BY WY ALL RIGHTS RESERVED"></a></h1>
            <ul class="nav hidden-xs-nav">
                <li><a href="manage/manage_login.jsp"><span class="glyphicon glyphicon-user"></span>Welcome：${sessionScope.Admin.username}</a></li>
                <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>Homepage</a></li>
                <li><a href="manage/person_homepage.jsp" target="_blank"><span class="glyphicon glyphicon-erase"></span>Admin Panel</a></li>
                <li><a href="about.html"><span class="glyphicon glyphicon-inbox"></span>About Me</a></li>
                <li><a href="commentServlet?action=queryComments"><span class="glyphicon glyphicon-globe"></span>Reader's Wall</a></li>
                <li><a href="tags.html"><span class="glyphicon glyphicon-user"></span>TAGS</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-tags"></span>Friendship link</a></li>
            </ul>
        </div>
    </header>

    <div class="content-wrap"><!--内容-->
        <div class="content">
            <div class="content-block new-content">
                <h2 class="title"><strong>Article</strong></h2>

                <c:forEach items="${sessionScope.articleList}" var="article">
                    <div class="row">
                        <div class="news-list">
                            <div class="news-img col-xs-5 col-sm-5 col-md-4"><a target="_blank" href="">
                                <img src="static/picture/hack_logo.jpeg" alt=""></a>
                            </div>
                            <div class="news-info col-xs-7 col-sm-7 col-md-8">
                                <dl>
                                    <dt><a href="articleServlet?action=articleDetails&articleId=${article.id}"
                                           target="_blank">${article.title}</a></dt>
                                    <dd><span class="name"><a href="" title="由 异清轩 发布"
                                                              rel="author">Miles</a></span><span
                                            class="identity"></span><span class="time">${article.publishDate}</span></dd>
                                    <dd class="text">
                                        ${article.articleAbstract}
                                    </dd>
                                </dl>
                                <div class="news_bot col-sm-7 col-md-8"><span class="tags visible-lg visible-md"><a href="">This Site</a><a
                                        href="">Miles</a></span><span
                                        class="look">Total <strong>2126</strong>Visitors，<strong>12 </strong>Unknown Objects Detected</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!--分页按钮-->
                <div class="quotes" style="margin-top:15px">
                    <span class="disabled">Home</span>
                    <span class="disabled">Previous</span>
                    <span class="current">1</span>
                    <a href="">2</a>
                    <a href="">Next</a>
                    <a href="">Last Page</a>
                </div>
            </div>
        </div>
    </div><!--/content-->


    <aside class="sidebar visible-lg"><!--right side>992px display-->

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
                <c:forEach items="${sessionScope.commentList}" var="comment">
                    <li data-toggle="tooltip" data-placement="top" title="The webmaster's comment">
                        <a target="_blank" href="readerWall.jsp">
                    <span class="face">
                        <img src="static/picture/icon.png" alt="">
                    </span>
                            <span class="text">
                        <strong>${comment.nickname}</strong>(${comment.commentTime}) said：
                                <br>${comment.comment}
                    </span>
                        </a>
                    </li>
                </c:forEach>
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
<script type="text/javascript">//页面加载$('body').show();$('.version').text(NProgress.version);NProgress.start();setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);//返回顶部按钮$(function(){	$(window).scroll(function(){		if($(window).scrollTop()>100){			$(".gotop").fadeIn();			}		else{			$(".gotop").hide();		}	});	$(".gotop").click(function(){		$('html,body').animate({'scrollTop':0},500);	});});//提示插件启用$(function () {  $('[data-toggle="popover"]').popover();});$(function () {	$('[data-toggle="tooltip"]').tooltip();});//鼠标滑过显示 滑离隐藏$(function(){	$(".carousel").hover(function(){		$(this).find(".carousel-control").show();	},function(){		$(this).find(".carousel-control").hide();	});});$(function(){	$(".hot-content ul li").hover(function(){		$(this).find("h3").show();	},function(){		$(this).find("h3").hide();	});});//页面元素智能定位$.fn.smartFloat = function() { 	var position = function(element) { 		var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 		var pos = element.css("position"); //当前元素距离页面document顶部的距离		$(window).scroll(function() { //侦听滚动时 			var scrolls = $(this).scrollTop(); 			if (scrolls >top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 				if (window.XMLHttpRequest) { //如果不是ie6 					element.css({ //设置css 						position: "fixed", //固定定位,即不再跟随滚动 						top: 0 //距离页面顶部为0 					}).addClass("shadow"); //加上阴影样式.shadow 				} else { //如果是ie6 					element.css({ 						top: scrolls  //与页面顶部距离 					});     				} 			}else { 				element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 					position: pos, 					top: top 				}).removeClass("shadow");//移除阴影样式.shadow 			} 		}); 	}; 	return $(this).each(function() { 		position($(this));                          	}); }; //启用页面元素智能定位$(function(){	$("#search").smartFloat();});//异步加载更多内容jQuery("#pagination a").on("click", function (){    var _url = jQuery(this).attr("href");    var _text = jQuery(this).text();    jQuery(this).attr("href", "javascript:viod(0);");    jQuery.ajax(    {        type : "POST",        url : _url,        success : function (data)        {            //将返回的数据进行处理，挑选出class是news-list的内容块            result = jQuery(data).find(".row .news-list");            //newHref获取返回的内容中的下一页的链接地址            nextHref = jQuery(data).find("#pagination a").attr("href");            jQuery(this).attr("href", _url);            if (nextHref != undefined)            {                jQuery("#pagination a").attr("href", nextHref);            }			else            {                jQuery("#pagination a").html("下一页没有了").removeAttr("href")            }            // 渐显新内容            jQuery(function ()            {                jQuery(".row").append(result.fadeIn(300));                jQuery("img").lazyload(                {                    effect : "fadeIn"                });            });        }    });    return false;});</script>

</body>

</html>