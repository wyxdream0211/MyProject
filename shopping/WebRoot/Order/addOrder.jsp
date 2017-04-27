<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
                  <a href=index.jsp>清软电子商务门户</a> → 确认订单
                </td>
                </tr>
		</table>
              <br>

<form method="post" name="reg" action="<%=path %>/OrderServlet">
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" >
		<tr>
			<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户信息<a href="UserUpdateServlet"><input type="button" value="修改"/></a></b></font></td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle align=right><b>用户名</b>：</td>
			<td class=tablebody1 valign=middle align="left">${requestScope.user.username }</td>
		</tr>
		
		
		<tr>
			<td class="tablebody2" align=right><b>联系地址</b>：</td>
			<td class="tablebody1" align="left">
			${requestScope.user.street1 }
			</td>
		</tr>
		
		<tr>
			<td class="tablebody2" align=right><b>邮编：</b></td>
			<td class="tablebody1" align="left">
			${requestScope.user.zip }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>家庭电话</b>：</td>
			<td class="tablebody1" align="left">
			${requestScope.user.homephone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2"  align="right"><b>办公室电话</b>：</td>
			<td class="tablebody1" align="left">
			${requestScope.user.officephone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>手机</b>：</td>
			<td class="tablebody1" align="left">
			${requestScope.user.cellphone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>Email地址</b>：<br></td>
			<td class="tablebody1" align="left">
			${requestScope.user.email }</td>
		</tr>
		<tr>
		<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;付款方式</b></font></td>
		</tr>
		<tr>
		<td class="tablebody2" align=right></td>
			
			<td class="tablebody1" align="left">
			<select name="fk" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
				<option value="邮局汇款">邮局汇款</option>
				<option value="货到付款">货到付款</option>
				<option value="银行转账">银行转账</option>
			</select>
			
			
		</tr>
		<tr>
		<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"></font><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品购物清单<a href="CartAddServlet"><input type="button" value="修 改"></a></b></td>
		</tr>
		
	</table>
	<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
			<c:forEach items="${sessionScope.plist}" var="pcart" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="100">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="400">&nbsp;&nbsp;${pcart.name}</td>
				<td class=tablebody2 valign=middle align=center width="150">单价：￥${pcart.baseprice }</td>
				<td class=tablebody1 valign=middle width="100">数量：${pcart.num}</td>
				<td class=tablebody2 valign=middle align=center width="150">小计：￥${pcart.num2 }</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="4" class=tablebody1 valign=middle>&nbsp;</td>
			<td  class=tablebody1 valign=middle style="color: red">总价：${sessionScope.sum }</td>
			
			</tr></table>
	<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align="center">
		请认真检查以上订单信息，确认无误后点击→
                 <a onclick="javascript:document.reg.submit();" style="cursor:hand"><img src="images/submit.gif"></a>
                
                </td>
                </tr>
		</table>
</form>

<jsp:include page="../foot.jsp"/>

 
