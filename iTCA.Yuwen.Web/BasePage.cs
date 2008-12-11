using System;
using System.Data;
using System.Web;
using Natsuhime.Data;

namespace iTCA.Yuwen.Web
{
    public class BasePage : System.Web.UI.Page
    {
        #region 页面变量
        /// <summary>
        /// 当前页面标题
        /// </summary>
        protected string pagetitle = "";
        /// <summary>
        /// 页面内容
        /// </summary>
        protected System.Text.StringBuilder templateBuilder = new System.Text.StringBuilder();
        /// <summary>
        /// 页面执行计时用
        /// </summary>
        protected System.Diagnostics.Stopwatch sw;
        /// <summary>
        /// 当前页面执行时间(毫秒)
        /// </summary>
        protected string processtime;
        /// <summary>
        /// 页面查询数
        /// </summary>
        protected int querycount;
        /// <summary>
        /// 页面查询Sql内容
        /// </summary>
        protected string querydetail;
        /// <summary>
        /// 请求是否是post
        /// </summary>
        protected bool ispost;
        /// <summary>
        /// 当前用户信息(如果为空表示未登录)
        /// </summary>
        protected iTCA.Yuwen.Entity.UserInfo userinfo;
        #endregion

        protected BasePage()
        {
            //页面统计开始
            sw = System.Diagnostics.Stopwatch.StartNew();
            DbHelper.QueryCount = 0;
            DbHelper.QueryDetail = "";
            ispost = Natsuhime.Web.YRequest.IsPost();
            //验证登录
            CheckLogin();
            //页面执行
            Page_Show();

            //页面统计结束
            querycount = DbHelper.QueryCount;
            querydetail = DbHelper.QueryDetail;
            processtime = sw.Elapsed.TotalSeconds.ToString("F6");
        }
        /// <summary>
        /// 页面处理虚方法
        /// </summary>
        protected virtual void Page_Show()
        {
            return;
        }
        /// <summary>
        /// 验证登录
        /// </summary>
        protected virtual void CheckLogin()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["cmsnt"];
            userinfo = null;
            if (cookie != null && cookie.Values["userid"] != null && cookie.Values["password"] != null)
            {
                int uid = Convert.ToInt32(cookie.Values["userid"]);
                string password = cookie.Values["password"].ToString().Trim();

                if (uid > 0 && password != string.Empty)
                {
                    userinfo = iTCA.Yuwen.Core.Users.GetUserInfo(uid.ToString(), password, 3);
                }
            }
        }
    }
}
