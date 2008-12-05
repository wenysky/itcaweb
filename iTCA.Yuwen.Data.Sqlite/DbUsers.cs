using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using Natsuhime.Data;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Data.Sqlite
{
    public partial class DataProvider : IDataProvider
    {
        /// <summary>
        /// 取得用户信息(用于登录)
        /// </summary>
        /// <param name="loginid">登录id(UserName或者Email)</param>
        /// <param name="password">密码</param>
        /// <param name="logintype">登录类型(0为邮箱地址登录,1为UserName登录)</param>
        /// <returns>用户记录</returns>
        public IDataReader GetUserInfo(string loginid, string password, int logintype)
        {
            string sql;
            if (loginid == 0)
            {
                sql = "SELECT * FROM wy_users WHERE email=@loginid AND password=@password";
            }
            else
            {
                sql = "SELECT * FROM wy_users WHERE username=@loginid AND password=@password";
            }
            IDataReader dr;
            DbParameter[] prams = 
		    {
			    DbHelper.MakeInParam("@loginid", DbType.String, 100, loginid),
                DbHelper.MakeInParam("@password", DbType.String, 32, password)
		    };
            dr = DbHelper.ExecuteReader(CommandType.Text, sql, prams);
            return dr;
        }

        public IDataReader GetUserInfo(int uid)
        {
            IDataReader dr;
            DbParameter[] prams = 
		    {
			    DbHelper.MakeInParam("@uid", DbType.Int32, 4, uid)
		    };
            dr = DbHelper.ExecuteReader(CommandType.Text, "SELECT * FROM wy_users WHERE uid=@uid", prams);
            return dr;
        }

        public IDataReader GetUserInfo(string username)
        {
            IDataReader dr;
            DbParameter[] prams = 
		    {
			    DbHelper.MakeInParam("@username", DbType.String, 100, username),
		    };
            dr = DbHelper.ExecuteReader(CommandType.Text, "SELECT * FROM wy_users WHERE username=@username", prams);
            return dr;
        }



        public IDataReader GetUsers(int pagesize, int currentpage)
        {
            IDataReader dr;
            int recordoffset = (currentpage - 1) * pagesize;

            DbParameter[] prams = 
		    {
			    DbHelper.MakeInParam("@recordoffset", DbType.Int32, 4,recordoffset),
			    DbHelper.MakeInParam("@pagesize", DbType.Int32, 4,pagesize)
		    };
            dr = DbHelper.ExecuteReader(CommandType.Text, "SELECT * FROM wy_users ORDER BY uid LIMIT @recordoffset,@pagesize", prams);
            return dr;
        }



        public int GetArticleCollectionPageCount(int pagesize)
        {
            int recordcount;
            recordcount = Convert.ToInt32(DbHelper.ExecuteScalar(CommandType.Text, "SELECT COUNT(uid) FROM wy_users"));
            return recordcount % pagesize == 0 ? recordcount / pagesize : recordcount / pagesize + 1;
        }
    }
}
