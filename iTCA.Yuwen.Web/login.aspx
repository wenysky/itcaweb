<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.login" %>
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
	Response.Write("	<title>" + pagetitle.ToString() + "</title>\r\n");
	Response.Write("</head>\r\n");
	Response.Write("<body>\r\n");
	Response.Write("<div id=\"wrap\">\r\n");
	Response.Write("	<!--头部开始-->\r\n");
	Response.Write("	<div id=\"header\">\r\n");
	Response.Write("		<div id=\"main-menu\">\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li><a href=\"index.aspx\">首页</a></li>\r\n");
	Response.Write("				<li><a href=\"showcolumn.aspx\">新闻</a></li>\r\n");
	Response.Write("				<li><a href=\"#\">投递</a></li>\r\n");
	Response.Write("				<li><a href=\"#\">博客</a></li>\r\n");
	Response.Write("				<li><a href=\"#\">论坛</a></li>\r\n");

	if (userinfo==null)
	{

	Response.Write("				<li><a href=\"login.aspx\">登录</a></li>\r\n");

	}
	else
	{

	Response.Write("				<li><a href=\"loginout.aspx\">注销" + userinfo.Username.ToString().Trim() + "</a></li>\r\n");

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
	Response.Write("		<div id=\"recommend-article\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">推荐新闻</div>\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li><h2><a href=\"#\">安装VS 2008 SP1后，智能提示变为英文...</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">揭示Visual Studio 2010发展路线图</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">.NET Framework 3.5 SP1完整版发布</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">GMail再次更新:带来新主题</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">求求你原谅我,亲爱的Firefox</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">Google处理1TB数据只需68秒 1PB六个小时</a></h2></li>\r\n");
	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("		<div id=\"hot-article\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">热门新闻</div>\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li><h2><a href=\"#\">安装VS 2008 SP1后，智能提示变为英文...</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">揭示Visual Studio 2010发展路线图</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">.NET Framework 3.5 SP1完整版发布</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">GMail再次更新:带来新主题</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">求求你原谅我,亲爱的Firefox</a></h2></li>\r\n");
	Response.Write("				<li><h2><a href=\"#\">Google处理1TB数据只需68秒 1PB六个小时</a></h2></li>\r\n");
	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("		<div id=\"latest-comment\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">最新评论</div>\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\">\"<a href=\"#\">安装VS 2008 SP1后，智能提示变为英文...</a>\"</span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">揭示Visual Studio 2010发展路线图</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">.NET Framework 3.5 SP1完整版发布</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">GMail再次更新:带来新主题</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">求求你原谅我,亲爱的Firefox</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">Google处理1TB数据只需68秒 1PB六个小时</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("		<div id=\"hot-comment\" class=\"right-list\">\r\n");
	Response.Write("			<div class=\"div-header\">热门评论</div>\r\n");
	Response.Write("			<ul>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">安装VS 2008 SP1后，智能提示变为英文...</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">揭示Visual Studio 2010发展路线图</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">.NET Framework 3.5 SP1完整版发布</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">GMail再次更新:带来新主题</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">求求你原谅我,亲爱的Firefox</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("				<li>\r\n");
	Response.Write("					<span class=\"content\">从2006年2月的“高跟鞋虐猫事件”，到近期的深圳海事局原党委书记林嘉祥事件...</span>\r\n");
	Response.Write("					<div class=\"comment-info\"><span class=\"comment-author\">匿名用户 </span>对 <span class=\"from-article\"><a href=\"#\">Google处理1TB数据只需68秒 1PB六个小时</a></span> 的评论</div>\r\n");
	Response.Write("				</li>\r\n");
	Response.Write("			</ul>\r\n");
	Response.Write("		</div>\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("	<!--右栏结束-->	\r\n");


	Response.Write("	<!--左栏开始-->\r\n");
	Response.Write("	<div id=\"left-side\">\r\n");
	Response.Write("		<!--文章开始-->\r\n");
	Response.Write("		<div class=\"div-header\">用户登录</div>		\r\n");
	Response.Write("		<form action=\"\" method=\"post\" id=\"login\">\r\n");
	Response.Write("		<table>\r\n");
	Response.Write("		    <tr>\r\n");
	Response.Write("		        <th>帐号: </th><td><input id=\"loginid\" name=\"loginid\" type=\"text\" />(请输入注册邮箱作为帐号)</td>\r\n");
	Response.Write("		    </tr>\r\n");
	Response.Write("		    <tr>\r\n");
	Response.Write("		        <th>密码: </th><td><input id=\"password\" name=\"password\" type=\"password\" /></td>\r\n");
	Response.Write("		    </tr>\r\n");
	Response.Write("		    <tr>\r\n");
	Response.Write("		        <th></th><td><input type=\"submit\" value=\"登录\" /></td>\r\n");
	Response.Write("		    </tr>\r\n");
	Response.Write("		</table>\r\n");
	Response.Write("		</form>\r\n");
	Response.Write("		<!--文章结束-->\r\n");
	Response.Write("	</div>\r\n");
	Response.Write("	<!--左栏结束-->\r\n");
	Response.Write("	<!--内容结束-->\r\n");

	Response.Write("	<div id=\"footer\">\r\n");
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