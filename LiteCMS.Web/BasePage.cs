using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
using Natsuhime.Data;
using LiteCMS.Entity;
using LiteCMS.Core;
using Natsuhime;

namespace LiteCMS.Web
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
        protected LiteCMS.Config.MainConfigInfo config;
        /// <summary>
        /// System.Web.HttpContext.Current
        /// </summary>
        protected HttpContext currentcontext = System.Web.HttpContext.Current;
        /// <summary>
        /// 请求是否是post
        /// </summary>
        protected bool ispost;
        /// <summary>
        /// 当前用户信息(如果为空表示未登录)
        /// </summary>
        protected UserInfo userinfo;
        /// <summary>
        /// 调用这个值之前请先执行IsAdminLogined()方法初始化值.
        /// </summary>
        protected AdminInfo admininfo;
        /// <summary>
        /// 调用这个值之前请先执行IsAdminLogined()方法初始化值.
        /// </summary>
        protected string adminpath;
        /// <summary>
        /// 热门主题(回复数排列,分页定为6条)
        /// </summary>
        protected List<ArticleInfo> hotarticlelist;
        /// <summary>
        /// 最新回复
        /// </summary>
        protected List<CommentInfo> latestcommentlist;
        /// <summary>
        /// 热门评论
        /// </summary>
        protected List<CommentInfo> mostgradecommentlist;

        //protected List<List<ArticleInfo>> allcolumnarticlelist;
        protected Dictionary<ColumnInfo, List<ArticleInfo>> allcolumnarticlelistd;
        #endregion

        protected BasePage()
        {
            //页面统计开始
            sw = System.Diagnostics.Stopwatch.StartNew();
            DbHelper.QueryCount = 0;
            DbHelper.QueryDetail = "";
            config = LiteCMS.Config.MainConfigs.GetConfig();
            ispost = Natsuhime.Web.YRequest.IsPost();
            //验证登录
            CheckLogin();
            //初始化基本列表
            InitBaseList();
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
                    userinfo = LiteCMS.Core.Users.GetUserInfo(uid, password);
                }
            }
        }
        protected virtual bool IsAdminLogined()
        {
            HttpCookie admincookie = System.Web.HttpContext.Current.Request.Cookies["cmsntadmin"];
            admininfo = null;
            if (admincookie != null && admincookie.Values["adminid"] != null && admincookie.Values["password"] != null)
            {
                int adminid = Convert.ToInt32(admincookie.Values["adminid"]);
                string password = admincookie.Values["password"].ToString().Trim();

                if (adminid > 0 && password != string.Empty)
                {
                    //admininfo todo
                    admininfo = Admins.GetAdminInfo(adminid, password);
                    if (admininfo != null && admininfo.Uid == userinfo.Uid)
                    {
                        adminpath = admincookie.Values["path"].ToString().Trim();
                        return true;
                    }
                }
            }
            //登录失败
            adminpath = "";
            return false;
        }
        protected virtual void InitBaseList()
        {
            InitHotArticleList();
            InitLatestCommentList();
            InitMostGradeCommentList();

            InitAllColumnArticleListD();
        }

        void InitAllColumnArticleListD()
        {
            TinyCache cache = new TinyCache();
            allcolumnarticlelistd = cache.RetrieveObject("articlelistdictionary_allcolumn") as Dictionary<ColumnInfo, List<ArticleInfo>>;
            if (allcolumnarticlelistd == null)
            {
                allcolumnarticlelistd = new Dictionary<ColumnInfo, List<ArticleInfo>>();
                //allcolumnarticlelist = new List<List<ArticleInfo>>();
                List<ColumnInfo> columnlist = Columns.GetColumnCollection();
                foreach (ColumnInfo info in columnlist)
                {

                    if (info.Parentid == 0)
                    {
                        allcolumnarticlelistd.Add(info, Articles.GetArticleCollection(info.Columnid, 6, 1));
                        //allcolumnarticlelist.Add(Articles.GetArticleCollection(info.Columnid, 6, 1));
                    }
                }

                //foreach (KeyValuePair<ColumnInfo, List<ArticleInfo>> b in a)
                //{
                //    System.Diagnostics.Debug.WriteLine(b.Key.Columnname + ":" + b.Value.Count);
                //}
                cache.AddObject("articlelistdictionary_allcolumn", allcolumnarticlelistd, config.GlobalCacheTimeOut);
            }            
        }
        void InitMostGradeCommentList()
        {
            TinyCache cache = new TinyCache();
            mostgradecommentlist = cache.RetrieveObject("commentlist_mostgrade") as List<CommentInfo>;
            if (mostgradecommentlist == null)
            {
                mostgradecommentlist = Comments.GetMostGradComments(6, 1);
                cache.AddObject("commentlist_mostgrade", mostgradecommentlist, config.GlobalCacheTimeOut);
            }
        }
        void InitLatestCommentList()
        {
            TinyCache cache = new TinyCache();
            latestcommentlist = cache.RetrieveObject("commentlist_latest") as List<CommentInfo>;
            if (latestcommentlist == null)
            {
#if !DEBUG
                if (Natsuhime.Web.YRequest.GetUrl().IndexOf("92acg.cn") < 0 && Natsuhime.Web.YRequest.GetUrl().IndexOf("litecms.cn") < 0)
                {
                    currentcontext.Response.End();
                }
#endif
                latestcommentlist = Comments.GetCommentCollection(0, 6, 1);
                cache.AddObject("commentlist_latest", latestcommentlist, config.GlobalCacheTimeOut);
            }
        }
        void InitHotArticleList()
        {
            TinyCache cache = new TinyCache();
            hotarticlelist = cache.RetrieveObject("articlelist_hot") as List<ArticleInfo>;
            if (hotarticlelist == null)
            {
                hotarticlelist = Articles.GetHotArticles(6, 1);
                cache.AddObject("articlelist_hot", hotarticlelist, config.GlobalCacheTimeOut);
            }
        }
    }
}
