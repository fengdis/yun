<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>uploadify 多文件上传例子</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="js/upload/uploadify.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
<style type="text/css">
body {
	font: 13px Arial, Helvetica, Sans-serif;
}

.haha {
	color: #FFFFFF;
}

#queue {
	background-color: #FFF;
	border-radius: 3px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25);
	height: 103px;
	margin-bottom: 10px;
	overflow: auto;
	padding: 5px 10px;
	width: 300px;
}
</style>
</head>

<body>
	<h1>Uploadify Demo</h1>
	<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
	</form>
	<script type="text/javascript">
		$(function() {
			$('#file_upload')
					.uploadify(
							{
								'debug' : false,
								'auto' : false, //是否自动上传,   
								'buttonClass' : 'haha', //按钮辅助class   
								'buttonText' : '上传', //按钮文字   
								'height' : 30, //按钮高度   
								'width' : 100, //按钮宽度   
								'checkExisting' : 'check-exists.php',//是否检测图片存在,不检测:false   
								'fileObjName' : 'files', //默认 Filedata, $_FILES控件名称   
								'fileSizeLimit' : '0KB', //文件大小限制 0为无限制 默认KB   
								'fileTypeDesc' : 'All Files', //图片选择描述   
								'fileTypeExts' : '*.*',//文件后缀限制 默认：'*.*'   
								'formData' : {
									'someKey' : 'someValue',
									'someOtherKey' : 1
								},//传输数据JSON格式   
								// 'formData'		:{ 'albumid':$("#albumid").val() },                
								//'overrideEvents'	: ['onUploadProgress'],  // The progress will not be updated   
								//'progressData'	: 'speed',             //默认percentage 进度显示方式   
								'queueID' : 'queue', //默认队列ID   
								'queueSizeLimit' : 20, //一个队列上传文件数限制   
								'removeCompleted' : true, //完成时是否清除队列 默认true   
								'removeTimeout' : 3, //完成时清除队列显示秒数,默认3秒   
								'requeueErrors' : false, //队列上传出错，是否继续回滚队列   
								'successTimeout' : 5, //上传超时   
								'uploadLimit' : 99, //允许上传的最多张数   
								'swf' : 'js/upload/uploadify.swf', //swfUpload   
								'uploader' : '${pageContext.request.contextPath}/sds/cloud/upload.do', //服务器端脚本   

								//修改formData数据   
								'onUploadStart' : function(file) {
									//$("#file_upload").uploadify("settings", "someOtherKey", 2);   
								},
								'onUploadStart' : function(file) {
									//  $("#perpic").uploadify("settings","formData",{"albumid":$("#albumid").val()});    
								},
								//删除时触发   
								'onCancel' : function(file) {
									//alert('The file ' + file.name + '--' + file.size + ' was cancelled.');   
								},
								//清除队列   
								'onClearQueue' : function(queueItemCount) {
									//alert(queueItemCount + ' file(s) were removed from the queue');   
								},
								//调用destroy是触发   
								'onDestroy' : function() {
									alert('我被销毁了');
								},
								//每次初始化一个队列是触发   
								'onInit' : function(instance) {
									//alert('The queue ID is ' + instance.settings.queueID);   
								},
								//上传成功   
								'onUploadSuccess' : function(file, data,
										response) {
									//alert(file.name + ' | ' + response + ':' + data);   
								},
								//上传错误   
								'onUploadError' : function(file, errorCode,
										errorMsg, errorString) {
									//alert('The file ' + file.name + ' could not be uploaded: ' + errorString);   
								},
								//上传汇总   
								'onUploadProgress' : function(file,
										bytesUploaded, bytesTotal,
										totalBytesUploaded, totalBytesTotal) {
									$('#progress').html(
											totalBytesUploaded
													+ ' bytes uploaded of '
													+ totalBytesTotal
													+ ' bytes.');
								},
								//上传完成   
								'onUploadComplete' : function(file) {
									//alert('The file ' + file.name + ' finished processing.');   
								},

							});
		});

		//变换按钮   
		function changeBtnText() {
			$('#file_upload').uploadify('settings', 'buttonText', '继续上传');
		}

		//返回按钮   
		function returnBtnText() {
			alert('The button says '
					+ $('#file_upload').uploadify('settings', 'buttonText'));
		}
	</script>
	<h4>操作:</h4>
	<a href="javascript:$('#file_upload').uploadify('upload', '*');">开始上传</a>
	|
	<a href="javascript:$('#file_upload').uploadify('cancel', '*');">清除队列</a>
	|
	<a href="javascript:$('#file_upload').uploadify('destroy');">销毁上传</a> |
	<a href="javascript:$('#file_upload').uploadify('disable', true);">禁用上传</a>
	|
	<a href="javascript:$('#file_upload').uploadify('disable', false);">激活上传</a>
	|
	<a href="javascript:$('#file_upload').uploadify('stop');">停止上传</a> |
	<a href="changeBtnText();">变换按钮</a> |
	<h4>大小:</h4>
	<div id='progress'></div>
</body>
</html>
