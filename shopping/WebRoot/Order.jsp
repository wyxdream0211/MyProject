<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="head.jsp"%>
<!--文件体开始-->

		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>清软电子商务门户</a> → 订单列表
        </td>
         </tr>
		</table>
              <br>
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
			<tr>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>序号</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>订单编号</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>订单金额</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>订单状态</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>付款方式</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>操作</b></font></td>
			</tr>
			<c:forEach items="${sessionScope.orders}" var="order" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="100">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="400">&nbsp;&nbsp;${order.orderId}</td>
				<td class=tablebody2 valign=middle align=center width="150">￥${order.cost }</td>
				<td class=tablebody1 valign=middle width="100">${order.status}</td>
				<td class=tablebody2 valign=middle width="100">${order.payType}</td>
				<td class=tablebody1 valign=middle align=center width="150">
				
				<a href="OrderLineServlet?orderid=${order.orderId}"><input type="button" value="详细"/></a>
				<a href="OrderDelServlect?orderid=${order.orderId}"><input type="button" value="删除"/></a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		
		
<jsp:include page="foot.jsp"/>
