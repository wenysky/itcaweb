using System;
using System.Collections.Generic;
using System.Text;
using iTCA.Yuwen.Entity;

namespace iTCA.Yuwen.Plugin
{
    public interface IArticleCollectionProvider
    {
        Dictionary<string, List<ArticleInfo>> GetAllArticleList();
    }
}
