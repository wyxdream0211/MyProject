<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.beans.*" %>
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
                  <a href=index.jsp>���������Ż�</a> ��
					<img border="0" src="images/dog.gif" width="19" height="18">
					��ӭ<font color="red"></font>���٣�
                </td>
        <form action="<%=path %>/FindServlet" method="post" name="sousuo">
        
        <td align="right">��Ʒ���ƣ�
        <input type="text" size="20" name="name"/>
        <input type="submit" value="����"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </form>
        
         
                </tr>
		</table>
              <br>

	
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
			<tr>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>���</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>��Ʒ����</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>�۸�</b></font></td>
				<td valign=middle align=center height=25 background="images/bg2.gif" width=""><font color="#ffffff"><b>����</b></font></td>
			</tr>
	        <%--<% List list = (List)request.getAttribute("productList");
	           if(list!=null && list.size()>0){
	           	 for(int i=0;i<list.size();i++){
	           	   Product product = (Product)list.get(i); %>--%>
	        <c:forEach items="${requestScope.productList}" var="product" begin="0" step="1" varStatus="stas">
			<tr>
				<td class=tablebody2 valign=middle align=center width="">${ stas.count }</td>
				<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<a href="productDetailServlet?productid=${product.productid }">${product.name }</a></td>
				<td class=tablebody2 valign=middle align=center width="">${product.baseprice }</td>
				<td class=tablebody1 valign=middle align=center width=""><a href="CartAddServlet?productid=${product.productid }"><img border="0" src="images/car_new.gif" width="97" height="18"></a> </td>
			</tr>
			</c:forEach>
        	
        	
		</table>
		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=middle>
		
		<a href="PageServlet?pageindex=${(sessionScope.pageindex)-1 }">[��һҳ]</a>
		&nbsp;&nbsp;&nbsp;<a href="PageServlet?pageindex=1"><font style="color:red">1</font></a>
		&nbsp;&nbsp;&nbsp;<a href="PageServlet?pageindex=2">2</a>&nbsp;&nbsp;&nbsp;<a href="PageServlet?pageindex=3">3</a>&nbsp;&nbsp;&nbsp;...&nbsp;&nbsp;&nbsp;
		<a href="PageServlet?pageindex=${(sessionScope.pageindex)+1 }">[��һҳ]</a>
                </td>
                </tr>
		</table>

		
	
	<jsp:include page="foot.jsp"/>
	