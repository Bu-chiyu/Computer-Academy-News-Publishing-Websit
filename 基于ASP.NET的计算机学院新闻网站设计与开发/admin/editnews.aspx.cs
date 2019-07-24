using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editnews : System.Web.UI.Page
{
    Users u;
    //修改新闻页面加载
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
                string id = Request.QueryString["id"].ToString();
                News n = News.getNewsById(id);
                tbTitle.Text = n.n_title;
                content1.Value = n.n_contents;
                tbImgUrl.Text = n.imgUrl;
                foreach (ListItem x in ddlColumn.Items)
                {
                    if (x.Value == n.c_id.ToString())
                        x.Selected = true;
                }
            }
        }       
    }
    //编辑新闻按钮事件
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        News n = new News();
        n.n_title = tbTitle.Text;
        n.n_contents = content1.Value;
        n.u_id = u.uid;
        n.c_id = Convert.ToInt32(ddlColumn.SelectedValue);
        n.n_id = Convert.ToInt32(Request.QueryString["id"].ToString());
        n.imgUrl = tbImgUrl.Text;
        if (News.editNews(n) == true)
            Response.Write("<script>alert('修改成功！')</script>");
        else
            Response.Write("<script>alert('修改失败！')</script>");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manager.aspx");
    }
}