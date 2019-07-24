using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addnews : System.Web.UI.Page
{
    Users u;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Write("<script>alert('您尚未登录！')</script>");
            Response.Redirect("index.aspx");
        }
        else
        {
            u = (Users)Session["User"];
        }
        if (!this.IsPostBack)
        {
            ddlColumn.Items.Clear();
            ddlColumn.DataSource = News.getColumnList(u.uid);
            ddlColumn.DataTextField = "c_name";
            ddlColumn.DataValueField = "c_id";
            ddlColumn.DataBind();

            if (Request.QueryString["id"] != null)
            {
                Response.Write("<script>alert('发布成功！')</script>");
            }
        }      
    }
    //发布新闻
    protected void submit_Click(object sender, EventArgs e)
    {
        News n = new News();
        n.n_title = tbTitle.Text;
        n.n_contents = content1.Value;
        n.addTime = DateTime.Now;
        n.hitCount = 0;
        n.c_id = Convert.ToInt32(ddlColumn.SelectedValue);
        n.u_id = u.uid;
        n.imgUrl = tbImgUrl.Text;
        if (News.addNews(n)==true)
            Response.Redirect("addnews.aspx?id=1");
        else
            Response.Write("<script>alert('发布失败！')</script>");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manager.aspx");
    }
}