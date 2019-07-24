using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// SqlHelper 的摘要说明
/// </summary>
public class SqlHelper
{
    public SqlHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    // 建立数据库连接并返回建立好的数据库连接。
    public static SqlConnection createConnection()
    {
        // 自动化获取在配置文件中设置好的数据库连接
        SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WebDataConnection"].ConnectionString);
        return connection;
    }
    //去数据库中符合sql语句条件的数据放到DataSet对象中返回出去
    public static DataSet excuteDataSet(string sqlString)
    {
        SqlConnection connection = createConnection();
        connection.Open();
        //sda数据适配器
        SqlDataAdapter sda = new SqlDataAdapter(sqlString, connection);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        connection.Close();
        return ds;
    }
    //返回符合sql语句条件的数据的数量
    public static int excuteInt(string sqlString)
    {
        SqlConnection connection = createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        int count = 0;
        count = Convert.ToInt32(cmd.ExecuteScalar());
        connection.Close();
        return count;
    }
    //用来增加数据库中新闻的点击数
    public static void excuteaddHitCount(string sqlString)
    {
        SqlConnection connection = createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        cmd.ExecuteNonQuery();
        connection.Close();
    }
    //判断数据库中是否存在符合sql语句的数据
    public static bool excuteBool(string sqlString)
    {
        SqlConnection connection = createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        bool result = true;
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch {
            result = false;
        }
        connection.Close();
        return result;
    }
}