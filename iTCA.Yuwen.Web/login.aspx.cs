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
                currentcontext.Response.Write("<script>alert('您已经登录了,请不要重复登录!')</script>");
                currentcontext.Response.Redirect("usercontrolpanl.aspx");
            }
            if (ispost)
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

                        currentcontext.Response.AppendCookie(cookie);
                        currentcontext.Response.Write("<script>alert('登录成功,跳转到用户中心.')</script>");
                        currentcontext.Response.Redirect("usercontrolpanl.aspx");
                    }
                    else
                    {
                        currentcontext.Response.Write("<script>alert('登录失败,帐号或密码错误!')</script>");
                    }
                }
                else
                {
                    currentcontext.Response.Write("<script>alert('登录失败,用户名或密码为空!')</script>");
                    currentcontext.Response.Redirect("index.aspx");
                }
            }
        }
    }
}
