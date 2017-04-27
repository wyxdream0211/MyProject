<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.beans.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../head.jsp"%>
<!--文件体开始-->
		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>清软电子商务门户</a> → 产品明细
                </td>
                </tr>
		</table>
              <br>

	<form action="loginAction.do" method=post name="login">
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="images/bg2.gif" colspan="2"><p><font color="#ffffff"><b>${requestScope.productDetail.name }</b></font></td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="20%">【
			作&nbsp; 者 】</td>
			<td class=tablebody1 valign=middle width="80%">&nbsp;&nbsp;${requestScope.productDetail.writer }</td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="20%">【
			价&nbsp; 格 】</td>
			<td class=tablebody1 valign=middle width="80%">&nbsp;&nbsp;${requestScope.productDetail.baseprice }</td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="">【出 版 社】</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;${requestScope.productDetail.publish }</td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="">【 书&nbsp; 号
			】</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;${requestScope.productDetail.productid }</td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="">【 页&nbsp; 码
			】</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;${requestScope.productDetail.pages }</td>
		</tr>
		<tr>
			<td class=tablebody1 align=center width="" valign="top">【 简&nbsp; 介
			】</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;${requestScope.productDetail.description }</td>
		</tr>
		<tr>
			<td class=tablebody1 valign=middle align=center width="">　</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<img border="0" src="${requestScope.productDetail.images }" width="127" height="180"></td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle align=center colspan="2">
			<a href="CartAddServlet?productid=${requestScope.productDetail.productid  }"><img border="0" src="images/buycar.gif" width="92" height="21"></a> </td>
		</tr>
		</table>
	</form>
	
	<jsp:include page="../foot.jsp"/>