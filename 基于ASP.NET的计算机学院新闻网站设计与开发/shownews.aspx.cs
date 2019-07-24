using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shownews : System.Web.UI.Page
{
    public int count;
    public string columnName;
    protected void Page_Load(object sender, EventArgs e)
    {
        count = SqlHelper.excuteInt("select COUNT(c_id) from t_column");
        columnName = News.getColumnName();
        if (Request.QueryString["id"] != null)
        {
            string id = Request.QueryString["id"].ToString();
            News n = News.getNewsById(id);
            lbTitle.Text = n.n_title;
            News.addHitCount(id);
            lbAddTime.Text = "发布时间：" + n.addTime.ToString();
            lbAuthor.Text = "发布者：" + n.u_name;
            lbHitCount.Text = "点击次数：" + n.hitCount;
            lbContent.Text = "&nbsp;&nbsp;&nbsp;&nbsp;" + n.n_contents;

            
        }
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        string searchStr = searchText.Text;
        Response.Redirect("search.aspx?str=" + searchStr);
    }
}