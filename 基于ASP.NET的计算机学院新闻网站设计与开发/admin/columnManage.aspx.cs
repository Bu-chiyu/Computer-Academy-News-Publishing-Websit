using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_columnManage : System.Web.UI.Page
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
            ddlDelCname.Items.Clear();
            ddlDelCname.DataSource = News.getColumnList(u.uid);
            ddlDelCname.DataTextField = "c_name";
            ddlDelCname.DataValueField = "c_id";
            ddlDelCname.DataBind();

            ddlAddUname.Items.Clear();
            ddlAddUname.DataSource = Users.getUsersList();
            ddlAddUname.DataTextField = "u_name";
            ddlAddUname.DataValueField = "u_id";
            ddlAddUname.DataBind();

            ddlEditCname.Items.Clear();
            ddlEditCname.DataSource = News.getColumnList(u.uid);
            ddlEditCname.DataTextField = "c_name";
            ddlEditCname.DataValueField = "c_id";
            ddlEditCname.DataBind();

            ddlEditUname.Items.Clear();
            ddlEditUname.DataSource = Users.getUsersList();
            ddlEditUname.DataTextField = "u_name";
            ddlEditUname.DataValueField = "u_id";
            ddlEditUname.DataBind();
            //根据页面传来的参数，显示操作成功
            if (Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                switch (id)
                {
                    case 1: Response.Write("<script>alert('添加成功！')</script>"); break;
                    case 2: Response.Write("<script>alert('添加失败！')</script>"); break;
                    case 3: Response.Write("<script>alert('删除成功！')</script>"); break;
                    case 4: Response.Write("<script>alert('删除失败！')</script>"); break;
                    case 5: Response.Write("<script>alert('修改成功！')</script>"); break;
                    case 6: Response.Write("<script>alert('修改失败！')</script>"); break;
                };
            }

        }
    }
    //添加按钮点击事件
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Column c = new Column();
        c.c_name =tbColumnName.Text;
        c.u_id = Convert.ToInt32(ddlAddUname.SelectedValue);
        if (Column.addColumn(c) == true)
            Response.Redirect("columnManage.aspx?id=1");
        else
            Response.Redirect("columnManage.aspx?id=2");
    }
    //删除按钮点击事件
    protected void btnDel_Click(object sender, EventArgs e)
    {
        string id = ddlDelCname.SelectedValue;
        if (Column.delColumn(id) == true)
            Response.Redirect("columnManage.aspx?id=3");
        else
            Response.Redirect("columnManage.aspx?id=4");
    }
    //修改按钮点击事件
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Column c = new Column();
        c.c_id= ddlEditCname.SelectedValue;
        c.c_name = tbEidtCname.Text;
        c.u_id = Convert.ToInt32(ddlEditUname.SelectedValue);
        if (Column.editColumn(c) == true)
            Response.Redirect("columnManage.aspx?id=5");
        else
            Response.Redirect("columnManage.aspx?id=6");
    }
}