<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>oa</title>
<meta name="content-type" content="text/html; charset=UTF-8">
<jsp:include page="pub.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$('#index_regDialog').show().dialog({
		modal : false,
		closable : false,
		iconCls : 'ext-icon-lock_open',
		buttons : [ {
			text : '登录',
			handler : function() {
				location.replace('index.jsp');
			}
		}, {
			id : 'loginBtn',
			text : '注册',
			handler : function() {
				regFun();
			}
		} ],
		onOpen : function() {
			$('form :input:first').focus();
			$('form :input').keyup(function(event) {
				if (event.keyCode == 13) {
					regFun();
				}
			});
		}
	});
	
	var regFun = function(){
		if($("#index_regForm").form('validate')){
			$('#loginBtn').linkbutton('disable');
			$.messager.progress({
				text : '数据加载中....'
			});
			$.post('${pageContext.request.contextPath}/user/reg.do',$("#index_regForm").serialize(),
				function(j){
			        if(j.success){
			        	//location.replace('index.jsp');
			        }
			        $.messager.progress('close');
			        $.messager.show({
			        	title:'提示',
			        	msg:j.msg,
			        	timeout:5000,
			        	showType:'slide'
			        });
			        $('#loginBtn').linkbutton('enable');
				},'json');
		}
	}
});

</script>

</head>
<body>
<div id="index_regDialog" class="easyui-dialog" title="系统注册">
	<form id="index_regForm" method="post">
		<table>
			<tr>
				<th>用户名</th>
				<td><input name="userName" class="easyui-validatebox" data-options="required:true,missingMessage:'用户名必填'" /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input id="pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'密码必填'" /></td>
			</tr>
			<tr>
				<th>重复密码</th>
				<td><input id="repwd" type="password" class="easyui-validatebox" data-options="required:true" validType="equalTo['#pwd']" /></td>
			</tr>
			<tr>
				<th>邮箱</th>
				<td><input name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>