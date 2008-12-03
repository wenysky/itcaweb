using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;

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
            pagetitle = "欢迎来到 iTCA 重庆工学院计算机协会 - iTCA 重庆工学院计算机协会";
            annlist = Articles.GetArticleCollection(1, 12, 1);
            newslist = Articles.GetArticleCollection("2,3,4", 5, 1);

            pagecount = Articles.GetArticleCollectionPageCount(1, 12);
            pagecounthtml = Natsuhime.Utils.GetStaticPageNumbersHtml(1, pagecount, string.Format("showcolumn-{0}", 1), ".aspx", 8);
        }
    }
}
