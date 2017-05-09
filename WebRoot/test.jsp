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
	访问系统环境变量：
	<s:property value="@java.lang.System@getenv('JAVA_HOME')" />
	<br /> 圆周率的值：
	<s:property value="@java.lang.Math@PI" />
	<br />
	<h2>s:if标签测试</h2>
	<!-- 在Stack Context中定义一个age属性，其值为29 -->
	<s:set name="age" value="29" />
	<!-- 如果Stack Context中的age属性大于60 -->
	<s:if test="#age>60">
	老年人
</s:if>
	<!-- 如果Stack Context中的age属性大于35 -->
	<s:elseif test="#age>35">
	中年人
</s:elseif>
	<!-- 如果Stack Context中的age属性大于15 -->
	<s:elseif test="#age>15">
	青年人
</s:elseif>
	<s:else>
	少年
</s:else>
	<h2>
		iterator标签
		<h2 />
		<table border="1" width="300">
			<!-- 迭代输出List集合 -->
			<s:iterator value="{'疯狂Java讲义',
	'轻量级Java EE企业应用实战',
	'疯狂iOS讲义'}"
				id="name" status="st">
				<tr <s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
					<td><s:property value="name" /></td>
				</tr>
			</s:iterator>
		</table>
		<table border="1" width="350">
			<tr>
				<th>书名</th>
				<th>作者</th>
			</tr>
			<!-- 对指定的Map对象进行迭代输出,并指定status属性 -->
			<s:iterator
				value="#{'疯狂Java讲义':'李刚',
	'轻量级Java EE企业应用实战':'李刚' ,
	'疯狂iOS讲义':'李刚'}"
				id="score" status="st">
				<!-- 根据当前被迭代元素的索引是否为奇数来决定是否使用背景色 -->
				<tr <s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
					<!-- 输出Map对象里Entry的key -->
					<td><s:property value="key" /></td>
					<!-- 输出Map对象里Entry的value -->
					<td><s:property value="value" /></td>
				</tr>
			</s:iterator>
		</table>
		<h2>使用s:append标签拼接两个集合</h2>
		<!-- 使用append标签将两个集合拼接成新的集合，
	新集合的名字是newList，新集合放入Stack Context中 -->
		<s:append var="newList">
			<s:param value="{'疯狂Java讲义',
		'轻量级Java EE企业应用实战',
		'疯狂iOS讲义'}" />
			<s:param
				value="{'http://www.crazyit.org', 
		'http://www.fkit.org'}" />
		</s:append>
		<table border="1" width="260">
			<!-- 使用iterator迭代newList集合 -->
			<s:iterator value="#newList" status="st" id="ele">
				<tr>
					<td><s:property value="#st.count" /></td>
					<td><s:property value="ele" /></td>
				</tr>
			</s:iterator>
		</table>
		<h2>使用s:generator生成集合</h2>
		<table border="1" width="240">
			<!-- 使用generator标签将指定字符串解析成Iterator集合
	在generator标签内，得到的List集合位于ValueStack顶端 -->
			<s:generator val="'疯狂Java讲义
	,轻量级Java EE企业应用实战,
	疯狂iOS讲义'"
				separator=",">
				<!-- 没有指定迭代哪个集合，直接迭代ValueStack顶端的集合 -->
				<s:iterator status="st">
					<tr
						<s:if test="#st.odd">
		style="background-color:#bbbbbb"</s:if>>
						<td><s:property /></td>
					</tr>
				</s:iterator>
			</s:generator>
		</table>
		<h2>使用s:merge标签迭代Map</h2>
		<s:merge id="newList">
			<s:param value="{'疯狂Java讲义',
		'轻量级Java EE企业应用实战',
		'疯狂iOS讲义'}" />
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
		<h2>bean标签</h2>
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
