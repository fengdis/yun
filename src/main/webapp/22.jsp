<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '22.jsp' starting page</title>
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/easyui1.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui1.4/themes/icon.css">
    <script type="text/javascript" src="js/easyui1.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui1.4/locale/easyui-lang-zh_CN.js"></script>
<SCRIPT type="text/javascript">
$(function (){
	$('#tt').tree({    
	    url:'cloud/tree.do',
	    lines:true
	});
});

</SCRIPT>
  </head>
  
  <body>
    This is my JSP page. <br>
    <ul id="tt"></ul>  
  </body>
</html>
