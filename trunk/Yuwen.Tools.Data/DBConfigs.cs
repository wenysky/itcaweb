using System;
using System.Collections.Generic;
using System.Text;

namespace Yuwen.Tools.Data
{
    public class DBConfigs
    {
        /// <summary>
        /// 得到数据库连接字符串
        /// </summary>
        /// <returns></returns>
        public static string GetDBConnectString()
        {
            return string.Format("Data Source={0}\\config\\db.config", System.Web.HttpContext.Current.Server.MapPath("~/"));
        }

        public static string GetDbType()
        {
            return "Sqlite";
        }
    }
}
