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
        protected List<ArticleInfo> annlist;
        /// <summary>
        /// 推荐文章页码
        /// </summary>
        protected int pagecount;
        protected string pagecounthtml;
        protected override void Page_Show()
        {
            annlist = Articles.GetArticleCollection(1, 12, 1);
            newslist = Articles.GetArticleCollection("2,3,4", 5, 1);

            pagecount = Articles.GetArticleCollectionPageCount(1, 12);
            pagecounthtml = Utils.GetStaticPageNumbersHtml(1, pagecount, string.Format("showcolumn-{0}", 1), ".aspx", 8);
        }
    }
}
