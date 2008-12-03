using System;
using System.Data;
using System.Data.Common;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Data
{
    public partial interface IDataProvider
    {
        /// <summary>
        /// 取得用户信息(用于登录)
        /// </summary>
        /// <param name="loginid">登录id(UserName或者Email)</param>
        /// <param name="password">密码</param>
        /// <param name="logintype">登录类型(0为邮箱地址登录,1为UserName登录)</param>
        /// <returns>用户记录</returns>
        IDataReader GetUserInfo(string loginid, string password, int logintype);
        IDataReader GetUserInfo(int uid);
        IDataReader GetUserInfo(string username);
    }
}
