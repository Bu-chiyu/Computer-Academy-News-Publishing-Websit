using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_manager : System.Web.UI.Page
{
    Users u;
    public string str_name;
    public string name;
    public string welcomeText;
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
            //lbUser.Text = "管理员：" + u.userName+"，欢迎您！";
            welcomeText= "管理员：" + u.userName + "，欢迎您！"; 
            str_name = u.userName;
        }
        //将从数据库中取出
        gvNews.DataSource = News.getNewsList(u.userName);
        gvNews.DataBind();
        if (!this.IsPostBack)
        {
            //将数据绑定到下拉框中
            ddlColumnList.Items.Clear();
            ddlColumnList.DataSource = News.getColumnList(u.uid);
            ddlColumnList.DataTextField = "c_name";
            ddlColumnList.DataValueField = "c_id";
            ddlColumnList.DataBind();

            if (Request.QueryString["name"] != null)
            {
                name = Request.QueryString["name"].ToString();
                gvNews.DataSource = News.getNewsListByCid(name);
                gvNews.DataBind();
                foreach (ListItem x in ddlColumnList.Items)
                {
                    if (x.Text == name.ToString())
                        x.Selected = true;
                }
            }
            if (Request.QueryString["uname"] != null)
            {
                string sort = Request.QueryString["uname"].ToString();
                gvNews.DataSource = News.getSortNewsList(sort);
                gvNews.DataBind();
            }
        }

    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("changePwd.aspx");
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("index.aspx");
    }
    //点击数降序排序
    protected void btnSortByHitcount_Click(object sender, EventArgs e)
    {
        if(u.userName=="admin")
            Response.Redirect("manager.aspx?uname=admin1");
        else if (u.userName == "jack")
            Response.Redirect("manager.aspx?uname=jack1");
        else if (u.userName == "lisa")
            Response.Redirect("manager.aspx?uname=lisa1");
        else if (u.userName == "lucy")
            Response.Redirect("manager.aspx?uname=lucy1");
    }
    //点击数生序排序
    protected void btnSortByHitcount2_Click(object sender, EventArgs e)
    {
        if (u.userName == "admin")
            Response.Redirect("manager.aspx?uname=admin2");
        else if (u.userName == "jack")
            Response.Redirect("manager.aspx?uname=jack2");
        else if (u.userName == "lisa")
            Response.Redirect("manager.aspx?uname=lisa2");
        else if (u.userName == "lucy")
            Response.Redirect("manager.aspx?uname=lucy2");
    }
    //发布时间降序排序
    protected void btnSortByAddtime_Click(object sender, EventArgs e)
    {
        if (u.userName == "admin")
            Response.Redirect("manager.aspx?uname=admin3");
        else if (u.userName == "jack")
            Response.Redirect("manager.aspx?uname=jack3");
        else if (u.userName == "lisa")
            Response.Redirect("manager.aspx?uname=lisa3");
        else if (u.userName == "lucy")
            Response.Redirect("manager.aspx?uname=lucy3");
    }
    //发布时间生序排序
    protected void btnSortByAddtime2_Click(object sender, EventArgs e)
    {
        if (u.userName == "admin")
            Response.Redirect("manager.aspx?uname=admin4");
        else if (u.userName == "jack")
            Response.Redirect("manager.aspx?uname=jack4");
        else if (u.userName == "lisa")
            Response.Redirect("manager.aspx?uname=lisa4");
        else if (u.userName == "lucy")
            Response.Redirect("manager.aspx?uname=lucy4");
    }
    //晒选栏目
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        string c_name = ddlColumnList.SelectedItem.Text;
        Response.Redirect("manager.aspx?name="+c_name);
    }

    //发布新闻
    protected void btnAddNews_Click(object sender, EventArgs e)
    {
        Response.Redirect("addnews.aspx");
    }
    //编辑新闻
    protected void lbtnEditNews_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id=gvr.Cells[0].Text;
        Response.Redirect("editnews.aspx?id=" + id);
    }
    //删除新闻
    protected void lbtnDelNews_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id = gvr.Cells[0].Text;
        if (News.delNews(id) == true)
            Response.Write("<script>alert('删除成功！')</script>");
        else
            Response.Write("<script>alert('删除失败！')</script>");
    }
    protected void gvNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNews.PageIndex = e.NewPageIndex;
        gvNews.DataSource =  News.getNewsList(u.userName);
        gvNews.DataBind();
    }

    protected void btnColumnManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("columnManage.aspx");
    }

    protected void btnUserManage_Click(object sender, EventArgs e)
    {
        Response.Redirect("usersManage.aspx");
    }

}