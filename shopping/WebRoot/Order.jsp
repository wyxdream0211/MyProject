<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
                  <a href=index.jsp>������������Ż�</a> �� �����б�
        </td>
         </tr>
		</table>
              <br>
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
			<tr>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>���</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>�������</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>�������</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>����״̬</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>���ʽ</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>����</b></font></td>
			</tr>
			<c:forEach items="${sessionScope.orders}" var="order" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="100">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="400">&nbsp;&nbsp;${order.orderId}</td>
				<td class=tablebody2 valign=middle align=center width="150">��${order.cost }</td>
				<td class=tablebody1 valign=middle width="100">${order.status}</td>
				<td class=tablebody2 valign=middle width="100">${order.payType}</td>
				<td class=tablebody1 valign=middle align=center width="150">
				
				<a href="OrderLineServlet?orderid=${order.orderId}"><input type="button" value="��ϸ"/></a>
				<a href="OrderDelServlect?orderid=${order.orderId}"><input type="button" value="ɾ��"/></a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		
		
<jsp:include page="foot.jsp"/>
