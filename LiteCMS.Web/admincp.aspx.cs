using System;
using Natsuhime.Web;
using System.Web;
using LiteCMS.Entity;
using LiteCMS.Core;

namespace LiteCMS.Web
{
    public partial class admincp : BasePage
    {
        protected string url;
        protected bool isadminlogined;
        protected override void Page_Show()
        {
            if (YRequest.GetQueryString("action") == "logout")
            {
                HttpCookie admincookie = currentcontext.Request.Cookies["cmsntadmin"];
                if (admincookie != null)
                {
                    admincookie.Expires = DateTime.Now.AddYears(-1);
                    currentcontext.Response.AppendCookie(admincookie);
                }
                currentcontext.Response.Write("成功退出!");
                currentcontext.Response.Redirect("index.aspx");
                currentcontext.Response.End();
            }
            if (userinfo == null)
            {
                currentcontext.Response.Write("请登录前台.");
                currentcontext.Response.Redirect("login.aspx");
                currentcontext.Response.End();
            }

            IsAdminLogined();
            if (admininfo != null)
            {
                string action = YRequest.GetString("action") == string.Empty ? "default" : YRequest.GetString("action");
                int id = YRequest.GetInt("id", 0);


                url = string.Format("frame.aspx?action={1}&id={2}", adminpath, action, id);
            }
            else
            {
                url = "";
                if (ispost)
                {
                    //todo adminlogin
                    string name = YRequest.GetFormString("loginname");
                    string password = YRequest.GetFormString("password");
                    string path = YRequest.GetFormString("path");
                    admininfo = Admins.GetAdminInfo(name, Natsuhime.Common.Utils.MD5(password));

                    if (admininfo != null && admininfo.Uid == userinfo.Uid)
                    {
                        HttpCookie admincookie = new HttpCookie("cmsntadmin");
                        admincookie.Values["adminid"] = admininfo.Adminid.ToString();
                        admincookie.Values["password"] = admininfo.Password;
                        admincookie.Values["path"] = path;
                        admincookie.Expires = DateTime.Now.AddMinutes(20d);
                        currentcontext.Response.AppendCookie(admincookie);

                        currentcontext.Response.Redirect("admincp.aspx");
                    }
                    else
                    {
                        currentcontext.Response.Write("用户名或密码错误!");
                        currentcontext.Response.End();
                    }
                }
            }
        }
    }
}
