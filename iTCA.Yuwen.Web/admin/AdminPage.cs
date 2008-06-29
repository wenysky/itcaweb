using System;
using System.Web;

namespace iTCA.Yuwen.Web.Admin
{
    public class AdminPage : System.Web.UI.Page
    {        
        protected override void OnInit(EventArgs e)
        {
            //Response.Write("aaaa");
            if (Session["Admin"] == null)
            {
                Response.End();
            }
            base.OnInit(e);
        }
    }
}
