using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Column 的摘要说明
/// </summary>
public class Column
{
    public Column()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public string c_id;
    public int u_id;
    public string c_name;
    //向数据库中添加栏目信息
    public static bool addColumn(Column c)
    {
        string sqlString = "insert into t_column(c_name,u_id) values('" + c.c_name + "','" + c.u_id + "')";
        return SqlHelper.excuteBool(sqlString);
    }
    //根据栏目id删除栏目
    public static bool delColumn(string id)
    {
        string sqlString = "delete from t_column where c_id=" + id;
        return SqlHelper.excuteBool(sqlString);
    }
    //更加栏目id更新数据库中的信息
    public static bool editColumn(Column c)
    {
        string sqlString = "update t_column set c_name='" + c.c_name + "',u_id=" + c.u_id +"where c_id="+c.c_id;
        return SqlHelper.excuteBool(sqlString);
    }
    public static DataSet getColumnList(int id)
    {
        string sqlString;
        if (id == 1)
        {
            sqlString = "select c_id,c_name from t_column where c_id not in (1,2,3,4)";
        }
        else sqlString = "select c_id,c_name from t_column where u_id=" + id;
        return SqlHelper.excuteDataSet(sqlString);
    }
}