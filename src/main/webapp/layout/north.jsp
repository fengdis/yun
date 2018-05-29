<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	function changeTheme(theme) {
		var easyuiTheme = $('#easyuiTheme');
		var url = easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/' + theme + '/easyui.css';
		easyuiTheme.attr('href', href);

		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				try {
					$(ifr).contents().find('#easyuiTheme').attr('href', href);
				} catch (e) {
					try {
						ifr.contentWindow.document.getElementById('easyuiTheme').href = href;
					} catch (e) {
					}
				}
			}
		}

		$.cookie('easyuiTheme', theme, {
			expires : 7
		});
	}
	function logoutFun() {
		/* $.post('logout.do', function(j) {
			location.replace('index.jsp');
		}, 'json'); */
		location.href='logout.do';
	}
	function lockWindowFun() {
		$.post('user/logout.do', function(j) {
			$('#loginDialog').dialog('open');
		}, 'json');
	}
	$(function() {
		$('#loginDialog').show().dialog({
			modal : true,
			closable : false,
			iconCls : 'ext-icon-lock_open',
			buttons : [ {
				id : 'loginBtn',
				text : '登录',
				handler : function() {
					loginFun();
				}
			} ],
			onOpen : function() {
				$('#weirpwd').val('');
				$('form :input').keyup(function(event) {
					if (event.keyCode == 13) {
						loginFun();
					}
				});
			}
		}).dialog('close');

	});
	function loginFun() {
		if ($("#loginForm").form('validate')) {
			$('#loginBtn').linkbutton('disable');
			$.post('user/login.do', $("#loginForm").serialize(), function(j) {
				if (j.success) {
					$('#loginDialog').dialog('close');
				} else {
					$.messager.alert('提示', j.msg, 'error', function() {
						$('#weirname').focus();
					});
				}
				$('#loginBtn').linkbutton('enable');
			}, 'json');
		}
	}
</script>
<div id="sessionInfoDiv" style="position: absolute; right: 10px; top: 5px;">
	<strong>${U.username}</strong>
</div>
<div style="position: absolute; right: 0px; bottom: 0px;">
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'ext-icon-rainbow'">更换皮肤</a> <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'ext-icon-cog'">控制面板</a> <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_zxMenu',iconCls:'ext-icon-disconnect'">注销</a>
</div>
<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="changeTheme('default');" title="default">default</div>
	<div onclick="changeTheme('gray');" title="gray">gray</div>
	<div onclick="changeTheme('metro');" title="metro">metro</div>
	<div onclick="changeTheme('bootstrap');" title="bootstrap">bootstrap</div>
	<div onclick="changeTheme('black');" title="black">black</div>
	<div class="menu-sep"></div>
	<div onclick="changeTheme('metro-blue');" title="metro-blue">metro-blue</div>
	<div onclick="changeTheme('metro-gray');" title="metro-gray">metro-gray</div>
	<div onclick="changeTheme('metro-green');" title="metro-green">metro-green</div>
	<div onclick="changeTheme('metro-orange');" title="metro-orange">metro-orange</div>
	<div onclick="changeTheme('metro-red');" title="metro-red">metro-red</div>
</div>
<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
	<div data-options="iconCls:'ext-icon-user_edit'" onclick="$('#passwordDialog').dialog('open');">修改密码</div>
	<div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-user'" onclick="showMyInfoFun();">我的信息</div>
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div data-options="iconCls:'ext-icon-lock'" onclick="lockWindowFun();">锁定窗口</div>
	<div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-door_out'" onclick="logoutFun();">退出系统</div>
</div>

<div id="loginDialog" title="解锁登录" style="display: none;">
	<form method="post" id="loginForm" onsubmit="return false;">
		<table class="table">
			<tr>
				<th width="50">登录名</th>
				<td><input id="weirname" name="weirname" readonly="readonly" value="${U.username}" /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input id="weirpwd" name="weirpwd" type="password" class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
		</table>
	</form>
</div>