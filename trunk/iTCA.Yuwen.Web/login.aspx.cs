using System;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Web
{
    public partial class login : BasePage
    {
        protected override void Page_Show()
        {
            if (System.Web.HttpContext.Current.Request.HttpMethod.Equals("POST"))
            {
                if (System.Web.HttpContext.Current.Request.Form["loginid"] != null && System.Web.HttpContext.Current.Request.Form["password"] != null)
                {
                    string loginid = System.Web.HttpContext.Current.Request.Form["loginid"].ToString();
                    string password = System.Web.HttpContext.Current.Request.Form["password"].ToString();
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
                        System.Web.HttpContext.Current.Response.Write("login success!");
                        System.Web.HttpContext.Current.Response.Redirect("usercontrolpanl.aspx");
                    }
                    else
                    {
                        System.Web.HttpContext.Current.Response.Cookies["cmsnt"].Expires = DateTime.Now.AddDays(-1d);
                        System.Web.HttpContext.Current.Response.Write("login failed");
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
