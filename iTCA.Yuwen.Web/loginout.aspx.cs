using System;


namespace iTCA.Yuwen.Web
{
    public partial class loginout : BasePage
    {
        protected override void Page_Show()
        {
            System.Web.HttpContext.Current.Response.Cookies["cmsnt"].Expires = DateTime.Now.AddDays(-1d);
        }
    }
}
