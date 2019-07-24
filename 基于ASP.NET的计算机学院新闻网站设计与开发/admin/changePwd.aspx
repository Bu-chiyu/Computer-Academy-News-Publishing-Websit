<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="admin_changePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/style-changePwd.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="changePwdBox">
        <div id="changePwdForm">
            <h1>更改密码</h1>
            <div class="textBox">
                <div class="txt">原密码：</div>
                <div id="showPwd1"><i class="far fa-eye-slash"></i></div>
                <asp:TextBox ID="oldPwd1" runat="server" CssClass="pwdText" AUTOCOMPLETE="OFF" TextMode="Password"></asp:TextBox>
                
            </div>
            <div class="textBox">
                <div class="txt">再次输入：</div>
                <div id="showPwd2"><i class="far fa-eye-slash"></i></div>
                <asp:TextBox ID="oldPwd2" runat="server" CssClass="pwdText" AUTOCOMPLETE="OFF" TextMode="Password"></asp:TextBox>
                
            </div>
            <div class="textBox">
                <div class="txt">新密码:</div>
                <div id="showPwd3"><i class="far fa-eye"></i></div>
                <asp:TextBox ID="newPwd" runat="server" CssClass="pwdText" AUTOCOMPLETE="OFF" TextMode="Password"></asp:TextBox>
                
            </div>
            <asp:Button ID="btnChangePwd" runat="server" Text="确定" OnClick="btnChangePwd_Click" CssClass="btn"/>
            <asp:Button ID="btnBack" runat="server" Text="取消" OnClick="btnBack_Click" CssClass="btn"/>
        </div>
    </div>
    </form>
    <script>
        $("#btnChangePwd").click(function () {
            alert("修改成功，请重新登录！");
        });
        $("#showPwd1").mouseover(function () {
            $("#showPwd1 i").attr('class', 'far fa-eye');
            $("#oldPwd1").attr('type', 'text');
        });
        $("#showPwd1").mouseout(function () {
            $("#showPwd1 i").attr('class', 'far fa-eye-slash');
            $("#oldPwd1").attr('type', 'password');
        });
        $("#showPwd2").mouseover(function () {
            $("#showPwd2 i").attr('class', 'far fa-eye');
            $("#oldPwd2").attr('type', 'text');
        });
        $("#showPwd2").mouseout(function () {
            $("#showPwd2 i").attr('class', 'far fa-eye-slash');
            $("#oldPwd2").attr('type', 'password');
        });
        $("#showPwd3").mouseover(function () {
            $("#showPwd3 i").attr('class', 'far fa-eye');
            $("#newPwd").attr('type', 'text');
        });
        $("#showPwd3").mouseout(function () {
            $("#showPwd3 i").attr('class', 'far fa-eye-slash');
            $("#newPwd").attr('type', 'password');
        });
    </script>
</body>
</html>
