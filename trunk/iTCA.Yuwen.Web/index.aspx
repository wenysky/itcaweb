<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.index" %>
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
	Response.Write("				<li><a href=\"postarticle.aspx\">投递</a></li>\r\n");
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
	Response.Write("		<!--新闻列表开始-->\r\n");
	Response.Write("		<!--推荐文章开始-->\r\n");
	Response.Write("		<div class=\"div-header\">首页最新推送文章</div>\r\n");
	Response.Write("		<!--分页开始-->\r\n");
	Response.Write("		<div id=\"pager\">页码:" + pagecounthtml.ToString() + "</div>\r\n");
	Response.Write("		<!--分页结束-->\r\n");
	Response.Write("		<ul>\r\n");

	int anninfo__loop__id=0;
	foreach(ArticleInfo anninfo in annlist)
	{
		anninfo__loop__id++;

	Response.Write("			<li class=\"article-list\">\r\n");
	Response.Write("				<h2 class=\"title\"><a href=\"showarticle-" + anninfo.Articleid.ToString().Trim() + ".aspx\">" + anninfo.Title.ToString().Trim() + "</a></h2>\r\n");
	Response.Write("				<span class=\"description\">" + anninfo.Summary.ToString().Trim() + "</span>\r\n");
	Response.Write("				<div class=\"post-info\"><span class=\"author\">" + anninfo.Username.ToString().Trim() + "</span>投递 @ 发布于<span class=\"post-date\">" + anninfo.Postdate.ToString().Trim() + "</span></div>\r\n");
	Response.Write("			</li>\r\n");

	}	//end loop

	Response.Write("		</ul>		\r\n");
	Response.Write("		<!--分页开始-->\r\n");
	Response.Write("		<div id=\"pager\">页码:" + pagecounthtml.ToString() + "</div>\r\n");
	Response.Write("		<!--分页结束-->\r\n");
	Response.Write("		<!--推荐文章结束-->\r\n");
	Response.Write("		<!--栏目列表开始-->\r\n");
	Response.Write("		<div class=\"div-header\">技术文章</div>\r\n");
	Response.Write("		<ul>\r\n");

	int newsinfo__loop__id=0;
	foreach(ArticleInfo newsinfo in newslist)
	{
		newsinfo__loop__id++;

	Response.Write("			<li class=\"article-list\"><h2><a href=\"showarticle-" + newsinfo.Articleid.ToString().Trim() + ".aspx\">" + newsinfo.Title.ToString().Trim() + "</a></h2></li>\r\n");

	}	//end loop

	Response.Write("		</ul>\r\n");
	Response.Write("		<div class=\"div-header\">业界新闻</div>\r\n");
	Response.Write("		<ul>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">鲍尔默感恩节答谢名单 盖茨杨致远榜上有名</a></h2></li>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">英国卫报：疯狂的树屋</a></h2></li>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">阿里巴巴“援冬”产品取得开门红</a></h2></li>\r\n");
	Response.Write("		</ul>\r\n");
	Response.Write("		<!--栏目列表结束-->\r\n");
	Response.Write("		<!--插件文章列表开始-->\r\n");
	Response.Write("		<div class=\"div-header\">论坛新帖</div>\r\n");
	Response.Write("		<ul>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">鲍尔默感恩节答谢名单 盖茨杨致远榜上有名</a></h2></li>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">英国卫报：疯狂的树屋</a></h2></li>\r\n");
	Response.Write("			<li class=\"article-list\"><h2><a href=\"#\">阿里巴巴“援冬”产品取得开门红</a></h2></li>\r\n");
	Response.Write("		</ul>\r\n");
	Response.Write("		<!--插件文章列表开始-->	\r\n");
	Response.Write("		<!--新闻列表结束-->\r\n");
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