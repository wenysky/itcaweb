using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class showcolumn : BasePage
    {
        protected List<ArticleInfo> newslist;
        protected string pagecounthtml;
        protected override void Page_Show()
        {
            int columnid, pageid, pagecount;
            columnid = YRequest.GetInt("cid", 0);
            pageid = YRequest.GetInt("pageid", 1);

            pagecount = Articles.GetArticleCollectionPageCount(columnid, 12);
            if (pageid > pagecount)
            {
                pageid = pagecount;
            }
            pagecounthtml = config.Urlrewrite == 1 ? Natsuhime.Web.Utils.GetStaticPageNumbersHtml(pageid, pagecount, string.Format("showcolumn-{0}", columnid), ".aspx", 8) : Utils.GetPageNumbersHtml(1, pagecount, string.Format("showcolumn.aspx?cid={0}", columnid), 8, "pageid", "");
            newslist = Articles.GetArticleCollection(columnid, 12, pageid);

            if (columnid > 0)
            {
                pagetitle = Articles.GetColumnName(columnid);
            }
            else
            {
                pagetitle = "所有文章列表";
            }
        }
    }
}
