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
    <link rel="stylesheet" type="text/css" href="css/buttons.css">
<SCRIPT type="text/javascript">
var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
$(function (){
	$('#tt').tree({    
	    url:'cloud/tree.do',
	    lines:true,
	    onClick: function(node){
			//alert(node.id);
			//alert(node.text);
			$("#path").val(node.id);
		}
	});
});
function copyOrMove(){
	//console.info(${param.dir});
	//alert(${param.dir}+${param.ids});
	$.post('${pageContext.request.contextPath}/cloud/copy.do', 
			{dir:$("#dir").val(),ids:$("#ids").val(),dst:$("#path").val(),flag:$("#flag").val()}, 
			function(j) {
				if (j.success) {
					parent.layer.close(index);
				}else{
					alert(json.msg);
				}
			}, 'json');
}
</SCRIPT>
  </head>
  
  <body>
    <ul id="tt"></ul>
    <hr><input type="hidden" id="dir" value="${param.dir}"/>
    <input type="hidden" id="ids" value="${param.ids}"/>
    <input type="hidden" id="flag" value="${param.flag}"/>
    <input type="hidden" id="path"/>
    <div align="right"><input type="button" class="button teal" value="确定" onclick="copyOrMove()" /></div>
  </body>
</html>
