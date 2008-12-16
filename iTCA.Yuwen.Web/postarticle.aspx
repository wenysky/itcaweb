<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.postarticle" %>
<%@ Import namespace="iTCA.Yuwen.Data" %>
<%@ Import namespace="iTCA.Yuwen.Entity" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{
	base.OnInit(e);

	Response.Write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	Response.Write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
	Response.Write("<head>\r\n");
	Response.Write("	<link rel=\"stylesheet\" type=\"text/css\" href=\"templates/main.css\" />\r\n");
	Response.Write("	<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />\r\n");

	if (pagetitle=="")
	{

	Response.Write("<title>" + config.Websitename.ToString().Trim() + " " + config.Seotitle.ToString().Trim() + " - Powered by 盛夏之地</title>\r\n");

	}
	else
	{

	Response.Write("<title>" + pagetitle.ToString() + " - " + config.Websitename.ToString().Trim() + " " + config.Seotitle.ToString().Trim() + " - Powered by 盛夏之地</title>\r\n");

	}	//end if

	Response.Write("</head>\r\n");
	Response.Write("<body>\r\n");
	Response.Write("<div id=\"wrap\">\r\n");
	Response.Write("	<!--头部开始-->\r\n");
	Response.Write("	<div id=\"header\">\r\n");
	Response.Write("		<div id=\"main-menu\">\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li><a href=\"index.aspx\">首页</a></li>\r\n");
	Response.Write("				<li><a href=\"showcolumn.aspx\">新闻</a></li>\r\n");
	Response.Write("				<li><a href=\"postarticle.aspx\">投递</a></li>\r\n");
	Response.Write("				<li><a href=\"#\">博客</a></li>\r\n");
	Response.Write("				<li><a href=\"bbs/\">论坛</a></li>\r\n");

	if (userinfo==null)
	{

	Response.Write("				<li><a href=\"login.aspx\">登录</a></li>\r\n");
	Response.Write("				<li><a href=\"register.aspx\">注册</a></li>\r\n");

	}
	else
	{

	Response.Write("				<li><a href=\"usercontrolpanel.aspx\">用户中心</a></li>\r\n");
	Response.Write("				<li><a href=\"loginout.aspx\">注销 " + userinfo.Username.ToString().Trim() + "</a></li>\r\n");

	}	//end if

	Response.Write("				<li><a href=\"#\">关于</a></li>\r\n");
	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("	<!--头部结束-->\r\n");


	Response.Write("	<!--内容开始-->\r\n");

	Response.Write("	<!--右栏开始-->\r\n");
	Response.Write("	<div id=\"right-side\">\r\n");
	Response.Write("		<div class=\"div-header\">站内搜索</div>\r\n");
	Response.Write("		<div id=\"search\"><form action=\"#1\" method=\"post\">标题搜索&nbsp;:&nbsp;<input type=\"text\" id=\"searchkey\" name=\"searchkey\" />&nbsp;&nbsp;<input type=\"submit\" value=\"搜索\" /></form></div>	\r\n");
	Response.Write("		<div id=\"hot-article\" class=\"right-list\">\r\n");

	if (config.Urlrewrite==1)
	{

	Response.Write("			<div class=\"div-header\"><a href=\"showcolumn-hot" + config.Urlrewriteextname.ToString().Trim() + "\">热门新闻</a></div>\r\n");

	}
	else
	{

	Response.Write("			<div class=\"div-header\"><a href=\"showcolumn.aspx?type=hot\">热门新闻</a></div>\r\n");

	}	//end if

	Response.Write("			<ul>\r\n");

	int hotarticleinfo__loop__id=0;
	foreach(ArticleInfo hotarticleinfo in hotarticlelist)
	{
		hotarticleinfo__loop__id++;


	if (config.Urlrewrite==1)
	{

	Response.Write("				<li><h2><a href=\"showarticle-" + hotarticleinfo.Articleid.ToString().Trim() + "" + config.Urlrewriteextname.ToString().Trim() + "\">" + hotarticleinfo.Title.ToString().Trim() + "</a></h2></li>\r\n");

	}
	else
	{

	Response.Write("				<li><h2><a href=\"showarticle.aspx?id=" + hotarticleinfo.Articleid.ToString().Trim() + "\">" + hotarticleinfo.Title.ToString().Trim() + "</a></h2></li>\r\n");

	}	//end if


	}	//end loop

	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("		<div id=\"latest-comment\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">最新评论</div>\r\n");
	Response.Write("			<ul>\r\n");

	int latestcommentinfo__loop__id=0;
	foreach(CommentInfo latestcommentinfo in latestcommentlist)
	{
		latestcommentinfo__loop__id++;

	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">" + latestcommentinfo.Content.ToString().Trim() + "</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">" + latestcommentinfo.Username.ToString().Trim() + " </span>对 <span class=\"from-article\">\"<a href=\"\r\n");

	if (config.Urlrewrite==1)
	{

	Response.Write("showarticle-" + latestcommentinfo.Articleid.ToString().Trim() + "" + config.Urlrewriteextname.ToString().Trim() + "\r\n");

	}
	else
	{

	Response.Write("showarticle.aspx?id=" + latestcommentinfo.Articleid.ToString().Trim() + "\r\n");

	}	//end if

	Response.Write("\">" + latestcommentinfo.Articletitle.ToString().Trim() + "</a>\"</span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");

	}	//end loop

	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("		<div id=\"hot-comment\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">热门评论</div>\r\n");
	Response.Write("			<ul>\r\n");

	int mostgradecommentinfo__loop__id=0;
	foreach(CommentInfo mostgradecommentinfo in mostgradecommentlist)
	{
		mostgradecommentinfo__loop__id++;

	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">" + mostgradecommentinfo.Content.ToString().Trim() + "</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">" + mostgradecommentinfo.Username.ToString().Trim() + " </span>对 <span class=\"from-article\"><a href=\"\r\n");

	if (config.Urlrewrite==1)
	{

	Response.Write("showarticle-" + mostgradecommentinfo.Articleid.ToString().Trim() + "" + config.Urlrewriteextname.ToString().Trim() + "\r\n");

	}
	else
	{

	Response.Write("showarticle.aspx?id=" + mostgradecommentinfo.Articleid.ToString().Trim() + "\r\n");

	}	//end if

	Response.Write("\">" + mostgradecommentinfo.Articletitle.ToString().Trim() + "</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");

	}	//end loop

	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("	<!--右栏结束-->	\r\n");


	Response.Write("	<!--左栏开始-->\r\n");
	Response.Write("	<div id=\"left-side\">\r\n");
	Response.Write("		<!--文章开始-->\r\n");
	Response.Write("		<div class=\"div-header\">投递文章</div>\r\n");
	Response.Write("		<!-- tinyMCE -->\r\n");
	Response.Write("        <script language=\"javascript\" type=\"text/javascript\" src=\"editor/tiny_mce.js\"></"+ "script>\r\n");
	Response.Write("        <script language=\"javascript\" type=\"text/javascript\">\r\n");
	Response.Write("            // Notice: The simple theme does not use all options some of them are limited to the advanced theme\r\n");
	Response.Write("            tinyMCE.init({\r\n");
	Response.Write("            mode : \"textareas\",theme : \"advanced\",language : \"zh\",\r\n");
	Response.Write("            theme_advanced_toolbar_location : \"top\",theme_advanced_toolbar_align : \"left\"\r\n");
	Response.Write("            });\r\n");
	Response.Write("         </"+ "script>\r\n");
	Response.Write("        <!-- /tinyMCE -->\r\n");
	Response.Write("        <div>\r\n");
	Response.Write("        <form method=\"post\" action=\"\">\r\n");
	Response.Write("        <table style=\"width:100%;\">\r\n");
	Response.Write("                <tr>\r\n");
	Response.Write("                    <td style=\"width: 96px\">\r\n");
	Response.Write("                        <select name=\"columnid\" id=\"columns\" style=\"width:96px;\">\r\n");

	int columninfo__loop__id=0;
	foreach(ColumnInfo columninfo in columnlist)
	{
		columninfo__loop__id++;

	Response.Write("	                        <option value=\"" + columninfo.Columnid.ToString().Trim() + "\">" + columninfo.Columnname.ToString().Trim() + "</option>\r\n");

	}	//end loop

	Response.Write("                        </select>\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                    <td>\r\n");
	Response.Write("                        <input name=\"title\" type=\"text\" style=\"width:100%;\" />\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                </tr>\r\n");
	Response.Write("                <tr>\r\n");
	Response.Write("                    <td colspan=\"2\">\r\n");
	Response.Write("                        <textarea name=\"summary\" rows=\"2\" cols=\"20\" id=\"summary\" style=\"height:70px;width:100%;\"></textarea>\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                </tr>\r\n");
	Response.Write("                <tr>\r\n");
	Response.Write("                    <td colspan=\"2\">\r\n");
	Response.Write("                        <textarea name=\"content\" rows=\"2\" cols=\"20\" id=\"content\" style=\"height:366px;width:100%;\"></textarea>\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                </tr>\r\n");
	Response.Write("                <tr>\r\n");
	Response.Write("                    <td>上传文件:</td>\r\n");
	Response.Write("                    <td>                       \r\n");
	Response.Write("                        <input type=\"file\" name=\"upfile\" id=\"upfile\" />\r\n");
	Response.Write("                        <button class=\"button\" id=\"buttonUpload\" onclick=\"return ajaxFileUpload();\">上传文件</button>                          \r\n");
	Response.Write("                        <script src=\"javascript/jquery-1.2.6.js\" type=\"text/javascript\" language=\"javascript\"></"+ "script>\r\n");
	Response.Write("                        <script src=\"javascript/ajaxfileupload.js\" type=\"text/javascript\"></"+ "script>\r\n");
	Response.Write("                        <script type=\"text/javascript\">\r\n");
	Response.Write("                            function ajaxFileUpload()\r\n");
	Response.Write("                            {\r\n");
	Response.Write("                                //starting setting some animation when the ajax starts and completes\r\n");
	Response.Write("                                $(\"#loading\")\r\n");
	Response.Write("                                .ajaxStart(function(){\r\n");
	Response.Write("                                    $(this).show();\r\n");
	Response.Write("                                })\r\n");
	Response.Write("                                .ajaxComplete(function(){\r\n");
	Response.Write("                                    $(this).hide();\r\n");
	Response.Write("                                });\r\n");
	Response.Write("                                /*\r\n");
	Response.Write("                                    prepareing ajax file upload\r\n");
	Response.Write("                                    url: the url of script file handling the uploaded files\r\n");
	Response.Write("                                                fileElementId: the file type of input element id and it will be the index of  $_FILES Array()\r\n");
	Response.Write("                                    dataType: it support json, xml\r\n");
	Response.Write("                                    secureuri:use secure protocol\r\n");
	Response.Write("                                    success: call back function when the ajax complete\r\n");
	Response.Write("                                    error: callback function when the ajax failed\r\n");
	Response.Write("                                        */\r\n");
	Response.Write("                                $.ajaxFileUpload\r\n");
	Response.Write("                                (\r\n");
	Response.Write("                                    {\r\n");
	Response.Write("                                        url:'uploadfile.aspx',\r\n");
	Response.Write("                                        secureuri:false,\r\n");
	Response.Write("                                        fileElementId:'upfile',\r\n");
	Response.Write("                                        dataType: 'json',\r\n");
	Response.Write("                                        success: function (data, status)\r\n");
	Response.Write("                                        {\r\n");
	Response.Write("                                            if(typeof(data.Filepath) != 'undefined')\r\n");
	Response.Write("                                            {\r\n");
	Response.Write("                                                alert('上传成功!');                                                \r\n");
	Response.Write("                                                tinyMCE.getInstanceById('content').getBody().innerHTML += '<img src=\"' + data.Filepath + '\" alt=\"\" />';\r\n");
	Response.Write("                                            }\r\n");
	Response.Write("//                                            if(typeof(data.error) != 'undefined')\r\n");
	Response.Write("//                                            {\r\n");
	Response.Write("//                                                if(data.error != '')\r\n");
	Response.Write("//                                                {\r\n");
	Response.Write("//                                                    alert(data.error);\r\n");
	Response.Write("//                                                }else\r\n");
	Response.Write("//                                                {\r\n");
	Response.Write("//                                                    alert(data.msg);\r\n");
	Response.Write("//                                                }\r\n");
	Response.Write("//                                            }\r\n");
	Response.Write("                                        },\r\n");
	Response.Write("                                        error: function (data, status, e)\r\n");
	Response.Write("                                        {\r\n");
	Response.Write("                                            alert(e);\r\n");
	Response.Write("                                        }\r\n");
	Response.Write("                                    }\r\n");
	Response.Write("                                )\r\n");
	Response.Write("                                return false;\r\n");
	Response.Write("                            }  \r\n");
	Response.Write("                        </"+ "script>\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                </tr>\r\n");
	Response.Write("                <tr>                    \r\n");
	Response.Write("                    <td align=\"center\" colspan=\"2\">\r\n");
	Response.Write("                        <input type=\"submit\" value=\"提交\" />&nbsp;&nbsp;&nbsp;<input type=\"submit\" name=\"btnCancel\" value=\"取消\" id=\"btnCancel\" />\r\n");
	Response.Write("                    </td>\r\n");
	Response.Write("                </tr>\r\n");
	Response.Write("            </table>\r\n");
	Response.Write("        </form>\r\n");
	Response.Write("        </div>\r\n");
	Response.Write("		<!--文章结束-->\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("	<!--左栏结束-->\r\n");
	Response.Write("	<!--内容结束-->\r\n");

	Response.Write("	<div id=\"footer\" title=\"执行时间:" + processtime.ToString() + ",查询数:" + querycount.ToString() + "\">\r\n");
	Response.Write("		<ul>\r\n");
	Response.Write("			<li><a href=\"#\">关于本站</a></li>\r\n");
	Response.Write("			<li><a href=\"#\">联系我们</a></li>		\r\n");
	Response.Write("			<li><a href=\"#\">广告服务</a></li>	\r\n");
	Response.Write("			<li>版权所有 © 2004-2008 <a href=\"\">盛夏之地</a></li>\r\n");
	Response.Write("		</ul>\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("</div>\r\n");
	Response.Write("</body>\r\n");
	Response.Write("</html>\r\n");



}
</script>