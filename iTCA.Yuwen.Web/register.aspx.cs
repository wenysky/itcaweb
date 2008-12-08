using System;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Web
{
    public partial class register : BasePage
    {
        protected override void Page_Show()
        {
            UserInfo info = new UserInfo();
            info.Adminid = 1;
            info.Articlecount = 0;
            info.Bdday = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            info.Del = 0;
            info.Email = "admin@qq.com";
            info.Groupid = 1;
            info.Hi = "";
            info.Lastlogdate = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            info.Lastlogip = "127.0.0.1";
            info.Msn = "";
            info.Nickname = "管理员";
            info.Password = "123";
            info.Qq = "";
            info.Realname = "";
            info.Regdate = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            info.Regip = "0.0.0.0";
            info.Replycount = 0;
            info.Topiccount = 0;
            info.Username = "admin";

            Users.AddUser(info);
                
        }
    }
}
