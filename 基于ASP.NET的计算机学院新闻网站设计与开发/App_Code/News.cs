using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// News 的摘要说明
/// </summary>
public class News
{
    public News()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public int n_id;
    public string n_title;
    public string n_contents;
    public int u_id;
    public string u_name;
    public int c_id;
    public DateTime addTime;
    public int hitCount;
    public string imgUrl;
    //通过新闻的id获取新闻的所有信息
    public static News getNewsById(string id)
    {
        News news = new News();
        string sqlString = "select * from t_user,t_news where t_user.u_id=t_news.u_id and t_news.n_id=" + id;
        SqlConnection connection = SqlHelper.createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString,connection);
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            
            news.u_id = Convert.ToInt32(sdr[0]);
            news.u_name = Convert.ToString(sdr[1]);
            news.n_id = Convert.ToInt32(sdr[3]);
            news.n_title = Convert.ToString(sdr[4]);
            news.n_contents = Convert.ToString(sdr[5]);
            news.c_id = Convert.ToInt32(sdr[7]);
            news.addTime = Convert.ToDateTime(sdr[8]);
            news.hitCount  = Convert.ToInt32(sdr[9]);
            news.imgUrl = Convert.ToString(sdr[10]);
        }
        connection.Close();
        return news;    
    }
    public static void getPics(ref string pics,ref string texts,ref string links)
    {
        string sqlString = "select top 5 n_id,n_title,imgUrl from t_news where imgUrl<>'' order by addTime DESC";
        SqlConnection connection = SqlHelper.createConnection();
        connection.Open();
        SqlCommand cmd = new SqlCommand(sqlString, connection);
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            pics += sdr[2].ToString() + ",";
            texts += sdr[1].ToString() + ",";
            links += "shownews.aspx?id=" + sdr[0].ToString()  + ",";
        }
        pics = pics.Substring(0, pics.Length - 1);
        texts = texts.Substring(0, texts.Length - 1);
        links = links.Substring(0, links.Length - 1);
    }
    //从数据库中取所有栏目的名称组成字符串
    public static string getColumnName()
    {
        string ColumnName="";
        string sqlString = "select c_name from t_column";
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

    public static void addHitCount(string id)
    {
        string sqlString = "update t_news set hitCount=hitCount+1 where n_id=" + id;
        SqlHelper.excuteaddHitCount(sqlString);
    }
    //从数据库中取点击数最多的十条新闻
    public static DataSet getHotNews()
    {
        string sqlString= "select top (10) * from t_news order by hitCount DESC";
        return SqlHelper.excuteDataSet(sqlString);
    }
    public static DataSet getSearchNews(string str)
    {
        string searchStr1 = "%" + str + "%";
        string searchStr2="'%" + str + "%'";
        string sqlString = "select * from t_news where n_contents like '"  + searchStr1 + "'or n_title like "  + searchStr2;
        return SqlHelper.excuteDataSet(sqlString);
    }
    public static DataSet getColumnNews(string id)
    {
        string sqlString = "select * from t_user,t_news where t_user.u_id=t_news.u_id and t_news.c_id=" + id;
        return SqlHelper.excuteDataSet(sqlString);
    }
    //从数据库视图中检索出所有新闻
    public static DataSet getNewsList(string name)
    {
        string sqlString;
        if(name=="admin")
            sqlString = "select * from View_News order by addTime DESC";
        else
            sqlString = "select * from View_News where u_name='" + name +"'order by addTime DESC";
        return SqlHelper.excuteDataSet(sqlString);
    }
    //根据栏目id获取新闻
    public static DataSet getNewsListByCid(string name)
    {
        string sqlString;
            sqlString = "select * from View_News where c_name='"+name+"'order by addTime DESC";         
        return SqlHelper.excuteDataSet(sqlString);
    }
    //新闻排序
    public static DataSet getSortNewsList(string str)
    {
        string sqlString="";
        string Uname = str.Substring(0, str.Length - 1); ;
        if (str == "admin1")
            sqlString = "select * from View_News order by hitCount DESC";
        else if (str == "admin2")
            sqlString = "select * from View_News order by hitCount ASC";
        else if (str == "admin3")
            sqlString = "select * from View_News order by addTime DESC";
        else if (str == "admin4")
            sqlString = "select * from View_News order by addTime ASC";
        else if (str == "jack1")
            sqlString = "select * from View_News where u_name='"+Uname+"'order by hitCount DESC";
        else if (str == "jack2")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by hitCount ASC";
        else if (str == "jack3")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime DESC";
        else if (str == "jack4")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime ASC";
        else if (str == "lisa1")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by hitCount DESC";
        else if (str == "lisa2")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by hitCount ASC";
        else if (str == "lisa3")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime DESC";
        else if (str == "lisa4")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime ASC";
        else if (str == "lucy1")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by hitCount DESC";
        else if (str == "lucy2")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by hitCount ASC";
        else if (str == "lucy3")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime DESC";
        else if (str == "lucy4")
            sqlString = "select * from View_News where u_name='" + Uname + "'order by addTime ASC";
        return SqlHelper.excuteDataSet(sqlString);
    }
//取栏目名称
public static DataSet getColumnList(int id)
{
    string sqlString;
    if (id == 1)
    {
        sqlString = "select c_id,c_name from t_column";
    }
    else sqlString = "select c_id,c_name from t_column where u_id=" + id ;
    return SqlHelper.excuteDataSet(sqlString);
}
    //添加新闻
    public static bool addNews(News n)
    {
        string sqlString = "insert into t_news(n_title,n_contents,u_id,c_id,addTime,hitCount,imgUrl) values('" + n.n_title + "','" + n.n_contents + "'," + n.u_id + "," + n.c_id + ",'" + n.addTime + "'," + n.hitCount + ",'"+n.imgUrl+"')";
        return SqlHelper.excuteBool(sqlString);
    }
    //编辑新闻
    public static bool editNews(News n)
    {
        string sqlString = "update t_news set n_title='" + n.n_title + "',n_contents='" + n.n_contents + "',u_id=" + n.u_id + ",c_id=" + n.c_id + ",imgUrl='" + n.imgUrl + "' where n_id=" + n.n_id;
        return SqlHelper.excuteBool(sqlString);
    }
    //删除新闻
    public static bool delNews(string id)
    {
        string sqlString = "delete from t_news where n_id=" + id;
        return SqlHelper.excuteBool(sqlString);
    }
    //根据用户id修改用户的密码和用户名
    public static bool changePwd(string id, string str1,string str2) {
        string sqlString = "select count(*) from t_user where u_id='" + id + "'and u_pwd='" + str1 + "'";
        if (SqlHelper.excuteInt(sqlString) == 1)
        {
            sqlString = "update t_user set u_pwd='" + str2 + "'where u_id=" + id;
            return SqlHelper.excuteBool(sqlString);
        }
        else
            return false;
    }

}
