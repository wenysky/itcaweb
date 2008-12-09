using System;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class login : BasePage
    {
        protected override void Page_Show()
        {
            if (userinfo != null)
            {
                System.Web.HttpContext.Current.Response.Write("您已经登录了,请不要重复登录.");
                System.Web.HttpContext.Current.Response.End();
                return;
            }
            if (YRequest.IsPost())
            {
                string loginid = YRequest.GetString("loginid");
                string password = YRequest.GetString("password");
                if (loginid != string.Empty && password != string.Empty)
                {
                    UserInfo info = Users.GetUserInfo(loginid, password, 0);
                    if (info != null)
                    {
                        System.Web.HttpCookie cookie = new System.Web.HttpCookie("cmsnt");
                        cookie.Values["userid"] = info.Uid.ToString();
                        cookie.Values["password"] = info.Password;


                        cookie.Expires = DateTime.Now.AddDays(30d);

                        //if (cookieDomain != string.Empty && HttpContext.Current.Request.Url.Host.IndexOf(cookieDomain) > -1 && IsValidDomain(HttpContext.Current.Request.Url.Host))
                        //{
                        //    cookie.Domain = cookieDomain;
                        //}

                        System.Web.HttpContext.Current.Response.AppendCookie(cookie);
                        System.Web.HttpContext.Current.Response.Redirect("usercontrolpanl.aspx");
                    }
                    else
                    {
                        System.Web.HttpContext.Current.Response.Write("<script>alert('login failed')</script>");
                    }
                }
                else
                {
                    System.Web.HttpContext.Current.Response.Write("用户名或密码为空");
                }
            }
        }
    }
}
