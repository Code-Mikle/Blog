<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>读者墙 - 羽翼技术博客</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link type="text/css" href="static/css/nprogress.css" rel="stylesheet">

    <link rel="icon" href="static/picture/icon.png">

</head>

<body>
<section class="container user-select">
    <header>
        <div class="hidden-xs header">
            <h1 class="logo"><a href="" title="羽翼技术博客 - POWERED BY WY ALL RIGHTS RESERVED"></a></h1>
            <ul class="nav hidden-xs-nav">
                <li><a><span class="glyphicon glyphicon-user"></span>欢迎：${sessionScope.Admin.username}</a></li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>网站首页</a></li>
                <li><a href="manage/person_homepage.jsp" target="_blank"><span class="glyphicon glyphicon-erase"></span>后台管理</a></li>
                <li><a href="about.html"><span class="glyphicon glyphicon-inbox"></span>关于我们</a></li>
                <li class="active"><a href="readerWall.html"><span class="glyphicon glyphicon-globe"></span>读者墙</a></li>
                <li><a href="tags.html"><span class="glyphicon glyphicon-user"></span>标签云</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-tags"></span>友情链接</a></li>
            </ul>
        </div>
    </header>

    <div class="content-wrap"><!--内容-->
        <div class="content">
            <div class="content-block"><h2 class="title"><strong>读者</strong></h2>
                <div class="face-block"><span class="face" data-toggle="tooltip" data-placement="bottom" title="异清轩"><img
                        src="static/picture/icon.png" alt=""></span><span class="face" data-toggle="tooltip"
                                                                          data-placement="bottom" title="异清轩"><img
                        src="static/picture/icon.png" alt=""></span><span class="face" data-toggle="tooltip"
                                                                          data-placement="bottom" title="异清轩"><img
                        src="static/picture/icon.png" alt=""></span>
                </div>
            </div>
            <div class="content-block comment">
                <h2 class="title"><strong>评论</strong></h2>
                <form action="commentServlet" method="post" class="form-inline" id="comment-form">
                    <input type="hidden" name="action" value="addComment">
                    <div class="comment-title">
                        <div class="form-group">
                            <label for="commentName">昵称：</label>
                            <input type="text" name="commentName" class="form-control" id="commentName" placeholder="异清轩">
                        </div>
                        <div class="form-group">
                            <label for="commentEmail">邮箱：</label>
                            <input type="email" name="commentEmail" class="form-control" id="commentEmail" placeholder="admin@ylsat.com">
                        </div>
                    </div>

                    <div class="comment-form">
                        <textarea placeholder="你的评论可以一针见血" name="commentContent"></textarea>
                        <div class="comment-form-footer">
                            <div class="comment-form-text">
                                请先 <a href="javascript:;">登录</a>或 <a href="javascript:;">注册</a>，也可匿名评论
                            </div>
                            <div class="comment-form-btn">
                                <button type="submit" class="btn btn-default btn-comment">提交评论</button>
                            </div>
                        </div>
                    </div>

                </form>
                <div class="content-block comment-content">
                    <h2 class="title"><strong>最新评论</strong></h2>

                    <ul>
                        <c:forEach items="${sessionScope.commentList}" var="comment">
                            <li><span class="face"><img src="static/picture/icon.png" alt=""></span>
                                <span class="text"><strong>${comment.nickname}</strong>(${comment.commentTime}) 说：
                                    <br>${comment.comment}
                                </span>
                            </li>
                        </c:forEach>

                    </ul>
                </div>

            </div>
        </div>
    </div><!--/内容-->

    <aside class="sidebar visible-lg"><!--右侧>992px显示-->

        <div class="sentence">
            <strong>每日一句</strong>
            <h2>2015年11月1日 星期日</h2>
            <p>你是我人生中唯一的主角，我却只能是你故事中的一晃而过得路人甲。</p>
        </div>

        <div id="search" class="sidebar-block search" role="search">
            <h2 class="title"><strong>搜索</strong></h2>
            <form class="navbar-form" action="search.php" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" size="35" placeholder="请输入关键字">
                    <span class="input-group-btn">
                    <button class="btn btn-default btn-search" type="submit">搜索</button>
                </span>
                </div>
            </form>
        </div>

        <div class="sidebar-block comment">
            <h2 class="title"><strong>最新评论</strong></h2>
            <ul>
                <c:forEach items="${sessionScope.commentList}" var="comment">
                    <li data-toggle="tooltip" data-placement="top" title="站长的评论">
                        <a target="_blank" href="readerWall.html">
                    <span class="face">
                        <img src="static/picture/icon.png" alt="">
                    </span>
                            <span class="text">
                        <strong>${comment.nickname}</strong>(${comment.commentTime}) 说：
                                <br>${comment.comment}
                    </span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </aside><!--/右侧>992px显示-->


    <footer class="footer">POWERED BY &copy;<a href="/">异清轩 YLSAT.COM</a>ALL RIGHTS RESERVED &nbsp;&nbsp;&nbsp;
        <span>
        <a href="http://www.miitbeian.gov.cn/" target="_blank">豫ICP备15026801号-1</a>
        </span>
        <span style="display:none">
            <a href="">网站统计</a>
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