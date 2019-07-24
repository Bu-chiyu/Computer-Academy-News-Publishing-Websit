<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addnews.aspx.cs" Inherits="admin_addnews" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>发布信息</title>
    <link href="../css/style-addnews.css" rel="stylesheet" />
    <link rel="stylesheet?t=16125" href="kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('#content1', {
			    cssPath: 'kindeditor/plugins/code/prettify.css',
			    uploadJson: 'kindeditor/upload_json.ashx',
			    fileManagerJson: 'kindeditor/file_manager_json.ashx',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="example" runat="server">
    <div id="title">新闻发布</div>
    <div id="box">
        <div id="head">
            <div style="width:1000px;margin:10px auto;">
                <span>标题：</span><asp:TextBox ID="tbTitle" runat="server" AUTOCOMPLETE="OFF" Width="350px"></asp:TextBox>
            </div>
            <div style="width:1000px;margin:10px auto;">
                <span>主页图片：</span><asp:TextBox ID="tbImgUrl" runat="server" Width="350px" AUTOCOMPLETE="OFF"></asp:TextBox><br />
            </div>
            <div style="width:1000px;margin:10px auto;">
                <span> 栏目：</span><asp:DropDownList ID="ddlColumn" runat="server"></asp:DropDownList>
            </div>
        </div>        
        <div style="width:1000px;margin:10px auto;">
            <textarea id="content1" cols="100" rows="8" style="width:1000px;height:540px;visibility:hidden;" runat="server"></textarea>
            <br />
            <div id="divBtn">
                <asp:Button ID="submit" runat="server" Text="提交内容" OnClick="submit_Click" CssClass="btnCss"/>
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="返回后台" CssClass="btnCss"/>
            </div>           
        </div>
    
    </div>
    </form>
</body>
</html>
