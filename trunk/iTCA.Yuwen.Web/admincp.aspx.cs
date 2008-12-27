using System;
using Natsuhime.Web;
using System.Web;
using iTCA.Yuwen.Entity;
using iTCA.Yuwen.Core;

namespace iTCA.Yuwen.Web
{
    public partial class admincp : BasePage
    {
        protected string url;
        protected string adminpath;
        protected bool isadminlogined;
        protected AdminInfo admininfo;
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

            isadminlogined = IsAdminLogined();
            if (isadminlogined)
            {
                string action = YRequest.GetString("action") == string.Empty ? "default" : YRequest.GetString("action");
                int id = YRequest.GetInt("id", 0);


                url = string.Format("frame.aspx?path={0}&action={1}&id={2}", adminpath, action, id);
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
                    admininfo = Admins.GetAdminInfo(name, password);

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

        bool IsAdminLogined()
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
    }
}
