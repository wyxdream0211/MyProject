<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../head.jsp"%>
<!--�ļ��忪ʼ-->

		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>������������Ż�</a> �� ȷ�϶���
                </td>
                </tr>
		</table>
              <br>

<form method="post" name="reg" action="<%=path %>/OrderServlet">
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" >
		<tr>
			<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�û���Ϣ<a href="UserUpdateServlet"><input type="button" value="�޸�"/></a></b></font></td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle align=right><b>�û���</b>��</td>
			<td class=tablebody1 valign=middle align="left">${requestScope.user.username }</td>
		</tr>
		
		
		<tr>
			<td class="tablebody2" align=right><b>��ϵ��ַ</b>��</td>
			<td class="tablebody1" align="left">
			${requestScope.user.street1 }
			</td>
		</tr>
		
		<tr>
			<td class="tablebody2" align=right><b>�ʱࣺ</b></td>
			<td class="tablebody1" align="left">
			${requestScope.user.zip }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>��ͥ�绰</b>��</td>
			<td class="tablebody1" align="left">
			${requestScope.user.homephone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2"  align="right"><b>�칫�ҵ绰</b>��</td>
			<td class="tablebody1" align="left">
			${requestScope.user.officephone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>�ֻ�</b>��</td>
			<td class="tablebody1" align="left">
			${requestScope.user.cellphone }
			</td>
		</tr>
		<tr>
			<td class="tablebody2" align=right><b>Email��ַ</b>��<br></td>
			<td class="tablebody1" align="left">
			${requestScope.user.email }</td>
		</tr>
		<tr>
		<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ʽ</b></font></td>
		</tr>
		<tr>
		<td class="tablebody2" align=right></td>
			
			<td class="tablebody1" align="left">
			<select name="fk" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
				<option value="�ʾֻ��">�ʾֻ��</option>
				<option value="��������">��������</option>
				<option value="����ת��">����ת��</option>
			</select>
			
			
		</tr>
		<tr>
		<td colspan="2" valign=middle align=center height=25 background="images/bg2.gif" width="">
			<font color="#ffffff"></font><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ�����嵥<a href="CartAddServlet"><input type="button" value="�� ��"></a></b></td>
		</tr>
		
	</table>
	<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
			<c:forEach items="${sessionScope.plist}" var="pcart" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="100">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="400">&nbsp;&nbsp;${pcart.name}</td>
				<td class=tablebody2 valign=middle align=center width="150">���ۣ���${pcart.baseprice }</td>
				<td class=tablebody1 valign=middle width="100">������${pcart.num}</td>
				<td class=tablebody2 valign=middle align=center width="150">С�ƣ���${pcart.num2 }</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="4" class=tablebody1 valign=middle>&nbsp;</td>
			<td  class=tablebody1 valign=middle style="color: red">�ܼۣ�${sessionScope.sum }</td>
			
			</tr></table>
	<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align="center">
		�����������϶�����Ϣ��ȷ�����������
                 <a onclick="javascript:document.reg.submit();" style="cursor:hand"><img src="images/submit.gif"></a>
                
                </td>
                </tr>
		</table>
</form>

<jsp:include page="../foot.jsp"/>

 
