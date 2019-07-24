 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/style.css?t=16125" rel="stylesheet" />
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
            <div id="box1">
                <div id="picNews">
			            <a href="#" id="link1">
				            <img src="#" id="img1"/>
				            <img src="#" id="img2"/>
			            </a>
                        <div id="tsBox">
                            <div id="txt"><a href="#" id="link2"></a></div>
			                <div id="squareBox">
				                <ul id="square"></ul>
			                </div>
                        </div>			            
                </div>
                <div id="divNews">
                    <div id="column1">
                        <asp:GridView ID="gvColumn1" runat="server" AutoGenerateColumns="False" ShowHeader="False" CssClass="columnTitle">
                            <Columns>
                                <asp:BoundField DataField="c_name">
                                <ItemStyle Font-Bold="False" Width="390px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="contents">

                        <asp:GridView ID="gvContents1" runat="server" AutoGenerateColumns="False" ShowHeader="False" Height="180px" OnRowDataBound="gvContents1_RowDataBound" >
                            <Columns>
                                <asp:HyperLinkField DataNavigateUrlFormatString="shownews.aspx?id={0}" DataTextField="n_title" DataNavigateUrlFields="n_id" Target="_blank">
                                <ControlStyle Font-Overline="False" Font-Underline="False" ForeColor="#0066FF" />
                                <ItemStyle Width="300px" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="addTime" DataFormatString="{0:[yy-MM-dd]}">
                                <ItemStyle Width="90px" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle Wrap="False" />
                        </asp:GridView>

                    </div>
                    <div id="divNews-pic">
                        <span>立本求真</span>
                        <span>日新致远</span>
                    </div>     
                </div>
            </div>
        </div>
        <div class="split "></div>
        <div id="downHalf">
            <div id="box2">
            <div id="divLeft">
                <div id="column2">
                
                    <asp:GridView ID="gvColumn2" runat="server" AutoGenerateColumns="False" ShowHeader="False" CssClass="columnTitle">
                        <Columns>
                            <asp:BoundField DataField="c_name" >
                            <ItemStyle Width="320px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                
                </div>
                <div class="contents">

                    <asp:GridView ID="gvcontents2" runat="server" AutoGenerateColumns="False" Height="150px" ShowHeader="False" OnRowDataBound="gvcontents2_RowDataBound">
                        <Columns>
                            <asp:HyperLinkField DataTextField="n_title" DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="shownews.aspx?id={0}" Target="_blank">
                            <ControlStyle Font-Overline="False" Font-Underline="False" ForeColor="#3366FF" />
                            <ItemStyle Width="240px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="addTime" DataFormatString="{0:yy-MM-dd}">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
            <div id="divMiddle">
                <div id="column3">               
                    <asp:GridView ID="gvColumn3" runat="server" AutoGenerateColumns="False" ShowHeader="False" CssClass="columnTitle">
                        <Columns>
                            <asp:BoundField DataField="c_name" >
                            <ItemStyle Width="320px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                
                </div>
                <div class="contents">

                    <asp:GridView ID="gvcontents3" runat="server" AutoGenerateColumns="False" Height="150px" ShowHeader="False" OnRowDataBound="gvcontents3_RowDataBound">
                        <Columns>
                            <asp:HyperLinkField DataTextField="n_title" DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="shownews.aspx?id={0}" Target="_blank">
                            <ControlStyle Font-Overline="False" Font-Underline="False" ForeColor="#3366FF" />
                            <ItemStyle Width="240px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="addTime" DataFormatString="{0:yy-MM-dd}">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
            <div id="divRight">
                <div id="column4">
                
                    <asp:GridView ID="gvColumn4" runat="server" AutoGenerateColumns="False" ShowHeader="False" CssClass="columnTitle">
                        <Columns>
                            <asp:BoundField DataField="c_name" >
                            <ItemStyle Width="320px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                
                </div>  
                    <div class="contents">

                        <asp:GridView ID="gvcontents4" runat="server" AutoGenerateColumns="False" Height="150px" ShowHeader="False" OnRowDataBound="gvcontents4_RowDataBound">
                            <Columns>
                                <asp:HyperLinkField DataTextField="n_title" DataNavigateUrlFields="n_id" DataNavigateUrlFormatString="shownews.aspx?id={0}">
                                <ControlStyle Font-Overline="False" Font-Underline="False" ForeColor="#3366FF" />
                                <ItemStyle Width="240px" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="addTime" DataFormatString="{0:yy-MM-dd}">
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
            <div class="split "></div>
            <div id="divLinks">
                <div id="scrollBox">
			        <div id="left">
				        <i class="fas fa-chevron-circle-left"></i>
			        </div>
			        <div id="scrollImg">
				        <ul id="pic">
                            <li><a href="http://www.jiangsugqt.org/"><img src="images/link1.png"/></a></li>
                            <li><a href="http://qnzs.youth.cn/"><img src="images/link2.png"/></a></li>
                            <li><a href="http://jyt.jiangsu.gov.cn/"><img src="images/link3.png"/></a></li>
                            <li><a href="http://www.ccyl.org.cn/"><img src="images/link4.png"/></a></li>
                            <li><a href="http://www.edu.cn/"><img src="images/link5.png"/></a></li>
                            <li><a href="http://www.jiangsugqt.org/"><img src="images/link1.png"/></a></li>
                            <li><a href="http://qnzs.youth.cn/"><img src="images/link2.png"/></a></li>
                            <li><a href="http://jyt.jiangsu.gov.cn/"><img src="images/link3.png"/></a></li>
                            <li><a href="http://www.ccyl.org.cn/"><img src="images/link4.png"/></a></li>
                            <li><a href="http://www.edu.cn/"><img src="images/link5.png"/></a></li>
				        </ul>
			        </div>
			        <div id="right">
				        <i class="fas fa-chevron-circle-right"></i>
			        </div>
		        </div>
            </div>
            <div class="split "></div>
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
            //菜单栏动态添加
            var columnName='<%=columnName%>';
            var cName = columnName.split(",");
            for(var i=0;i<<%=count%>;i++){
                var x=i+1;
                var href_str="showlist.aspx?id="+x;
                 $("#UL").append('<li><a href="'+href_str+'"></a></li>');
                 $("ul li a").eq(i+1).text(cName[i]);                
            }
            //搜索框默认提示
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
            //JQuery实现轮播图
            var p = '<%=pics %>';
            var t = '<%=texts %>';
            var l = '<%=links %>';
            var pics = p.split(",");
            var texts = t.split(",");
            var links = l.split(",");
            for (var i = 0; i < pics.length; i++)
                $("#square").append("<li>■</li>");
            var k = 0;
            $("#img2").attr("src", pics[k]);
            showImg();
            function showImg() {
                $("#txt>a").text(texts[k]);
                $("#square>li").css("color", "#fff");
                $("#square>li").eq(k).css("color", "#fe5f55");
                $("#link1").attr("href", links[k]);
                $("#link2").attr("href", links[k]);
                $("#img1").attr("src", $("#img2").attr("src"));
                $("#img2").attr("src", pics[k]).css("display", "none");
                $("#img2").fadeIn(1000);
            }
            function autoPlay() {
                k++;
                k %= pics.length;
                showImg();
            }
            var timer = setInterval(autoPlay, 3000);
            $("#img2").mouseover(function () {
                clearInterval(timer);
            });
            $("#img2").mouseout(function () {
                timer = setInterval(autoPlay, 3000);
            });
            $("#square>li").mouseover(function () {
                k = $(this).index();
                showImg();
                clearInterval(timer);
            });
            $("#square>li").mouseout(function () {
                timer = setInterval(autoPlay, 3000);
            });
            //栏目标题颜色
            function Color() {
                var r = Math.floor(Math.random() * 255);
                var g = Math.floor(Math.random() * 255);
                var b = Math.floor(Math.random() * 255);
                var color = 'rgba(' + r + ',' + g + ',' + b + ',0.8)';
                return color;
            }
            var obj = document.getElementsByClassName("columnTitle");
            for (i = 0; i < obj.length; i++) {
                obj[i].style.color = Color();
            }
            //友情链接滚动
            var $pic = $('#pic');
            var $left = $('#left');
            var $right = $('#right');
            var total = 5;//5张图
            var offset = 1;//每次移动的像素位数
            var interval=10;//图片间距
            var timeInterval = 30;//时间间隔				
            var locate;//举例左边位置
            var direction = -offset;//正为右，负为左				
            //for(var j=0;j<2;j++)
            //    for(var i=0;i<total;i++){
            //        $pic.append('<li><a></a></li>');
            //    }
            $("#pic li").css("margin-right",interval+"px");
            $pic.width(($pic.children('li').width()+interval)*2*total);
	
            var $pic_len = $pic.width();//横幅总长度
            $pic.css('left','0px');//横幅初始位置
				
            var timer2 = setInterval(move,timeInterval);
				
            function move(){
                locate = $pic.position().left;//记录横幅位置
					
					
                if(locate<=-$pic_len/2&&direction<0)
                    locate = 0
                else if(locate>=0&&direction>0)
                    locate = -$pic_len/2;
                $pic.css('left',(locate+direction)+'px');//移动
            }
				
            $("#left i").on('click',function(){
                direction = -offset;
            });
            $("#left i").mouseover(function(){
                $("#left i").css("color","#333");
            });
            $("#left i").mouseout(function(){
                $("#left i").css("color","#fff");
            });
				
			$("#right i").on('click',function(){
                direction = offset;
            });
			$("#right i").mouseover(function(){
			    $("#right i").css("color","#333");
			});
			$("#right i").mouseout(function(){
			    $("#right i").css("color","#fff");
			});
            
            $pic.on('mouseover',function(){
                clearInterval(timer2);
            });
				
            $pic.on('mouseout',function(){
                timer2 = setInterval(move,timeInterval);
            });
            //页脚翻转
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
