<%@ Page Language="C#" AutoEventWireup="true" CodeFile="columnManage.aspx.cs" Inherits="admin_columnManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/style-columnManage.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <div id="back" title="返回管理后台"><a href="manager.aspx"><i class="far fa-times-circle"></i></a></div>
        <div id="manageBox">
            <div id="title">栏目管理</div>
            <div id="columnAdd">
            <div class="decoration">添加</div>
            <div>栏目名称:<asp:TextBox ID="tbColumnName" runat="server" CssClass="textBox" AUTOCOMPLETE="OFF"></asp:TextBox></div>    
            <div>栏目管理员:<asp:DropDownList ID="ddlAddUname" runat="server"></asp:DropDownList></div> 
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="确认添加" CssClass="btnCss" />
            </div>
            <div id="columnDel">
                <div class="decoration">删除</div>
                <div>选择要删除的栏目:<asp:DropDownList ID="ddlDelCname" runat="server"></asp:DropDownList></div> 
                <asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="确认删除" CssClass="btnCss" />
            </div>
            <div id="columnEdit">
                <div class="decoration">修改</div>
                <div>选择要修改的栏目:<asp:DropDownList ID="ddlEditCname" runat="server"></asp:DropDownList></div>
                <div>新栏目名称:<asp:TextBox ID="tbEidtCname" runat="server" CssClass="textBox" AUTOCOMPLETE="OFF"></asp:TextBox></div>
                <div>新栏目管理员:<asp:DropDownList ID="ddlEditUname" runat="server"></asp:DropDownList></div> 
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="确认修改" CssClass="btnCss" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
