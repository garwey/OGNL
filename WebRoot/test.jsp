<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>OGNL</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	����ϵͳ����������
	<s:property value="@java.lang.System@getenv('JAVA_HOME')" />
	<br /> Բ���ʵ�ֵ��
	<s:property value="@java.lang.Math@PI" />
	<br />
	<h2>s:if��ǩ����</h2>
	<!-- ��Stack Context�ж���һ��age���ԣ���ֵΪ29 -->
	<s:set name="age" value="29" />
	<!-- ���Stack Context�е�age���Դ���60 -->
	<s:if test="#age>60">
	������
</s:if>
	<!-- ���Stack Context�е�age���Դ���35 -->
	<s:elseif test="#age>35">
	������
</s:elseif>
	<!-- ���Stack Context�е�age���Դ���15 -->
	<s:elseif test="#age>15">
	������
</s:elseif>
	<s:else>
	����
</s:else>
	<h2>
		iterator��ǩ
		<h2 />
		<table border="1" width="300">
			<!-- �������List���� -->
			<s:iterator value="{'���Java����',
	'������Java EE��ҵӦ��ʵս',
	'���iOS����'}"
				id="name" status="st">
				<tr <s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
					<td><s:property value="name" /></td>
				</tr>
			</s:iterator>
		</table>
		<table border="1" width="350">
			<tr>
				<th>����</th>
				<th>����</th>
			</tr>
			<!-- ��ָ����Map������е������,��ָ��status���� -->
			<s:iterator
				value="#{'���Java����':'���',
	'������Java EE��ҵӦ��ʵս':'���' ,
	'���iOS����':'���'}"
				id="score" status="st">
				<!-- ���ݵ�ǰ������Ԫ�ص������Ƿ�Ϊ�����������Ƿ�ʹ�ñ���ɫ -->
				<tr <s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
					<!-- ���Map������Entry��key -->
					<td><s:property value="key" /></td>
					<!-- ���Map������Entry��value -->
					<td><s:property value="value" /></td>
				</tr>
			</s:iterator>
		</table>
		<h2>ʹ��s:append��ǩƴ����������</h2>
		<!-- ʹ��append��ǩ����������ƴ�ӳ��µļ��ϣ�
	�¼��ϵ�������newList���¼��Ϸ���Stack Context�� -->
		<s:append var="newList">
			<s:param value="{'���Java����',
		'������Java EE��ҵӦ��ʵս',
		'���iOS����'}" />
			<s:param
				value="{'http://www.crazyit.org', 
		'http://www.fkit.org'}" />
		</s:append>
		<table border="1" width="260">
			<!-- ʹ��iterator����newList���� -->
			<s:iterator value="#newList" status="st" id="ele">
				<tr>
					<td><s:property value="#st.count" /></td>
					<td><s:property value="ele" /></td>
				</tr>
			</s:iterator>
		</table>
		<h2>ʹ��s:generator���ɼ���</h2>
		<table border="1" width="240">
			<!-- ʹ��generator��ǩ��ָ���ַ���������Iterator����
	��generator��ǩ�ڣ��õ���List����λ��ValueStack���� -->
			<s:generator val="'���Java����
	,������Java EE��ҵӦ��ʵս,
	���iOS����'"
				separator=",">
				<!-- û��ָ�������ĸ����ϣ�ֱ�ӵ���ValueStack���˵ļ��� -->
				<s:iterator status="st">
					<tr
						<s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
						<td><s:property /></td>
					</tr>
				</s:iterator>
			</s:generator>
		</table>
		<h2>ʹ��s:merge��ǩ����Map</h2>
		<s:merge id="newList">
			<s:param value="{'���Java����',
		'������Java EE��ҵӦ��ʵս',
		'���iOS����'}" />
			<s:param
				value="{'http://www.crazyit.org', 
		'http://www.fkit.org'}" />
		</s:merge>
		<table border="1" width="240">
			<s:iterator value="#newList" status="st">
				<tr <s:if test="#st.odd">style="background-color:#bbbbbb"</s:if>>
					<td><s:property /></td>
				</tr>
			</s:iterator>
		</table>
		<h2>bean��ǩ</h2>
		<s:bean name="Person" var="p">
			<s:param name="age" value="23" />
			<s:param name="name" value="Jack" />
			<s:property value="name" />
			<s:property value="age" />
		</s:bean>
		person:

		<s:debug />
</body>
</html>
