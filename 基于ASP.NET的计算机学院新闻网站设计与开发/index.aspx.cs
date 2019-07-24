using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    public int count;
    public string columnName;
    public string pics;
    public string texts;
    public string links;
    protected void Page_Load(object sender, EventArgs e)
    {
        count = SqlHelper.excuteInt("select COUNT(c_id) from t_column");
        columnName = News.getColumnName();

        //从数据库拿轮播图图片信息
        News.getPics(ref pics, ref texts, ref links);
        gvColumn1.DataSource = SqlHelper.excuteDataSet("select c_name from t_column where c_id=1");
        gvColumn1.DataBind();
        gvColumn2.DataSource = SqlHelper.excuteDataSet("select c_name from t_column where c_id=2");
        gvColumn2.DataBind();
        gvColumn3.DataSource = SqlHelper.excuteDataSet("select c_name from t_column where c_id=3");
        gvColumn3.DataBind();
        gvColumn4.DataSource = SqlHelper.excuteDataSet("select c_name from t_column where c_id=4");
        gvColumn4.DataBind();
        gvContents1.DataSource = SqlHelper.excuteDataSet("select top(5)* from t_news where c_id=1 order by addTime DESC");
        gvContents1.DataBind();
        gvcontents2.DataSource = SqlHelper.excuteDataSet("select top(5)* from t_news where c_id=2 order by addTime DESC");
        gvcontents2.DataBind();
        gvcontents3.DataSource = SqlHelper.excuteDataSet("select top(5)* from t_news where c_id=3 order by addTime DESC");
        gvcontents3.DataBind();
        gvcontents4.DataSource = SqlHelper.excuteDataSet("select top(5)* from t_news where c_id=4 order by addTime DESC");
        gvcontents4.DataBind();
        
        
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        string searchStr = searchText.Text;
        Response.Redirect("search.aspx?str=" + searchStr);
    }
    protected void gvContents1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < gvColumn1.Rows.Count; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                //当鼠标移开时还原背景色 
                e.Row.Attributes["onmouseover"] = "_color=this.bgColor;this.bgColor='#DADDDF'";
                e.Row.Attributes["onmouseout"] = "this.bgColor=_color";
            }

        }
    }

    protected void gvcontents2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "_color=this.bgColor;this.bgColor='#DADDDF';";
            e.Row.Attributes["onmouseout"] = "this.bgColor=_color;this.color=fcolor;";
        }
    }

    protected void gvcontents3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "_color=this.bgColor;this.bgColor='#DADDDF'";
            e.Row.Attributes["onmouseout"] = "this.bgColor=_color";
        }
    }

    protected void gvcontents4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "_color=this.bgColor;this.bgColor='#DADDDF'";
            e.Row.Attributes["onmouseout"] = "this.bgColor=_color";
        }
    }

}
