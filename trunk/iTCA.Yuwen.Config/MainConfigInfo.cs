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
        /// 关闭站点
        /// </summary>
        public int Closed { get; set; }
        /// <summary>
        /// 网站名称
        /// </summary>
        public string Websitename { get; set; }
        /// <summary>
        /// 网站title部分的SEO优化字符串
        /// </summary>
        public string Seotitle { get; set; }
    }
}
