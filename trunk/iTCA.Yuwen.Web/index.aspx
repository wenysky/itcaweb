<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.index" %>

<%@ Import namespace="iTCA.Yuwen.Data" %>
<%@ Import namespace="iTCA.Yuwen.Entity" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2008-6-26 13:14:26.
		本页面代码由模板引擎生成于 2008-6-26 13:14:26. 
	*/

	base.OnInit(e);

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	templateBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\" >\r\n");
	templateBuilder.Append("<head runat=\"server\">\r\n");
	templateBuilder.Append("    <title>" + pagetitle.ToString() + "</title>\r\n");
	templateBuilder.Append("    <link href=\"templates/css/itca.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
	templateBuilder.Append("</head>\r\n");
	templateBuilder.Append("<body>\r\n");
	templateBuilder.Append("    <form id=\"form1\" runat=\"server\">\r\n");
	templateBuilder.Append("    <div id=\"container\">\r\n");
	templateBuilder.Append("     <div id = \"header\">\r\n");
	templateBuilder.Append("	     <div id=\"menu\">\r\n");
	templateBuilder.Append("		 <ul>\r\n");
	templateBuilder.Append("			<li><a id=\"index\" href=\"../index.aspx\">首 页</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"ann\" href=\"../showcolumn-1-1.aspx\">公 告</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"news\" href=\"../news.aspx\">新 闻</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"act\" href=\"../showcolumn-5-1.aspx\">活 动</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"book\" href=\"../book/Index.aspx?cid=1\">留 言 板</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"other\" href=\"../other/Index.aspx\">其他相关</a></li>\r\n");
	templateBuilder.Append("		 </ul>\r\n");
	templateBuilder.Append("		 </div>         \r\n");
	templateBuilder.Append("     </div>\r\n");
	templateBuilder.Append("     <div id=\"Div1\" style=\"clear:both; background:url(images/index/banner1.gif); height:29px\"></div>\r\n");
	templateBuilder.Append("       <div>\r\n");


	templateBuilder.Append("<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("    <tr height=\"113\">\r\n");
	templateBuilder.Append("        <td background=\"images/index/default01.jpg\" style=\"height: 113px\">\r\n");
	templateBuilder.Append("        </td>\r\n");
	templateBuilder.Append("        <td background=\"images/index/default02.jpg\" style=\"height: 113px\">\r\n");
	templateBuilder.Append("        </td>\r\n");
	templateBuilder.Append("    </tr>\r\n");
	templateBuilder.Append("    <tr>\r\n");
	templateBuilder.Append("        <td width=\"71%\">\r\n");
	templateBuilder.Append("            <table width=\"568\" height=\"261\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("                <tr>\r\n");
	templateBuilder.Append("                    <td style=\"height: 40px; width: 116px; background: url(images/index/def_left01.jpg) no-repeat;\r\n");
	templateBuilder.Append("                        background-color: #F7F7F7\">\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                    <td style=\"height: 40px; width: 452px; background: url(images/index/def_mid01.jpg) no-repeat;\">\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                </tr>\r\n");
	templateBuilder.Append("                <tr>\r\n");
	templateBuilder.Append("                    <td id=\"as\" width=\"116\" height=\"75\" bgcolor=\"f7f7f7\" background=\"images/index/def_left03.jpg\">\r\n");
	templateBuilder.Append("                        <a href=\"other/\" title=\"协会简介\" target=\"_blank\">重庆工学院计算机<br />\r\n");
	templateBuilder.Append("                            协会成立于 1998<br />\r\n");
	templateBuilder.Append("                            年，经过数次变革<br />\r\n");
	templateBuilder.Append("                            之后形成了现在的<br />\r\n");
	templateBuilder.Append("                            iTCA……&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n");
	templateBuilder.Append("                        </a>\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                    <td background=\"images/index/def_mid02.jpg\" width=\"452\" height=\"75\" align=\"left\">\r\n");
	templateBuilder.Append("                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");

	int anninfo__loop__id=0;
	foreach(ArticleInfo anninfo in annlist)
	{
		anninfo__loop__id++;

	templateBuilder.Append("                            <tr>\r\n");
	templateBuilder.Append("                                <td>\r\n");
	templateBuilder.Append("                                    <div class=\"i_title\">\r\n");
	templateBuilder.Append("                                        [" + anninfo.Columnname.ToString().Trim() + "]&nbsp;<a href=\"showarticle-" + anninfo.Articleid.ToString().Trim() + ".aspx\">" + anninfo.Title.ToString().Trim() + "</a></div>\r\n");
	templateBuilder.Append("                                </td>\r\n");
	templateBuilder.Append("                                <td>\r\n");
	templateBuilder.Append("                                    <div class=\"i_date\" style=\"float: right\">\r\n");
	templateBuilder.Append("                                        " + anninfo.Postdate.ToString().Trim() + "</div>\r\n");
	templateBuilder.Append("                                    </li>\r\n");
	templateBuilder.Append("                                </td>\r\n");
	templateBuilder.Append("                            </tr>\r\n");

	}	//end loop

	templateBuilder.Append("                        </table>\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                </tr>\r\n");
	templateBuilder.Append("                <tr>\r\n");
	templateBuilder.Append("                    <td style=\"height: 25px; width: 116px; background: url(images/index/def_left02.jpg) no-repeat;\r\n");
	templateBuilder.Append("                        background-color: #F7F7F7\">\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                    <td style=\"height: 25px; width: 116px; background: url(images/index/def_mid03.jpg) no-repeat;\">\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                </tr>\r\n");
	templateBuilder.Append("                <tr>\r\n");
	templateBuilder.Append("                    <td bgcolor=\"f7f7f7\" width=\"116\" height=\"121\" background=\"images/index/def_left04.jpg\">\r\n");
	templateBuilder.Append("                        <div id=\"standard\">\r\n");
	templateBuilder.Append("                            <marquee scrollamount=\"2\" width=\"100\" height=\"88\" scrolldelay=\"100\" direction=\"up\"\r\n");
	templateBuilder.Append("                                onmouseover=\"this.stop()\" onmouseout=\"this.start()\">\r\n");
	templateBuilder.Append("			            <a href=\"http://www.cqit.edu.cn/\" target=\"_blank\">重庆工学院</a><br />\r\n");
	templateBuilder.Append("			            <a href=\"http://cs.cqit.edu.cn/\" target=\"_blank\">计算机学院</a><br />\r\n");
	templateBuilder.Append("			            <a href=\"http://nicweb.cqit.edu.cn/\" target=\"_blank\">网络信息中心</a><br />\r\n");
	templateBuilder.Append("			            <a href=\"http://jsjzx.cqit.edu.cn/\" target=\"_blank\">计算机中心</a><br />\r\n");
	templateBuilder.Append("			            <a href=\"http://www.intel.com/cn\" target=\"_blank\">Intel(中国)</a><br />\r\n");
	templateBuilder.Append("			     </marquee>\r\n");
	templateBuilder.Append("                        </div>\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                    <td background=\"images/index/def_mid04.jpg\" width=\"452\" height=\"121\" align=\"left\">\r\n");
	templateBuilder.Append("                        <div class=\"mainbodyfrm\">\r\n");
	templateBuilder.Append("                            <table height=\"88%\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");

	int newsinfo__loop__id=0;
	foreach(ArticleInfo newsinfo in newslist)
	{
		newsinfo__loop__id++;

	templateBuilder.Append("                                <tr>\r\n");
	templateBuilder.Append("                                    <td>\r\n");
	templateBuilder.Append("                                        <div class=\"i_title\">\r\n");
	templateBuilder.Append("                                            [" + newsinfo.Columnname.ToString().Trim() + "]&nbsp;<a href=\"showarticle-" + newsinfo.Articleid.ToString().Trim() + ".aspx\">" + newsinfo.Title.ToString().Trim() + "</a>\r\n");
	templateBuilder.Append("                                        </div>\r\n");
	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                    <td>\r\n");
	templateBuilder.Append("                                        <div class=\"i_date\" style=\"float: right\">\r\n");
	templateBuilder.Append("                                            " + newsinfo.Postdate.ToString().Trim() + "</div>\r\n");
	templateBuilder.Append("                                    </td>\r\n");
	templateBuilder.Append("                                </tr>\r\n");

	}	//end loop

	templateBuilder.Append("                            </table>\r\n");
	templateBuilder.Append("                        </div>\r\n");
	templateBuilder.Append("                        <br />\r\n");
	templateBuilder.Append("                    </td>\r\n");
	templateBuilder.Append("                </tr>\r\n");
	templateBuilder.Append("            </table>\r\n");
	templateBuilder.Append("        </td>\r\n");
	templateBuilder.Append("        <td background=\"images/index/def_right.jpg\" height=\"261\" width=\"233\">\r\n");
	templateBuilder.Append("        </td>\r\n");
	templateBuilder.Append("    </tr>\r\n");
	templateBuilder.Append("</table>\r\n");

	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("      <!--footer-->\r\n");
	templateBuilder.Append("	<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("	<tr height=\"91\">\r\n");
	templateBuilder.Append("	<td width=\"800\" background=\"images/index/def_foot01.jpg\">\r\n");
	templateBuilder.Append("	</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("	<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
	templateBuilder.Append("	<tr height=\"73\">\r\n");
	templateBuilder.Append("	<td align=\"center\" style=\"background:#3C458A; width:800px; color:#FFF\">\r\n");
	templateBuilder.Append("	       <span class=\"menudiv STYLE4\" title=\"执行时间:" + processtime.ToString() + ":查询数:" + querycount.ToString() + "\">版权所有 重庆工学院计算机协会<br />\r\n");
	templateBuilder.Append("      Copyright &copy;2007 All Rights Reserved<br />\r\n");
	templateBuilder.Append("      推荐使用IE6.0在1024*768分辨率下浏览</span>	</td>\r\n");
	templateBuilder.Append("	</tr>\r\n");
	templateBuilder.Append("	</table>\r\n");
	templateBuilder.Append("    </div>\r\n");
	templateBuilder.Append("    </form>\r\n");
	templateBuilder.Append("</body>\r\n");
	templateBuilder.Append("</html>\r\n");


	templateBuilder.Append("<!--" + querycount.ToString() + "<br />\r\n");
	templateBuilder.Append("" + querydetail.ToString() + "<br />\r\n");
	templateBuilder.Append("" + processtime.ToString() + "秒<br />-->\r\n");

	Response.Write(templateBuilder.ToString());
}
</script>
