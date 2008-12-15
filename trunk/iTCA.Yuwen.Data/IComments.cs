using System;
using System.Data;
using System.Data.Common;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Data
{
    public partial interface IDataProvider
    {
        #region 取得列表
        IDataReader GetComments(int articleid, int pagesize, int currentpage);
        IDataReader GetUserComments(int uid, int pagesize, int currentpage);
        int GetCommentsPageCount(int articleid, int pagesize);
        int GetUserCommentsPageCount(int uid, int pagesize);
        #endregion

        IDataReader GetCommentInfo(int commentid);

        void CreateComment(CommentInfo commentinfo);
        void DeleteComment(int commentid);
        void GradeComment(int commentid, int type);
    }
}
