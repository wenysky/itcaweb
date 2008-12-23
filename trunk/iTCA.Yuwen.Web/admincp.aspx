<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.admincp" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{
	/*
	This is a cached-file of template("\templates\admincp.htm"), it was created by LiteCMS.CN Template Engine.
	Please do NOT edit it.
	此文件为模板文件的缓存("\templates\admincp.htm"),由 LiteCMS.CN 模板引擎生成.
	所以请不要编辑此文件.
	*/
	base.OnInit(e);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	templateBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\" >\r\n");
	templateBuilder.Append("<head id=\"Head1\" runat=\"server\">\r\n");
	templateBuilder.Append("    <title>Admin Control Panel - Power by 盛夏之地</title>\r\n");
	templateBuilder.Append("    <style type=\"text/css\">\r\n");
	templateBuilder.Append("    * \r\n");
	templateBuilder.Append("    {\r\n");
	templateBuilder.Append("        margin:0pt;\r\n");
	templateBuilder.Append("        padding:0pt;\r\n");
	templateBuilder.Append("    }\r\n");
	templateBuilder.Append("    h1, h2, h3, h4, h5, h6, p, blockquote \r\n");
	templateBuilder.Append("    {\r\n");
	templateBuilder.Append("        margin:0pt;\r\n");
	templateBuilder.Append("        padding:10px;\r\n");
	templateBuilder.Append("    }\r\n");
	templateBuilder.Append("    body\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            font:12px Tahoma;\r\n");
	templateBuilder.Append("	        text-align:center;\r\n");
	templateBuilder.Append("	        background:#EEEEFF;\r\n");
	templateBuilder.Append("	        width:100%;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul \r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            list-style:none;\r\n");
	templateBuilder.Append("            /*float:left;*/\r\n");
	templateBuilder.Append("            width:100%;\r\n");
	templateBuilder.Append("            font-size:16px;\r\n");
	templateBuilder.Append("            margin-left: 0px;\r\n");
	templateBuilder.Append("            margin-top:10px;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul li \r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            float:left;\r\n");
	templateBuilder.Append("            width:100%;\r\n");
	templateBuilder.Append("            line-height:20px; \r\n");
	templateBuilder.Append("            text-align:center\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul li:hover\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            background-color:Silver; color:Red;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul li a\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            display:block;width:100%;text-decoration:none;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul li a:link,a:visited\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            color:#000;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("    ul li a:hover\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            color:Red;\r\n");
	templateBuilder.Append("        }\r\n");
	templateBuilder.Append("/*  ul li a:visited\r\n");
	templateBuilder.Append("        {\r\n");
	templateBuilder.Append("            color:#000;\r\n");
	templateBuilder.Append("        }*/\r\n");
	templateBuilder.Append("    </style>\r\n");
	templateBuilder.Append("</head>\r\n");
	templateBuilder.Append("<body>\r\n");
	templateBuilder.Append("    <form id=\"form1\" runat=\"server\">\r\n");
	templateBuilder.Append("    <div id=\"Banner\" style=\"height:70px; width:100%; background-color:Gray\">\r\n");
	templateBuilder.Append("        Banner\r\n");
	templateBuilder.Append("    </div>\r\n");
	templateBuilder.Append("    <div id=\"Main\" style=\"margin:10px auto 0 auto; border:solid 1px gray; text-align:left\">欢迎 <asp:Label ID=\"lbLoginName\" runat=\"server\"></asp:Label> 登录后台管理,点击<a href=\"../\" target=\"_blank\">回到前台</a>。\r\n");
	templateBuilder.Append("    </div>\r\n");
	templateBuilder.Append("    <div id=\"Menu\" style=\"background-color:#FFF;width:13%; float:left; border:solid 1px gray; margin:10px 5px\">\r\n");
	templateBuilder.Append("        <ul>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=listarticle&id=0\" target=\"MainIFR\">后台首页</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=postarticle\" target=\"MainIFR\">发布文章</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=listarticle&id=0\" target=\"MainIFR\">文章管理</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=mgrcolumn\" target=\"MainIFR\">栏目管理</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"#\" target=\"MainIFR\">留言管理</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"#\" target=\"MainIFR\">用户管理</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"#\" target=\"MainIFR\">管理设置</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"#\" target=\"MainIFR\">友情管理</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=mainsetting\" target=\"MainIFR\">系统设置</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"frame.aspx?path=" + adminpath.ToString() + "&action=template\" target=\"MainIFR\">模板生成</a></li>\r\n");
	templateBuilder.Append("            <li><a href=\"#\" target=\"_parent\">退出后台</a></li>\r\n");
	templateBuilder.Append("        </ul>\r\n");
	templateBuilder.Append("    </div>\r\n");
	templateBuilder.Append("    <iframe id=\"MainIFR\" name=\"MainIFR\" frameborder=\"0\" scrolling=\"yes\" src=\"" + url.ToString() + "\" width=\"85%\" height=\"490px\" style=\"margin:10px auto auto auto; border:solid 1px gray;\">\r\n");
	templateBuilder.Append("    </iframe>\r\n");
	templateBuilder.Append("    </form>\r\n");
	templateBuilder.Append("</body>\r\n");
	templateBuilder.Append("</html>\r\n");

	Response.Write(templateBuilder.ToString());
}
</script>