using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showlist : System.Web.UI.Page
{
    public int count;
    public string columnName;
    public string strid;
    protected void Page_Load(object sender, EventArgs e)
    {
        count = SqlHelper.excuteInt("select COUNT(c_id) from t_column");
        columnName = News.getColumnName();
            //获取热点新闻，绑定到GridView上
            gvHotNews.DataSource = News.getHotNews();
            gvHotNews.DataBind();

        if (Request.QueryString["id"] != null)
        {
            string id = Request.QueryString["id"].ToString();
            strid = id;
            gvNewsList.DataSource = News.getColumnNews(id);
            gvNewsList.DataBind();
        }
    }

    protected void gvNewsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNewsList.PageIndex = e.NewPageIndex;
        gvNewsList.DataSource = News.getColumnNews(strid);
        gvNewsList.DataBind();
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        string searchStr = searchText.Text;
        Response.Redirect("search.aspx?str=" + searchStr);
    }
}