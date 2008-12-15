using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class index : BasePage
    {
        /// <summary>
        /// 协会新闻列表
        /// </summary>
        protected List<ArticleInfo> newslist;
        /// <summary>
        /// 协会公告列表
        /// </summary>
        protected List<ArticleInfo> mainarticlelist;
        /// <summary>
        /// 推荐文章页码
        /// </summary>
        protected int pagecount;
        protected string pagecounthtml;
        protected override void Page_Show()
        {
            int pageid = 1;
            if (true)
            {
                mainarticlelist = Articles.GetRecommendArticles(10, 1);
                pagecount = Articles.GetRecommendArticleCollectionPageCount(10);
                pagecounthtml = config.Urlrewrite == 1 ? Utils.GetStaticPageNumbersHtml(pageid, pagecount, "showcolumn-recommend", ".aspx", 8) : Utils.GetPageNumbersHtml(pageid, pagecount, "showcolumn.aspx?type=recommend", 8, "pageid", "");
            }
            else
            {
                mainarticlelist = Articles.GetArticleCollection(0, 10, 1);
                pagecount = Articles.GetArticleCollectionPageCount(0, 10);
                pagecounthtml = config.Urlrewrite == 1 ? Utils.GetStaticPageNumbersHtml(pageid, pagecount, string.Format("showcolumn-{0}", 0), ".aspx", 8) : Utils.GetPageNumbersHtml(pageid, pagecount, "showcolumn.aspx?cid=0", 8, "pageid", "");
            }

            newslist = Articles.GetArticleCollection("2,3,4", 5, 1);
        }
    }
}
