using System;
using System.Data;
using System.Data.Common;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Data
{
    public partial interface IDataProvider
    {
        void CreateAttachment(AttachmentInfo info);
        IDataReader GetAttachments(string filenames);
        IDataReader GetAttachments(int posterid, int pagesize, int currentpage);
    }
}
