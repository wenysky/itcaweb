<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.register" %>
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
	Response.Write("		<div id=\"search\"><form action=\"search.aspx\" method=\"get\">标题搜索&nbsp;:&nbsp;<input type=\"text\" id=\"searchkey\" name=\"searchkey\" />&nbsp;&nbsp;<input type=\"submit\" value=\"搜索\" /></form></div>	\r\n");
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
	Response.Write("		<div class=\"div-header\">用户注册</div>\r\n");
	Response.Write("		<br />\r\n");
	Response.Write("		<br />\r\n");
	Response.Write("		<form action=\"\" method=\"post\" id=\"login\">\r\n");
	Response.Write("		    <table>\r\n");
	Response.Write("		        <tr>\r\n");
	Response.Write("		            <th>帐号: </th><td><input id=\"email\" name=\"email\" type=\"text\" />(请填写使用中的邮箱地址,本站将采用Email登陆.)</td>\r\n");
	Response.Write("		        </tr>\r\n");
	Response.Write("		        <tr>\r\n");
	Response.Write("		            <th>密码: </th><td><input id=\"password\" name=\"password\" type=\"password\" /></td>\r\n");
	Response.Write("		        </tr>\r\n");
	Response.Write("		        <tr>\r\n");
	Response.Write("		            <th>其他信息<br /><br /></th><td></td>\r\n");
	Response.Write("		        </tr>\r\n");
	Response.Write("		        <tr>\r\n");
	Response.Write("		            <th>用户名: </th><td><input id=\"username\" name=\"username\" type=\"text\" />(注册后无法修改,请确定填写正确.)</td>\r\n");
	Response.Write("		        </tr>\r\n");
	Response.Write("		        <tr>\r\n");
	Response.Write("		            <th></th><td><input type=\"submit\" value=\"注册\" /></td>\r\n");
	Response.Write("		        </tr>\r\n");
	Response.Write("		    </table>\r\n");
	Response.Write("		</form>\r\n");
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