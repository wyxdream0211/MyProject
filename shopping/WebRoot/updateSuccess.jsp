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
                  <img src="../images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>������������Ż�</a> �� �û���Ϣ�޸ĳɹ�
                </td>
                </tr>
		</table>
              <br>

<form method="post" name="reg" action="<%=path %>/registerAction.do">
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" background="images/bg2.gif">
			<font color="#ffffff"><b>�û���Ϣ�޸ĳɹ�</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>�û���</b>��
			</td>
			<td width="60%" class="tablebody1">
			<input type="hidden" name="userid" value="${requestScope.user.userid }">
			${requestScope.user.username}
           </td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>����</b>��
			
			</td>
			<td width="60%" class="tablebody1">
			${requestScope.user.password} </td>
		</tr>
		
		<tr>
			<td class="tablebody1"><b>���ڵ���</b>��</td>
			<td class="tablebody1">
			${requestScope.user.city}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ϵ��ַ1</b>��</td>
			<td class="tablebody1">
            ${requestScope.user.street1}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ϵ��ַ2</b>��</td>
			<td class="tablebody1">
			${requestScope.user.street2}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�ʱ�</b>��</td>
			<td class="tablebody1">
			${requestScope.user.zip} 
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ͥ�绰</b>��</td>
			<td class="tablebody1">
			${requestScope.user.homephone} 
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�칫�ҵ绰</b>��</td>
			<td class="tablebody1">
			${requestScope.user.officephone}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�ֻ�</b>��</td>
			<td class="tablebody1">
			${requestScope.user.cellphone}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>Email��ַ</b>��
			</td>
			<td class="tablebody1">
			${requestScope.user.email}</td>
		</tr>
	</table>
</form>
<jsp:include page="foot.jsp"/>