using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using iTCA.Yuwen.Config;
using Natsuhime;
using Natsuhime.Common;

namespace iTCA.Yuwen.Web.Utility
{
    public partial class TestTool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BaseConfigInfo info = new BaseConfigInfo();
            info.Dbconnectstring = @"Data Source=F:\Doctments\Works\Mine\iTCAWeb\trunk\iTCA.Yuwen.Web\config\db.config";
            info.Dbtype = "Sqlite";
            info.Tableprefix = "wy_";
            info.ApplictionPath = "/";
            SerializationHelper.SaveXml(info, Utils.GetMapPath("~/hmsm.config"));
        }
    }
}
