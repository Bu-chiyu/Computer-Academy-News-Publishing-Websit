<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersManage.aspx.cs" Inherits="admin_usersManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/style-usersManage.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <div id="back" title="返回管理后台"><a href="manager.aspx"><i class="far fa-times-circle"></i></a></div>
        <div id="manageBox">
            <div id="title">用户管理</div>
            <div id="userAdd">
                <div class="decoration">添加</div>
                <div>用户名：<asp:TextBox ID="tbAddUname" runat="server" AUTOCOMPLETE="OFF" CssClass="textBox" ></asp:TextBox></div>
                <div>密码：<asp:TextBox ID="tbAddPwd" runat="server" AUTOCOMPLETE="OFF" CssClass="textBox"></asp:TextBox></div>
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="确认添加" CssClass="btnCss"/>              
            </div>
            <div id="userDel">
                <div class="decoration">删除</div>
                <div>选择要删除的用户：<asp:DropDownList ID="ddlDelUname" runat="server"></asp:DropDownList></div>                 
                <asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="确认删除" CssClass="btnCss" />              
            </div>
            <div id="userEdit">
                <div class="decoration">修改</div>
                <div>选择要修改的用户：<asp:DropDownList ID="ddlEditUname" runat="server"></asp:DropDownList></div> 
                <div>新用户名：<asp:TextBox ID="tbEditUname" runat="server" AUTOCOMPLETE="OFF" CssClass="textBox"></asp:TextBox></div> 
                <div>新密码：<asp:TextBox ID="tbEditPwd" runat="server" AUTOCOMPLETE="OFF" CssClass="textBox"></asp:TextBox></div> 
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="确认修改" CssClass="btnCss"/>
            </div>
        </div>
    </div>
    </form>   
</body>
</html>
