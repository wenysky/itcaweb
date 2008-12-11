using System;
using System.IO;
using System.Web;
using iTCA.Yuwen.Config;
using Natsuhime.Common;

namespace iTCA.Yuwen.Web.Admin
{
    public partial class mainsetting :AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //读取
                MainConfigInfo mainconfiginfo = MainConfigs.Load();
                tbxWebSiteName.Text = mainconfiginfo.Websitename;
                tbxSEOTitle.Text = mainconfiginfo.Seotitle;
            }
            else
            {
                string websitename = tbxWebSiteName.Text.Trim();
                string seotitle = tbxSEOTitle.Text.Trim();
                if (websitename != string.Empty && seotitle != string.Empty)
                {
                    MainConfigInfo mainconfiginfo = new MainConfigInfo();
                    mainconfiginfo.Websitename = websitename;
                    mainconfiginfo.Seotitle = seotitle;

                    MainConfigs.Save(mainconfiginfo);
                }
            }
        }
    }
}
