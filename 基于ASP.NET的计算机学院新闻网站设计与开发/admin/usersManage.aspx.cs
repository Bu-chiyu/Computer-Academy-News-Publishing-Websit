using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class admin_usersManage : System.Web.UI.Page
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

            ddlDelUname.Items.Clear();
            ddlDelUname.DataSource = Users.getUsersList2();
            ddlDelUname.DataTextField = "u_name";
            ddlDelUname.DataValueField = "u_id";
            ddlDelUname.DataBind();

            ddlEditUname.Items.Clear();
            ddlEditUname.DataSource = Users.getUsersList();
            ddlEditUname.DataTextField = "u_name";
            ddlEditUname.DataValueField = "u_id";
            ddlEditUname.DataBind();
            //用户管理操作是否成功的提示
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
    //添加用户
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string usersName = Users.getUserName();
        string[] unameArray = usersName.Split(',');
        bool exists = ((IList)unameArray).Contains(tbAddUname.Text);
        if (exists)
            Response.Write("<script>alert('用户已存在！')</script>");
        else
        {
            Users u = new Users();
            u.userName = tbAddUname.Text;
            u.passWord = tbAddPwd.Text;
            if (Users.addUser(u) == true)
                Response.Redirect("usersManage.aspx?id=1");
            else
                Response.Redirect("usersManage.aspx?id=2");
        }   
    }
    //删除用户按钮点击事件
    protected void btnDel_Click(object sender, EventArgs e)
    {
        string id = ddlDelUname.SelectedValue;
        if (Users.delUser(id) == true)
            Response.Redirect("usersManage.aspx?id=3");
        else
            Response.Redirect("usersManage.aspx?id=4");
    }
    //修改用户按钮点击事件
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        u.userName = tbEditUname.Text;
        u.passWord = tbEditPwd.Text;
        u.uid= Convert.ToInt32(ddlEditUname.SelectedValue);
        if (Users.editUser(u) == true)
            Response.Redirect("usersManage.aspx?id=5");
        else
            Response.Redirect("usersManage.aspx?id=6");
    }
}