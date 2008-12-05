using System;
using System.Data;
using System.Collections.Generic;
using Natsuhime;
using iTCA.Yuwen.Data;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Core
{
    public class Users
    {
        private static UserInfo DataReader2UserInfo(IDataReader reader)
        {
            UserInfo info = new UserInfo();
            info.Uid = Convert.ToInt32(reader["uid"]);
            info.Username = reader["username"].ToString();
            info.Password = reader["password"].ToString();
            info.Groupid = Convert.ToInt32(reader["groupid"]);
            info.Adminid = Convert.ToInt32(reader["adminid"]);
            info.Qq = reader["qq"].ToString();
            info.Email = reader["email"].ToString();
            info.Msn = reader["msn"].ToString();
            info.Hi = reader["hi"].ToString();
            info.Nickname = reader["nickname"].ToString();
            info.Realname = reader["realname"].ToString();
            info.Bdday = reader["bdday"].ToString();
            info.Regip = reader["regip"].ToString();
            info.Regdate = reader["regdate"].ToString();
            info.Lastlogip = reader["lastlogip"].ToString();
            info.Lastlogdate = reader["lastlogdate"].ToString();
            info.Del = Convert.ToInt32(reader["del"]);
            info.Articlecount = Convert.ToInt32(reader["articlecount"]);
            info.Topiccount = Convert.ToInt32(reader["topiccount"]);
            info.Replycount = Convert.ToInt32(reader["replycount"]);
        }
        public UserInfo GetUserInfo(string loginid, string password, int logintpye)
        {
        }
    }
}
