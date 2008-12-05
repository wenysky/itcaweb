using System;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Web
{
    public partial class login : BasePage
    {
        protected override void Page_Show()
        {
            if (System.Web.HttpContext.Current.Request.Form["loginid"] != null && System.Web.HttpContext.Current.Request.Form["password"] != null)
            {
                string loginid = System.Web.HttpContext.Current.Request.Form["loginid"].ToString();
                string password = System.Web.HttpContext.Current.Request.Form["password"].ToString();
                UserInfo info = Users.GetUserInfo(loginid, password, 0);
                if (info != null)
                {
                    System.Web.HttpContext.Current.Response.Write("login success!");
                }
                else
                {
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
