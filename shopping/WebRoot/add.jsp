<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="head.jsp"%>


<html>
	<body>
	
	<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>���������Ż�</a> ��
					<img border="0" src="images/dog.gif" width="19" height="18">
					���빺<font color="red"></font>�ﳵ��
                </td>
                </tr>
		</table>
            
	<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
			<tr>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>���</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>��Ʒ����</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>�۸�</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>����</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>�ϼ�</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>����</b></font></td>
			</tr>
	        
	         <c:forEach items="${sessionScope.plist}" var="pcart" begin="0" step="1" varStatus="stas">
			<form method="post" name="from1" action="<%=path %>/CartUpdateServlet?cartid=${pcart.productid }">
			<tr>
			
				<td class=tablebody2 valign=middle align=center width="100">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;${pcart.name}</td>
				<td class=tablebody2 valign=middle align=center width="100">��${pcart.baseprice }</td>
				<td class=tablebody1 valign=middle width="80">&nbsp;&nbsp;<input type="text" name="t1" value="${pcart.num}" size="4"/></td>
				<td class=tablebody2 valign=middle align=center width="100">��${pcart.num2}</td>
				<td class=tablebody1 valign=middle align=center width="200">
				<a href="CartdelServlet?cartid=${pcart.productid }"><input type="button" value="ɾ��"/> </a>
				<input type="submit" value="�����޸�" />
				
				</td>
			</tr>
			</form>
			
			
			</c:forEach >
			<tr>
			<td colspan="4" class=tablebody1 valign=middle>&nbsp;</td>
			<td  class=tablebody1 valign=middle style="color: red">�ܼۣ�${sessionScope.sum }</td>
			<td  class=tablebody1 valign=middle>&nbsp;</td>
			</tr>
			
        	<tr align="center">
        	<td class=tablebody2 valign=middle align=center width="100" colspan="6">
				<a href="order.html"><input type="button" value="�ύ����"/></a>
				<a href="index.jsp"><input type="button" value="��������"/></a>
				<a href="CartdelAllServlet"><input type="button" value="��չ��ﳵ"/></a>
			</td>
			</tr>
			
		</table>	
		
	</body>
</html>
<jsp:include page="foot.jsp"/>