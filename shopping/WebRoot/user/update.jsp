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
                  <a href=index.jsp>���������Ż�</a> ��
					<img border="0" src="images/dog.gif" width="19" height="18">
				�޸�<font color="red"></font>��Ϣ
                </td>
                </tr>
		</table>
              <br>

<form method="post" name="reg" action="<%=path %>/registerAction.do">
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" background="../images/bg2.gif">
			<font color="#ffffff"><b>�û���Ϣ�޸�</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>�û���</b>��<br>
			ע���û�����������Ϊ0��16�ֽ�</td>
			<td width="60%" class="tablebody1">
			<input type="hidden" name="userid" value="${requestScope.user.userid }">
			<input type="text" name="username" maxLength="8" size="32" disabled value="${requestScope.user.username }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>����(����6λ������8λ)</b>��<br>
			���������룬���ִ�Сд��<br>
			�벻Ҫʹ���κ����� \'*\'��\' \' �� HTML �ַ�'
			</td>
			<td width="60%" class="tablebody1">
			<input type="password" maxLength="8" size="32" name="password" value="${requestScope.user.password }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>����(����6λ������8λ)</b>��<br>
			������һ��ȷ��</td>
			<td class="tablebody1">
			<input type="password" maxLength="8" size="32" name="password2" value="${requestScope.user.password }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td class="tablebody1"><b>���ڵ���</b>��</td>
			<td class="tablebody1">
			<select name="country" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
				<option value="�й�">�й�</option>
				<option value="�й����">�й����</option>
				<option value="�й�̨��">�й�̨��</option>
			</select>
			<select name="province" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
                <option value="����" selected>����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="�㶫" >�㶫</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="�ӱ�" >�ӱ�</option>

                <option value="����" >����</option>

                <option value="���" >���</option>

                <option value="������" >������</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="���ɹ�" >���ɹ�</option>

                <option value="����" >����</option>

                <option value="�ຣ" >�ຣ</option>

                <option value="�Ĵ�" >�Ĵ�</option>

                <option value="ɽ��" >ɽ��</option>

                <option value="�Ϻ�" >�Ϻ�</option>

                <option value="����" >����</option>

                <option value="ɽ��" >ɽ��</option>

                <option value="���" >���</option>

                <option value="̨��" >̨��</option>

                <option value="�½�" >�½�</option>

                <option value="����" >����</option>

                <option value="����" >����</option>

                <option value="�㽭" >�㽭</option>

                <option value="����" >����</option>
			</select>ʡ
			<input type="text" size="8" name="city" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000" value="${requestScope.user.city }">��/��</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ϵ��ַ1</b>��</td>
			<td class="tablebody1">
			<input type="text" size="64" maxlength="32" name="street1" value="${requestScope.user.street1 }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ϵ��ַ2</b>��</td>
			<td class="tablebody1">
			<input type="text" size="64" maxlength="32" name="street2" value="${requestScope.user.street2 }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�ʱ�</b>��</td>
			<td class="tablebody1">
			<input type="text" size="32" maxlength="8" name="zip" value="${requestScope.user.zip }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>��ͥ�绰</b>��</td>
			<td class="tablebody1">
			<input type="text" size="32" maxlength="16" name="homephone" value="${requestScope.user.homephone }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�칫�ҵ绰</b>��</td>
			<td class="tablebody1">
			<input type="text" size="32" maxlength="16" name="officephone" value="${requestScope.user.officephone }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>�ֻ�</b>��</td>
			<td class="tablebody1">
			<input type="text" size="32" maxlength="16" name="cellphone" value="${requestScope.user.cellphone }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>Email��ַ</b>��<br>
			��������Ч���ʼ���ַ</td>
			<td class="tablebody1">
			<input maxLength="50" size="32" maxlength="32" name="email" value="${requestScope.user.email }" style="font-family: Tahoma,Verdana,����; font-size: 12px; line-height: 15px; color: #000000"></td>
		</tr>
		<tr>
			<td class="tablebody2" valign="middle" colspan="2" align="center">
			<input type="submit" value="�� ��"></td>
		</tr>
	</table>
</form>
<jsp:include page="../foot.jsp"/>