<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="admin_manager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/style-manager.css?t=16125" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <div id="header">
            <div style="float:left;">
                <marquee direction="right" behavior="alternate" scrollamount="6" align="middle" width="780px" height="100px">
                    <%=welcomeText %>
                </marquee>
            </div>
            <div style="float:right;">
                <asp:Button ID="btnChangePwd" runat="server" Text="修改密码" OnClick="btnChangePwd_Click" CssClass="btnCss" />
                <asp:Button ID="btnExit" runat="server" Text="退出登录" OnClick="btnExit_Click" CssClass="btnCss"/>    
            </div>
        </div>
        <div class="split"></div>
        <div id="tools">
            <asp:Button ID="btnAddNews" runat="server" Text="发布信息" OnClick="btnAddNews_Click" CssClass="btnCss"/>
            <asp:Button ID="btnSortByHitcount1" runat="server" Text="点击数降序" OnClick="btnSortByHitcount_Click" CssClass="btnCss"/>
            <asp:Button ID="btnSortByHitcount2" runat="server" Text="点击数升序" OnClick="btnSortByHitcount2_Click" CssClass="btnCss"/>
            <asp:Button ID="btnSortByAddtime1" runat="server" Text="时间降序" OnClick="btnSortByAddtime_Click" CssClass="btnCss"/>
            <asp:Button ID="btnSortByAddtime2" runat="server" Text="时间升序" OnClick="btnSortByAddtime2_Click" CssClass="btnCss"/>
            <asp:Button ID="btnColumnManage" runat="server" Text="栏目管理" OnClick="btnColumnManage_Click" CssClass="btnCss"/>
            <asp:Button ID="btnUserManage" runat="server" Text="用户管理" OnClick="btnUserManage_Click" CssClass="btnCss"/>
            <div>
                <asp:DropDownList ID="ddlColumnList" runat="server"></asp:DropDownList>
                <asp:Button ID="btnSelect" runat="server" Text="筛选" OnClick="btnSelect_Click" CssClass="btnCss"/>
            </div>  
        </div>
        <div class="split"></div>
        <div id="main">
            <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" Width="1000px" AllowPaging="True" OnPageIndexChanging="gvNews_PageIndexChanging" RowStyle-Height="20px">
                <Columns>
                    <asp:BoundField DataField="n_id" HeaderText="编号">
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="../shownews.aspx?id={0}" DataTextField="n_title" HeaderText="标题" Target="_blank" />
                    <asp:BoundField DataField="u_name" HeaderText="发布者">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="c_name" HeaderText="栏目">
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="hitCount" HeaderText="点击数">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="addTime" HeaderText="发布时间">
                    <ItemStyle HorizontalAlign="Center" Width="160px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEditNews" runat="server" OnClick="lbtnEditNews_Click">编辑</asp:LinkButton>
                            <asp:LinkButton ID="lbtnDelNews" runat="server" OnClick="lbtnDelNews_Click">删除</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="cssPager" />
                <RowStyle Height="40px" />
            </asp:GridView>
        </div>
        <div class="split"></div>
        <div id="footer">
            <div id="flogo"><img src="../images/logoFooter.png" /></div>
            <div id="relativeInfo">
                常熟理工学院计算机科学与工程学院版权所有<br />
                Copyright (C) 2019 cslg.edu.cn. All rights resterved<br />
                地址：江苏省常熟市湖山路99号东南校区
                邮编：215500
            </div>
            <div id="contact">
                <span>联系本站管理员</span>
                <div><i class="fab fa-qq"></i>:291011795</div>
                <div><i class="fas fa-envelope"></i>:saintwf@qq.com</div>
                <div><i class="fas fa-phone-alt"></i>:18852971923</div>
            </div>
        </div>
    </div>
    </form>
    <script>
        $(function () {
            var name = '<%=str_name%>';
            if(name!="admin")
            {
                $("#btnColumnManage").attr("disabled", "true");                
                $("#btnColumnManage").hide();
                $("#btnUserManage").attr("disabled", "true");
                $("#btnUserManage").hide();
                $("#tools div").attr("disabled", "true");
                $("#tools div").hide();
            }
        });
    </script>
</body>
</html>
