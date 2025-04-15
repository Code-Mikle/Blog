<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <!--网页图标-->
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
                <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span>数据面板</a></li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>网站首页</a></li>
                <li><a href="manage/publish_articles.jsp"><span class="glyphicon glyphicon-edit"></span>发布博客</a></li>
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
            <div class="content-block new-content">
                <h2 class="title"><strong>文章</strong></h2>

                <div class="row">
                    <div class="news-list">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4"><a target="_blank" href="../index.jsp">
                            <img src="static/picture/logo.jpg" alt=""></a></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt><a href="content.html" target="_blank">异清轩技术博客正式上线！</a></dt>
                                <dd><span class="name"><a href="" title="由 异清轩 发布"
                                                          rel="author">异清轩</a></span><span
                                        class="identity"></span><span class="time">2015-10-19 </span></dd>
                                <dd class="text">
                                    欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术，还有CMS内容管理系统，包括但不限于这些还有CMS内容管理系统，包括但不限于这些。
                                </dd>
                            </dl>
                            <div class="news_bot col-sm-7 col-md-8"><span class="tags visible-lg visible-md"><a href="">本站</a><a
                                    href="">异清轩</a></span><span
                                    class="look">共 <strong>2126</strong>人围观，发现 <strong>12 </strong>个不明物体</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分页按钮-->
                <div class="quotes" style="margin-top:15px">
                    <span class="disabled">首页</span>
                    <span class="disabled">上一页</span>
                    <span class="current">1</span>
                    <a href="">2</a>
                    <a href="">下一页</a>
                    <a href="">尾页</a>
                </div>
            </div>
        </div>
    </div><!--/内容-->

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