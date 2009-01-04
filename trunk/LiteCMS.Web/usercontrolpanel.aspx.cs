using System;
using System.Collections.Generic;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class usercontrolpanel : BasePage
    {
        protected List<ArticleInfo> myarticlelist;
        protected string pagecounthtml;
        protected override void Page_Show()
        {
            if (userinfo == null)
            {
                pagetitle = "用户中心";
                currentcontext.Response.Write("<script>alert('帐号验证失败,请登录后再访问用户中心!')</script>");
                currentcontext.Response.Redirect("login.aspx");
            }
            else
            {
                pagetitle = string.Format("{0}的用户中心", userinfo.Username);
                int pageid = YRequest.GetInt("pageid", 1);
                int pagecount = Articles.GetUserArticleCollectionPageCount(userinfo.Uid, 8);
                pagecounthtml = Utils.GetPageNumbersHtml(pageid, pagecount, "usercontrolpanel.aspx", 8, "pageid", "");
                myarticlelist = Articles.GetUserArticleCollection(userinfo.Uid, 8, pageid);

                if (ispost)
                {
                    string oldpassword = YRequest.GetString("oldpassword");
                    string newpassword = YRequest.GetString("newpassword");
                    string newpassword2 = YRequest.GetString("newpassword2");
                    if (oldpassword == userinfo.Password)
                    {
                        if (newpassword == newpassword2)
                        {
                            userinfo.Password = newpassword;
                            Users.EditUser(userinfo);
                            currentcontext.Response.Write("<script>alert('修改成功.')</script>");
                        }
                    }
                    else
                    {
                        currentcontext.Response.Write("<script>alert('旧密码验证错误!请检查是否输入正确,大小写锁定键是否被打开等.')</script>");
                        currentcontext.Response.End();
                    }
                }
            }
        }
    }
}
