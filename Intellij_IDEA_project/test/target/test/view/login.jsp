<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%--登陆检查页面--%>
<html>
<head>
    <title>学生成绩管理系统-登录</title>
    <link rel="stylesheet" type="text/css" href="../image/mystyle1.css">
    <meta http-equiv="windows-Target" content="text/css">
    <SCRIPT Language="JavaScript" type="text/javascript">
        <!--
        function isValid() {
            if (formlogin.id.value == "") {
                window.alert("请输入账号！");
                document.formlogin.elements(0).focus();
                return false;
            }
            if (formlogin.password.value == "") {
                window.alert("请输入密码！");
                document.formlogin.elements(1).focus();
                return false;
            }
            formlogin.image();
        }
        -->
    </SCRIPT>
</head>

<body>
<form name="formlogin" action="/../LoginCheckServlet" method="post" onSubmit="return isValid(this);">
    <table width="800" border="0" align="center">
        <tr>
            <td height="200">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="800" height="80" colspan="3">
                            <img src="../image/login1.jpg" alt=""/>
                        </th>
                    </tr>
                    <tr>
                        <th width="800" height="139" colspan="3">
                            <img src="../image/login3.jpg" alt=""/>
                        </th>
                    </tr>
                    <tr>
                        <td width="165" height="186">
                            <img src="../image/login5.jpg" alt=""/>
                        </td>
                        <td>
                            <div align="center">
                            </div>
                            <table width="481" border="0" cellpadding="0"
                                   cellspacing="0">
                                <tr>
                                    <td width="130" height="84" align="center">
                                        用户ID：
                                    </td>
                                    <td width="180" height="84">
                                        <label><input type="text" name="id"/></label>
                                    </td>
                                    <th width="171" rowspan="3">
                                        <input type="image" src="../image/login.gif"/>
                                    </th>
                                </tr>
                                <tr>
                                    <td width="130" height="43" align="center">
                                        密&nbsp;&nbsp;码：
                                    </td>
                                    <td width="180" height="43">
                                        <label><input type="password" name="password"/></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" height="59">
                                        <label><input type="radio" name="kind" value="admin" checked/></label>
                                        管理员
                                    </td>
                                    <td>
                                        <label><input type="radio" name="kind" value="teacher"/></label>
                                        老师&nbsp;&nbsp;
                                        <label><input type="radio" name="kind" value="student"/></label>
                                        学生
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="154" height="186">
                            <img src="../image/login6.jpg" alt=""/>
                        </td>
                    </tr>
                    <tr>
                        <th width="800" height="104" colspan="3" align="right" background="../image/login4.jpg">
                            <marquee style="FILTER: blur(direction = 135, strength = 8)"
                                     behavior="alternate">
                                <font size="3" face="华文行楷" color="#0e87d1"><i>欢迎使用学生成绩管理系统！</i>
                                </font>
                            </marquee>
                        </th>
                    </tr>
                    <tr>
                        <th width="800" height="79" colspan="3">
                            <img src="../image/login2.jpg"/>
                        </th>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
