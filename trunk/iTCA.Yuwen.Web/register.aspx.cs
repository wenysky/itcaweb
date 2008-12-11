﻿using System;
using iTCA.Yuwen.Core;
using iTCA.Yuwen.Entity;
using Natsuhime.Web;

namespace iTCA.Yuwen.Web
{
    public partial class register : BasePage
    {
        protected override void Page_Show()
        {
            if (userinfo != null)
            {
                currentcontext.Response.Write("您已经登录了,请不要重复注册帐号!");
                currentcontext.Response.End();
            }
            if (ispost)
            {
                string email = YRequest.GetString("email");
                string password = YRequest.GetString("password");
                string username = YRequest.GetString("username");

                if (email != string.Empty && password != string.Empty && username != string.Empty)
                {
                    UserInfo info = new UserInfo();
                    info.Adminid = 0;
                    info.Articlecount = 0;
                    info.Bdday = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
                    info.Del = 0;
                    info.Email = email;
                    info.Groupid = 1;
                    info.Hi = "";
                    info.Lastlogdate = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
                    info.Lastlogip = "";
                    info.Msn = "";
                    info.Nickname = username;
                    info.Password = password;
                    info.Qq = "";
                    info.Realname = "";
                    info.Regdate = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
                    info.Regip = YRequest.GetIP();
                    info.Replycount = 0;
                    info.Topiccount = 0;
                    info.Username = username;

                    Users.AddUser(info);
                    currentcontext.Response.Write("<script>alert('注册帐号成功,跳转到用户中心.')</script>");
                    currentcontext.Response.Redirect("usercenter.aspx");
                }
            }

        }
    }
}