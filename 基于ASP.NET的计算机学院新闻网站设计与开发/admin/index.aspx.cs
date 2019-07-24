using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_index : System.Web.UI.Page
{
    public string strIde="";
    protected void Page_Load(object sender, EventArgs e)
    {
         
    }
    //登录按钮点击事件
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        if (userName.Text.Trim() == "" || userPwd.Text.Trim() == "")
            Response.Write("<script>alert('用户名或密码不能为空！')</script>");
        else
        {
            string uName = userName.Text.Replace("'", "");
            string uPwd = userPwd.Text.Replace("'", "");
            string sqlString = "select count(*) from t_user where u_name='" + uName.Trim()+ "'and u_pwd='" + uPwd.Trim() + "'";
            if(SqlHelper.excuteInt(sqlString)==1)
            {
                Users u = new Users();
                u.userName = userName.Text;
                u.uid = Users.getUidByName(u.userName);
                Session["User"] = u; 
                Response.Redirect("manager.aspx");
            }
            else
            {
                Response.Write("<script>alert('用户名或密码不正确！')</script>");
                strIde = "LF";
            }
        }
    }
}