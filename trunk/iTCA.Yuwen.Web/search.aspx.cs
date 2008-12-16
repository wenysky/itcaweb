using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class search : BasePage
    {
        protected List<ArticleInfo> searchresultlist;
        protected string pagecounthtml;
        protected override void Page_Show()
        {
            if (userinfo == null)
            {
                currentcontext.Response.Write("<script>alert('请登录后再搜索文章,谢谢~');history.back();</script>");
                currentcontext.Response.End();
                return;
            }
            string searchkey = YRequest.GetQueryString("searchkey");
            if (searchkey != string.Empty && Natsuhime.Common.Utils.IsSafeSqlString(searchkey))
            {
                int pageid = YRequest.GetQueryInt("pageid", 1);
                int pagecount;
                pagecount = Articles.GetSearchArticleCollectionPageCount(searchkey, 12);
                searchresultlist = Articles.GetSearchArticles(searchkey, 12, pageid);
                pagecounthtml = config.Urlrewrite == 1 ? Natsuhime.Web.Utils.GetStaticPageNumbersHtml(pageid, pagecount, string.Format("search-{0}", searchkey), ".aspx", 8) : Utils.GetPageNumbersHtml(pageid, pagecount, string.Format("search.aspx?searchkey={0}", searchkey), 8, "pageid", "");
            }
            else
            {
                currentcontext.Response.Write("参数异常!");
                currentcontext.Response.End();
                return;
            }

        }
    }
}
