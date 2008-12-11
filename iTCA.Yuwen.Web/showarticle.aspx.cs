using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class showarticle : BasePage
    {
        protected ArticleInfo articleinfo;
        protected override void Page_Show()
        {
            int articleid = YRequest.GetQueryInt("id", 0);
            if (articleid <= 0)
            {
                articleid = 1;
            }
            articleinfo = Articles.GetArticleInfo(articleid);
            if (articleinfo == null)
            {
                currentcontext.Response.Write("不存在的文章!");
                currentcontext.Response.End();
            }
            pagetitle = string.Format("{0} - {1}", Natsuhime.Web.Utils.RemoveHtml(articleinfo.Title), articleinfo.Columnname);
        }
    }
}
