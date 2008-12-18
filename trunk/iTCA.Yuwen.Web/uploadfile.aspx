<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="iTCA.Yuwen.Web.uploadfile" %>
<%@ Import namespace="iTCA.Yuwen.Data" %>
<%@ Import namespace="iTCA.Yuwen.Entity" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{
	/*
	This is a cached-file of template("\templates\uploadfile.htm"), it was created by LiteCMS.CN Template Engine.
	Please do NOT edit it.
	此文件为模板文件的缓存("\templates\uploadfile.htm"),由 LiteCMS.CN 模板引擎生成.
	所以请不要编辑此文件.
	*/
	base.OnInit(e);

	Response.Write(templateBuilder.ToString());
}
</script>