using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    public int count;
    public string columnName;
    public string searchStr = "";
    //页面加载时统计符合搜索条件的新闻数量，并将新闻列表显示出来
    protected void Page_Load(object sender, EventArgs e)
    {
        count = SqlHelper.excuteInt("select COUNT(c_id) from t_column");
        columnName = News.getColumnName();

        if (Request.QueryString["str"] != null)
        {
            searchStr = Request.QueryString["str"].ToString();
            string searchStr1 = "%" + searchStr + "%";
            string searchStr2 = "'%" + searchStr + "%'";
            string sqlString = "select count(*) from t_news where n_contents like '" + searchStr1 + "'or n_title like " + searchStr2;
            int searchCount = SqlHelper.excuteInt(sqlString);
            lbSearchCount.Text = "共查询到" + searchCount + "条与'" + searchStr + "'相关的信息";
        }       
        gvSearchNews.DataSource = News.getSearchNews(searchStr);
        gvSearchNews.DataBind();
    }
//搜索按钮点击后跳转
protected void searchBtn_Click(object sender, EventArgs e)
{
    string searchStr = searchText.Text;
    Response.Redirect("search.aspx?str=" + searchStr);
}


    protected void gvSearchNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSearchNews.PageIndex = e.NewPageIndex;
        gvSearchNews.DataSource = News.getSearchNews(searchStr);
        gvSearchNews.DataBind();
    }
}