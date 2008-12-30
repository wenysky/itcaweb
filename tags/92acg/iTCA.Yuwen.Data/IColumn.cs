using System;
using System.Data;
using System.Data.Common;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Data
{
    public partial interface IDataProvider
    {
        IDataReader GetArticleColumnList();    
        void CreateColumn(ColumnInfo columninfo);
        void DeleteColumn(int columnid);
        void EditColumn(ColumnInfo columninfo);
    }
}