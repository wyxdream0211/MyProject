<%@ page language="java" import="com.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="head.jsp"%>
<!--�ļ��忪ʼ-->

		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>������������Ż�</a> �� �û���¼
                </td>
                </tr>
		</table>
              <br>

	<form action="<%=path %>/loginAction.do" method="post" name="login">
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle colspan=2 align=center height=25 background="images/bg2.gif" ><font color="#ffffff"><b>���������û����������¼</b></font></td>
		</tr>
		<tr>
		<td valign=middle align=right class=tablebody1><%=I18nUtil.getResourceBundle(request.getLocale()).getString("username") %></td>
			<td valign=middle class=tablebody1>
			    <INPUT name="username" type="text" value="${requestScope.name }"> &nbsp;
				<a href="register.jsp">û��ע�᣿</a>&nbsp;<font style="color:red">${requestScope.fail }</font>
			</td>
		</tr>
		<tr>
			<td valign=middle align=right class=tablebody1><%=I18nUtil.getResourceBundle(request.getLocale()).getString("password") %></td>
			<td valign=middle class=tablebody1><INPUT name=password type=password> &nbsp; </td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle colspan=2 align=center><input type="button" value="<%=I18nUtil.getResourceBundle(request.getLocale()).getString("login") %>" onclick="javascript:checkMe()"></td>
		</tr>
		</table>
	</form>
	
<jsp:include page="foot.jsp"/>