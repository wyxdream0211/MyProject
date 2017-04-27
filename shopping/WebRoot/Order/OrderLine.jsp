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
                  <a href=index.jsp>清软电子商务门户</a> → 订单详情
                </td>
                </tr>
		</table>
              <br>
         


		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" >
		<tr>
			<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户信息</b></font></td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle align=right width="50%"><b>用户名</b>：</td>
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
			
			<td class="tablebody1" align="left">${sessionScope.fk }
			</td>
			
		</tr>
		<tr>
		<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"></font><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品购物清单</b></td>
		</tr>
		
	</table>
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1 id="table3">
		
                
		<tr>
			<td class=tablebody2 valign=middle align=center width="">1</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;商品名称</td>
			<td class=tablebody2 valign=middle align=center width="">单价</td>
			<td class=tablebody1 valign=middle align=center width="">数量</td>
			<td class=tablebody2 valign=middle align=left width="">小计</td>
		</tr>
                
		
			<c:forEach items="${sessionScope.orderline}" var="orderl" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<a href="productDetailServlet?productid=${orderl.productid }">${orderl.name}</a></td>
				<td class=tablebody2 valign=middle align=center width="">￥${orderl.baseprice }</td>
				<td class=tablebody1 valign=middle width="">${orderl.num}</td>
				<td class=tablebody2 valign=middle align=center width="">￥${orderl.num2 }</td>
				
				
			</tr>
			</c:forEach>
			<tr>
			<td class=tablebody1 valign=middle align=center colspan="4">　</td>
			<td class=tablebody1 valign=middle align=left width="">合计：<font color="#ff0000"><b>￥${sessionScope.sum }</b></font></td>
			</tr>
		</table>

<jsp:include page="../foot.jsp"/>

 
