<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/style-login.css?t=16125" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server" text="用户名">
        <div id="transitionPage">
            <div id="show-login-btn"><i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;点击这里进行登录</div>
            <div id="back-homgpage-btn"><a href="../index.aspx"><i class="fas fa-reply-all"></i>&nbsp;&nbsp;点击这里返回主页</a></div>
        </div>
		<div class="login-box">
			<div id="hide-login-btn"><i class="far fa-times-circle"></i></div>

			<div id="login-form">
				<h1>Welcome,Administrator</h1>
			    <asp:TextBox ID="userName" runat="server" CssClass="login-txt" Wrap="False"  Text="username" AUTOCOMPLETE="OFF"></asp:TextBox>
                <asp:TextBox ID="userPwd" runat="server" CssClass="login-txt"  Text="password" Wrap="False" TextMode="SingleLine" AUTOCOMPLETE="OFF"></asp:TextBox>
			    <asp:Button ID="loginBtn" runat="server" Text="Login" cssclass="login-btn" OnClick="loginBtn_Click"/>
			</div>
    
		</div>
    </form>
    <script type="text/javascript">
        $(function () {
            function setLoginDefautl() {
                var uName = document.getElementById("userName");
                var uPwd = document.getElementById("userPwd");
                uName.onfocus = function () {
                    if (uName.value == "username")  //聚焦时，如果文本框为初始值，则清空
                        uName.value = "";
                }
                uName.onblur = function () {
                    if (uName.value == "")  //失焦时，如果文本框为空，则置位默认值
                        uName.value = "username";
                }
                uPwd.onfocus = function () {
                    if (uPwd.value == "password")  //聚焦时，如果文本框为初始值，则清空
                    {
                        uPwd.value = "";
                        $("#userPwd").attr('type','password');
                    }
                        
                }
                uPwd.onblur = function () {
                    if (uPwd.value == "")  //失焦时，如果文本框为空，则置位默认值
                    {
                        $("#userPwd").attr('type', 'text');
                        uPwd.value = "password";
                    } 
                }
                
            }
            setLoginDefautl();
            var strIde='<%=strIde%>';
            if(strIde=="LF")
            {
                $("#userPwd").attr('type','password');
            }

            $("#show-login-btn").on("click", function () {
                $(".login-box").toggleClass("show");
            });
            $("#hide-login-btn").on("click", function () {
                $(".login-box").toggleClass("show");
            });
        });
    </script>
	</body>
</html>
