<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>跳转页面</title>
    <style type="text/css">
        /* 未访问链接*/
        a:link {
            color: #000000;
            font-size: 20pt;
        }

        /* 已访问链接 */
        a:visited {
            color: #00FF00;
            font-size: 20pt;
        }

        /* 鼠标移动到链接上 */
        a:hover {
            color: #FF00FF;
            font-size: 20pt;
        }

        /* 鼠标点击时 */
        a:active {
            color: #0000FF;
            font-size: 20pt;
        }

        a {
            position: relative;
            font-style: italic;
            left: -400;
            font-size: 20pt;
        }

        h2 {
            position: relative;
            font-style: italic;
            font-size: 20pt;
            left: -400;
            color: #00FF00;
        }

        body {
            background-image: url('image/header-bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<table align="center">
    <tr valign="middle">
        <td height="200"></td>
    </tr>
    <tr>
        <td>
            <h2 id="ff">欢迎使用学生成绩管理系统！</h2>
            <a id="f" href="view/login.jsp">进入系统</a>
            <script language="JavaScript1.2" type="text/javascript">
                if (document.getElementById || document.all) {
                    var cross_link = document.getElementById ? document.getElementById("f").style : document.all.f.style;
                    var cross_header = document.getElementById ? document.getElementById("ff").style : document.all.ff.style;
                    cross_header.left = -400;
                    cross_link.left = -400;
                }
                //实现链接和标题的随时间变化
                function animate() {
                    if (parseInt(cross_header.left) < 0 && parseInt(cross_link.left) < 0) {
                        cross_header.left = parseInt(cross_header.left) + 20;
                        cross_link.left = parseInt(cross_link.left) + 20;
                    }
                    else {
                        cross_header.left = 0;
                        cross_link.left = 0;
                        clearInterval(start)
                    }
                }
                if (document.getElementById || document.all)
                    start = setInterval("animate()", 60)
            </script>
        </td>
    </tr>
</table>
</body>
</html>
