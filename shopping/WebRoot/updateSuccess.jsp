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
                  <img src="../images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>清软电子商务门户</a> → 用户信息修改成功
                </td>
                </tr>
		</table>
              <br>

<form method="post" name="reg" action="<%=path %>/registerAction.do">
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" background="images/bg2.gif">
			<font color="#ffffff"><b>用户信息修改成功</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>用户名</b>：
			</td>
			<td width="60%" class="tablebody1">
			<input type="hidden" name="userid" value="${requestScope.user.userid }">
			${requestScope.user.username}
           </td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>密码</b>：
			
			</td>
			<td width="60%" class="tablebody1">
			${requestScope.user.password} </td>
		</tr>
		
		<tr>
			<td class="tablebody1"><b>所在地区</b>：</td>
			<td class="tablebody1">
			${requestScope.user.city}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>联系地址1</b>：</td>
			<td class="tablebody1">
            ${requestScope.user.street1}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>联系地址2</b>：</td>
			<td class="tablebody1">
			${requestScope.user.street2}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>邮编</b>：</td>
			<td class="tablebody1">
			${requestScope.user.zip} 
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>家庭电话</b>：</td>
			<td class="tablebody1">
			${requestScope.user.homephone} 
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>办公室电话</b>：</td>
			<td class="tablebody1">
			${requestScope.user.officephone}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>手机</b>：</td>
			<td class="tablebody1">
			${requestScope.user.cellphone}
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>Email地址</b>：
			</td>
			<td class="tablebody1">
			${requestScope.user.email}</td>
		</tr>
	</table>
</form>
<jsp:include page="foot.jsp"/>