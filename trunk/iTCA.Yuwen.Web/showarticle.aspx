<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.showarticle" %>

<%@ Import namespace="iTCA.Yuwen.Data" %>
<%@ Import namespace="iTCA.Yuwen.Entity" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Discuz!NT Template Engine at 2008/7/16 15:39:04.
		本页面代码由模板引擎生成于 2008/7/16 15:39:04. 
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
	templateBuilder.Append("			<li><a id=\"index\" href=\"index.aspx\">首 页</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"ann\" href=\"showcolumn-1-1.aspx\">公 告</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"news\" href=\"news.aspx\">新 闻</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"act\" href=\"showcolumn-5-1.aspx\">活 动</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"book\" href=\"book/Index.aspx?cid=1\">留 言 板</a></li>\r\n");
	templateBuilder.Append("			<li class=\"menudiv\"></li>\r\n");
	templateBuilder.Append("			<li><a id=\"other\" href=\"other/Index.aspx\">其他相关</a></li>\r\n");
	templateBuilder.Append("		 </ul>\r\n");
	templateBuilder.Append("		 </div>         \r\n");
	templateBuilder.Append("     </div>\r\n");
	templateBuilder.Append("     <div id=\"Div1\" style=\"clear:both; background:url(images/index/banner1.gif); height:29px\"></div>\r\n");
	templateBuilder.Append("       <div>\r\n");


	templateBuilder.Append("<div id=\"pagebody\">\r\n");
	templateBuilder.Append("    <div id=\"content\" style=\"background-image: url(images/showback.jpg)\">\r\n");
	templateBuilder.Append("        <div class=\"title\">\r\n");
	templateBuilder.Append("            <strong style=\"font-size: 16px\">" + articleinfo.Title.ToString().Trim() + "</strong>\r\n");
	templateBuilder.Append("        </div>\r\n");
	templateBuilder.Append("        <div class=\"information\" style=\"float: right; padding-right: 40px\">\r\n");
	templateBuilder.Append("            发布人:" + articleinfo.Username.ToString().Trim() + " &nbsp; 发布时间: " + articleinfo.Postdate.ToString().Trim() + "\r\n");
	templateBuilder.Append("        </div>\r\n");
	templateBuilder.Append("        <br />\r\n");
	templateBuilder.Append("        <div class=\"content\" style=\"text-align: left; padding: 10px 40px\">\r\n");
	templateBuilder.Append("            " + articleinfo.Content.ToString().Trim() + "</div>\r\n");
	templateBuilder.Append("    </div>\r\n");
	templateBuilder.Append("</div>\r\n");

	templateBuilder.Append("</div>\r\n");
	templateBuilder.Append("      <div id = \"footer\" title=\"执行时间:" + processtime.ToString() + ":查询数:" + querycount.ToString() + "\">&copy;iTCA 重庆工学院计算机协会</div>\r\n");
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
