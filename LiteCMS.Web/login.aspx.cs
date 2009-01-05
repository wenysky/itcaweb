using System;
using LiteCMS.Core;
using LiteCMS.Entity;
using Natsuhime.Web;

namespace LiteCMS.Web
{
    public partial class login : BasePage
    {
        protected override void Page_Show()
        {
            pagetitle = "用户登录";
            if (userid > 0)
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
                    UserInfo info = Users.GetUserInfo(loginid, Natsuhime.Common.Utils.MD5(password), 0);
                    if (info != null)
                    {
                        YCookies cookie = new YCookies("cmsnt");
                        cookie.WriteCookieValue("userid", info.Uid.ToString());
                        cookie.WriteCookieValue("password", info.Password);
                        cookie.WriteCookieValue("username", info.Username);
                        cookie.WriteCookieValue("adminid", info.Adminid.ToString());
                        cookie.AddCookieExpiresTime(30 * 3600 * 24);
                        cookie.SaveCookie();

                        //System.Web.HttpCookie cookie = new System.Web.HttpCookie("cmsnt");
                        //cookie.Values["userid"] = info.Uid.ToString();
                        //cookie.Values["password"] = info.Password;
                        //cookie.Values["username"] = info.Username;
                        //cookie.Values["adminid"] = info.Adminid;
                        //cookie.Expires = DateTime.Now.AddDays(30d);
                        //currentcontext.Response.AppendCookie(cookie);

                        #region 插件登录
                        bool pluglogin = false;
                        if (pluglogin)
                        {
                            Plugin.IUserProvider provider = Plugin.ProviderUtitily.GetUserProvider("DNT");
                            int uid = provider.IsUserExits(info.Username);
                            if (uid > 0)
                            {
                                provider.Login(info.Username, password, false, 16000, "");
                            }
                            else
                            {
                                provider.Register(info.Username, info.Password, info.Email, true);
                            }
                        }
                        #endregion
                        currentcontext.Response.Write("<script>alert('登录成功,跳转到用户中心.')</script>");
                        currentcontext.Response.Redirect("usercontrolpanel.aspx");
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
