﻿using System;
using System.IO;
using Natsuhime.Common;

namespace iTCA.Yuwen.Config
{
    public class BaseConfigs
    {
        private static object lockHelper = new object();

        private static BaseConfigInfo m_configinfo;

        private static string configpath = Utils.GetMapPath("~/hmsm.config");
        /// <summary>
        /// 静态构造函数初始化相应实例和定时器
        /// </summary>
        static BaseConfigs()
        {
            if (m_configinfo == null)
            {
                m_configinfo = Load();
            }
        }


        /// <summary>
        /// 重设配置类实例
        /// </summary>
        public static void ResetConfig()
        {
            m_configinfo = Load();
        }
        /// <summary>
        /// 取得静态配置信息
        /// </summary>
        /// <returns></returns>
        public static BaseConfigInfo GetConfig()
        {
            return m_configinfo;
        }

        
        /// <summary>
        /// 序列化配置信息为XML
        /// </summary>
        /// <param name="configinfo">配置信息</param>
        /// <param name="configFilePath">配置文件完整路径</param>
        public static void Save(BaseConfigInfo configinfo)
        {
            lock (lockHelper)
            {
                SerializationHelper.SaveXml(configinfo, configpath);
            }
        }

        /// <summary>
        /// 从XML加载配置信息
        /// </summary>
        /// <returns></returns>
        public static BaseConfigInfo Load()
        {
            return (BaseConfigInfo)SerializationHelper.LoadXml(typeof(BaseConfigInfo), configpath);
        }
    }
}
