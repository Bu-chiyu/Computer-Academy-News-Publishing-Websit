using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_changePwd : System.Web.UI.Page
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
    }
    //修改密码事件
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        if (oldPwd1.Text.Trim() == "")
        {
            Response.Write("<script>alert('请输入原密码！')</script>");
        }
        else
        {
            if (oldPwd2.Text.Trim() == "")
            {
                Response.Write("<script>alert('请再次输入原密码！')</script>");
            }
            else
            {
                if (oldPwd1.Text != oldPwd2.Text)
                {
                    Response.Write("<script>alert('两次输入的原密码不一致！')</script>");
                    Response.Redirect("changePwd.aspx");
                }
                else
                {
                    if (newPwd.Text.Trim() == "")
                    {
                        Response.Write("<script>alert('新密码不能为空!')</script>");
                    }
                    else
                    {
                        string str1 = oldPwd1.Text;
                        string str2 = newPwd.Text;
                        string id = u.uid.ToString();
                        if (News.changePwd(id,str1,str2) == true)
                        {
                            Response.Redirect("index.aspx");
                        }
                        else
                            Response.Write("<script>alert('修改失败!')</script>");
                    }
                }
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manager.aspx");
    }
}