<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>评论管理</title>
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
                <li><a href="manage/person_homepage.jsp" target="_blank"><span class="glyphicon glyphicon-menu-hamburger"></span>文章管理</a></li>
                <li class="active"><a href="manage/manage_comments.jsp"><span class="glyphicon glyphicon-comment"></span>评论管理</a></li>
                <li><a href="manage/manage_tags.jsp"><span class="glyphicon glyphicon-tags"></span>标签管理</a></li>
                <li><a href="readerWall.html"><span class="glyphicon glyphicon-info-sign"></span>系统配置</a></li>
                <li><a href="friendly.html"><span class="glyphicon glyphicon-lock"></span>修改密码</a></li>
            </ul>
        </div>
    </header>


    <div class="content-wrap"><!--内容-->
        <div class="content" id="content-manage">
            <div class="row tags-content content-block">
                <h2 class="title"><strong>评论管理</strong></h2>

                <button type="button" class="input-button-pass" id="button-pass">
                    <span class="glyphicon glyphicon-check"></span>批量通过
                </button>
                <button type="button" class="input-button-del" id="button-del">
                    <span class="glyphicon glyphicon-remove"></span>批量删除
                </button>
                <button type="button" class="input-button-nocheck" id="button-invert">反选</button>

                <table class="table table-bordered" id="comment-table">
                    <tr>
                        <th><input type="checkbox" id="check-all"></th>
                        <th>评论内容</th>
                        <th>评论时间</th>
                        <th>评论人昵称</th>
                        <th>评论人邮箱</th>
                        <th>审核状态</th>
                    </tr>

                    <c:forEach items="${sessionScope.commentList}" var="comment">
                        <tr>
                            <td><input type="checkbox" name="comment-item" comment-id="${comment.id}"></td>
                            <td>${comment.comment}</td>
                            <td>${comment.commentTime}</td>
                            <td>${comment.nickname}</td>
                            <td>${comment.email}</td>
                            <td id="passed-or-under-review">已通过</td>
                        </tr>
                    </c:forEach>
                </table>

                <%--隐藏的提交表单--%>
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
    window.onload = function () {

        // 批量通过
        let btnPass = document.getElementById("button-pass");
        // 批量删除
        let btnDel = document.getElementById("button-del");
        // 反选
        let btnInvert = document.getElementById("button-invert");
        // 全选
        let checkAll = document.getElementById("check-all");

        btnPass.onclick = function () {
            alert("动态绑定,内容是=" + btnPass.innerText);
        }
        btnDel.onclick = function () {
            alert("动态绑定,内容是=" + btnDel.innerText);
        }


        // 全选
        checkAll.onclick = function () {
            let checkList = document.getElementsByName("comment-item");
            if (checkAll.checked) {
                for (let i = 0; i < checkList.length; i++) {
                    checkList[i].checked = true;
                }
            } else {
                for (let i = 0; i < checkList.length; i++) {
                    checkList[i].checked = false;
                }
            }
        }

        // 反选
        btnInvert.onclick = function () {
            let checkList = document.getElementsByName("comment-item");
            for (let i = 0; i < checkList.length; i++) {
                checkList[i].checked = checkList[i].checked !== true;
            }
        }

        // 批量删除
        btnDel.onclick = function () {
            var commentIdList = [];
            let checkList = document.getElementsByName("comment-item");
            for (let i = 0; i < checkList.length; i++) {
                if (checkList[i].checked) {
                    var attribute = checkList[i].getAttribute("comment-id");
                    commentIdList.push(attribute);
                    console.log(attribute);
                    // let trElement = checkList[i].parentElement.parentElement;
                    // console.log(trElement.children[3].innerText)
                }
            }

            // 将选中的评论ID转换成字符串，并以逗号分隔，以便于后端解析
            var commentIdsStr = commentIdList.join(',');

            // 将评论ID字符串填充到隐藏表单字段中
            document.getElementById("paraDeleteIdList").value = commentIdsStr;
            document.getElementById('actionValue').value = "removeCommentByIdList";


            // // 提交表单
            document.getElementById('commentForm').submit();
        }


    }
</script>
</body>
</html>