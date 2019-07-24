<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showlist.aspx.cs" Inherits="showlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/style-showlist.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/84d4b3c112.js"></script>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <div id="upHalf">
            <div id="header"> 
                <div>
                    <img src="images/logo.png" width="250px"/>
                </div>
                <div id="webTitle">
                    计算机科学与工程学院    
                </div>
                <div id="en_webTitle">College of Computer Science and Engineering</div>
            </div>
            <div class="split "></div>
            <div id="menuebox">
                <div id="menue">
                    <div id="nagivation">
                        <ul id="UL">
                         <li><a id="first" href="index.aspx" target="_self">学院首页</a></li>
                        </ul>
                    </div>
                    <div id="search">
                        <div id="searchBox">
                            <asp:TextBox ID="searchText" runat="server" CssClass="SearchText" AUTOCOMPLETE="OFF">在这里输入搜索内容...</asp:TextBox>
                            <asp:Button ID="searchBtn" runat="server" Text="搜索" CssClass="SearchBtn" OnClick="searchBtn_Click"/>
                        </div>                
                    </div>
                    
                </div>
            </div>
            <div class="split "></div>
            <div id="Box">
                <div id="divHot">
                    <div id="hotTitle"><span>学院热点</span><span>点击数</span></div>
                    <asp:GridView ID="gvHotNews" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                        <AlternatingRowStyle Wrap="True" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="shownews.aspx?id={0}" DataTextField="n_title">
                            <ItemStyle Width="260px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="hitCount">
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle Wrap="True" />
                        <RowStyle Wrap="False" />
                    </asp:GridView>
                </div>
                <div id="newsList">
                    <div id="columnTitle">
                        <span>栏目标题</span>
                        <span>点击数</span>
                        <span>发布时间</span>
                    </div>
                    <asp:GridView ID="gvNewsList" runat="server" AutoGenerateColumns="False" ShowHeader="False" AllowPaging="True" OnPageIndexChanging="gvNewsList_PageIndexChanging">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="shownews.aspx?id={0}" DataTextField="n_title">
                            <ItemStyle Width="450px" Wrap="True" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="hitCount">
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="addTime" DataFormatString="{0:yy-MM-dd}">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle CssClass="cssPager" />
                        <RowStyle Height="40px" />
                    </asp:GridView>
                </div>
            </div>   
        </div>
        <div class="split "></div>
        <div id="downHalf">                     
            <div class="split ">
            </div>
            <div class="footer">
                <div id="front">
                    <div id="flogo"><img src="images/logoFooter.png"/></div>
                    <div id="relativeInfo">
                        常熟理工学院计算机科学与工程学院版权所有<br />
                        Copyright (C) 2019 cslg.edu.cn. All rights resterved<br />
                        地址：江苏省常熟市湖山路99号东南校区
                        邮编：215500
                    </div>
                    <div id="icon">
                        <div id="icon1" title="官方微信"><i class="fab fa-weixin"></i></div>
                        <div id="icon2" title="掌上理工"><i class="fas fa-mobile-alt"></i></div>
                        <div id="fchange" title="后台管理"><i class="fas fa-exchange-alt"></i></div>
                    </div>
                    <div id="QRcode1"></div>
                    <div id="QRcode2"></div>
                </div>
                <div id="back">
                    <div id="bchange" title="返回页脚"><i class="fas fa-exchange-alt"></i></div>
                    <a href="admin/index.aspx">[后台管理]</a>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script>
        $(function () {
            $("#nagivation ul :first-child>a").css("color","#333");
            var columnName='<%=columnName%>';
            var cName = columnName.split(",");
            for(var i=0;i<<%=count%>;i++){
                var x=i+1;
                var href_str="showlist.aspx?id="+x;
                 $("#UL").append('<li><a href="'+href_str+'"></a></li>');
                 $("ul li a").eq(i+1).text(cName[i]);                
            }
            var id=<%=strid%>;
            $("#columnTitle span:nth-child(1)").text(cName[id-1]);
            $("ul li a").eq(id).css("color","#f34573");                
            function setDefaultText() {
                var sT = document.getElementById("searchText");
                sT.onfocus = function () {
                    
                    if (sT.value == "在这里输入搜索内容...")  //聚焦时，如果文本框为初始值，则清空
                        sT.value = "";
                }
                sT.onblur = function () {
                    if (sT.value == "")  //失焦时，如果文本框为空，则置默认值
                        sT.value = "在这里输入搜索内容...";
                }
            }
            setDefaultText();
           
            $("#fchange").click(function () {
                    $("#front").css("transform", "perspective(600px) rotateX(-180deg)");
                    $("#back").css("transform", "perspective(600px) rotateX(0deg)");

            });
            $("#bchange").click(function () { 
                $("#front").css("transform", "perspective(600px) rotateX(0deg)");
                $("#back").css("transform", "perspective(600px) rotateX(180deg)");
            });
            $("#icon1").mouseover(function () {
                $("#QRcode1").animate({ opacity: 1 }, 500);
            });
            $("#icon1").mouseout(function () {
                $("#QRcode1").animate({ opacity: 0 }, 500);
            });
            $("#icon2").mouseover(function () {
                $("#QRcode2").animate({ opacity: 1 }, 500);
            });
            $("#icon2").mouseout(function () {
                $("#QRcode2 ").animate({ opacity: 0 }, 500);
            });
        });
    </script>
</body>
</html>
