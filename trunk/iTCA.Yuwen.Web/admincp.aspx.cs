using System;
using Natsuhime.Web;
using System.Web;

namespace iTCA.Yuwen.Web
{
    public partial class admincp : BasePage
    {
        protected string url;
        protected string adminpath;
        protected override void Page_Show()
        {


            adminpath = YRequest.GetString("path") == string.Empty ? "admin" : YRequest.GetString("path");
            string action = YRequest.GetString("action") == string.Empty ? "default" : YRequest.GetString("action");
            int id = YRequest.GetInt("id", 0);

            url = string.Format("frame.aspx?path={0}&action={1}&id={2}", adminpath, action, id);
        }

        bool IsAdminLogined()
        {
            HttpCookie admincookie = currentcontext.Request.Cookies["cmsntadmin"];

            if (admincookie != null && admincookie.Values["adminid"] != null && admincookie.Values["password"] != null)
            {
                int adminid = Convert.ToInt32(admincookie.Values["userid"]);
                string password = admincookie.Values["password"].ToString().Trim();

                if (adminid > 0 && password != string.Empty)
                {
                    //admininfo todo
                }
            }
        }
    }
}
