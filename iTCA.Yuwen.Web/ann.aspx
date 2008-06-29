<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.ann" %>

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
	templateBuilder.Append("<head>\r\n");
	templateBuilder.Append("    <title>Untitled Page</title>\r\n");
	templateBuilder.Append("</head>\r\n");
	templateBuilder.Append("<body>\r\n");
	templateBuilder.Append("iTCA公告<br />\r\n");
	templateBuilder.Append("    <ul>\r\n");

	int anninfo__loop__id=0;
	foreach(ArticleInfo anninfo in annlist)
	{
		anninfo__loop__id++;

	templateBuilder.Append("            <li>[" + anninfo.Columnname.ToString().Trim() + "]" + anninfo.Title.ToString().Trim() + "&nbsp;&nbsp;&nbsp;" + anninfo.Username.ToString().Trim() + "&nbsp;&nbsp;" + anninfo.Postdate.ToString().Trim() + "</li>\r\n");

	}	//end loop

	templateBuilder.Append("    </ul>\r\n");
	templateBuilder.Append("" + querycount.ToString() + "<br />\r\n");
	templateBuilder.Append("" + querydetail.ToString() + "<br />\r\n");
	templateBuilder.Append("" + processtime.ToString() + "秒<br />\r\n");
	templateBuilder.Append("</body>\r\n");
	templateBuilder.Append("</html>\r\n");

	Response.Write(templateBuilder.ToString());
}
</script>
