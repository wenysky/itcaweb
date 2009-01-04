using System;
using System.Collections.Generic;
using System.Text;

namespace iTCA.Yuwen.Config
{
    [Serializable]
    public class MainConfigInfo
    {        
        /// <summary>
        /// 应用程序key(用于cookie加密之类的)
        /// </summary>
        public string ApplictionSecKey { get; set; }
        /// <summary>
        /// cookie作用域
        /// </summary>
        public string Cookiedomain { get; set; }
        /// <summary>
        /// 启用UrlRewrite
        /// </summary>
        public int Urlrewrite { get; set; }
        /// <summary>
        /// UrlRewrite扩展名
        /// </summary>
        public string Urlrewriteextname { get; set; }
        /// <summary>
        /// 全局缓存过期时间(单位:分钟)
        /// </summary>
        public int GlobalCacheTimeOut { get; set; }

        /// <summary>
        /// 关闭站点
        /// </summary>
        public int Closed { get; set; }
        /// <summary>
        /// 关闭原因
        /// </summary>
        public string Closedreason { get; set; }
        /// <summary>
        /// 网站名称
        /// </summary>
        public string Websitename { get; set; }
        /// <summary>
        /// 网站title部分的SEO优化字符串
        /// </summary>
        public string Seotitle { get; set; }
        /// <summary>
        /// 统计代码
        /// </summary>
        public string Analyticscode { get; set; }
    }
}
