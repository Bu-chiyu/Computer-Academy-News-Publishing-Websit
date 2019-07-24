using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// User 的摘要说明
/// </summary>
public class Users
{
    public Users()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public int uid;
    public string userName;
    public string passWord;

    public static int getUidByName(string userName)
    {
        string sqlString = "select u_id from t_user where u_name='" + userName + "'";
        SqlConnection connection = SqlHelper.createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        int uid = Convert.ToInt32(cmd.ExecuteScalar());//执行sql语句并返回第一行第一列，即u_id；
        connection.Close();
        return uid;
    }
    //向数据库中添加新用户数据
    public static bool addUser(Users u)
    {
        string sqlString = "insert into t_user(u_name,u_pwd) values('" + u.userName + "','" + u.passWord + "')";
        return SqlHelper.excuteBool(sqlString);
    }
    //根据用户id从数据库中删除对应数据
    public static bool delUser(string id)
    {
        string sqlString = "delete from t_user where u_id=" + id;
        return SqlHelper.excuteBool(sqlString);
    }
    //更新数据库中用户的用户名和密码
    public static bool editUser(Users u)
    {
        string sqlString = "update t_user set u_name='" + u.userName + "',u_pwd=" + u.passWord + "where u_id=" + u.uid;
        return SqlHelper.excuteBool(sqlString);
    }
    public static DataSet getUsersList()
    {
        string sqlString;
        sqlString = "select u_id,u_name from t_user";
        return SqlHelper.excuteDataSet(sqlString);
    }
        public static DataSet getUsersList2()
    {
        string sqlString;
        sqlString = "select u_id,u_name from t_user where u_id not in (1)";
        return SqlHelper.excuteDataSet(sqlString);
    }
    //获取数据库中以及存在的用户的名称
    public static string getUserName()
    {
        string ColumnName = "";
        string sqlString = "select u_name from t_user";
        SqlConnection connection = SqlHelper.createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ColumnName += sdr[0].ToString() + ",";
        }
        ColumnName = ColumnName.Substring(0, ColumnName.Length - 1);
        return ColumnName;
    }
}