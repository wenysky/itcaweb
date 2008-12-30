using System;
using System.IO;
using System.Collections.Generic;

using Newtonsoft.Json;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class uploadfile : BasePage
    {
        protected override void Page_Show()
        {
            if (userinfo == null)
            {
                System.Web.HttpContext.Current.Response.Write("请登录后再使用此功能.");
                System.Web.HttpContext.Current.Response.End();
            }
            if (ispost)
            {
                int filecount = System.Web.HttpContext.Current.Request.Files.Count;
                for (int i = 0; i < filecount; i++)
                {
                    System.Web.HttpPostedFile postedfile = System.Web.HttpContext.Current.Request.Files[i];
                    if (postedfile.FileName != string.Empty)
                    {
                        string fileext = Path.GetExtension(postedfile.FileName);
                        string savepath = Path.Combine("upload", DateTime.Now.ToString("yyMM"));
                        string filename = string.Format("{0}{1}{2}", DateTime.Now.ToString("yyMMddhhmm"), Guid.NewGuid().ToString(), fileext);
                        string fullsavename = Path.Combine(savepath, filename);
                        YRequest.SaveRequestFile(System.Web.HttpContext.Current.Request.Files[i], Server.MapPath("~/" + fullsavename));

                        AttachmentInfo info = new AttachmentInfo();
                        info.Filename = filename;
                        info.Filepath = fullsavename;
                        info.Filetype = 0;
                        info.Posterid = userinfo.Uid;
                        info.Description = "";
                        Attachments.CreateAttachment(info);

                        string result = JavaScriptConvert.SerializeObject(info);
                        System.Web.HttpContext.Current.Response.Write(result);
                    }
                }

                //System.Web.HttpContext.Current.Response.Redirect("uploadfile.aspx?filename=" + uploadedfilename.Trim(','));
            }
        }
    }
}
