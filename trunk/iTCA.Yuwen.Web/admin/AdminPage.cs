using System;
using System.Web;
using iTCA.Yuwen.Entity;
using iTCA.Yuwen.Core;

namespace iTCA.Yuwen.Web.Admin
{
    public class AdminPage : System.Web.UI.Page
    {
        protected string adminpath;
        protected AdminInfo admininfo;
        protected UserInfo userinfo;
        protected override void OnInit(EventArgs e)
        {
            /*
            if (Session["Admin"] == null)
            {
                Response.End();
            }
             */
            if (!CheckAdminLogin())
            {
                Response.Redirect("admincp.aspx");
                Response.End();
            }
            base.OnInit(e);
        }

        protected bool CheckAdminLogin()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["cmsnt"];
            userinfo = null;
            if (cookie != null && cookie.Values["userid"] != null && cookie.Values["password"] != null)
            {
                int uid = Convert.ToInt32(cookie.Values["userid"]);
                string password = cookie.Values["password"].ToString().Trim();

                if (uid > 0 && password != string.Empty)
                {
                    userinfo = iTCA.Yuwen.Core.Users.GetUserInfo(uid, password);
                }
            }

            if (userinfo != null)
            {
                HttpCookie admincookie = Request.Cookies["cmsntadmin"];
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
                            admincookie.Expires = DateTime.Now.AddMinutes(20d);
                            adminpath = admincookie.Values["path"].ToString().Trim();
                            return true;
                        }
                    }
                }
            }
            adminpath = "";
            return false;
        }
    }
}
