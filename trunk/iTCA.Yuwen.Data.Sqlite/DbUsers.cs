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
            throw new NotImplementedException();
        }

        public IDataReader GetUserInfo(int uid)
        {
            throw new NotImplementedException();
        }

        public IDataReader GetUserInfo(string username)
        {
            throw new NotImplementedException();
        }
    }
}
