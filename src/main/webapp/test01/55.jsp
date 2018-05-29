<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
<link rel="stylesheet" href="js/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" media="screen" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/plupload-2.1.2/js/plupload.full.min.js"></script>
<script type="text/javascript" src="js/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
<script type="text/javascript" src="js/plupload-2.1.2/js/i18n/zh_CN.js"></script>
  </head>
  
  <body>
   <script type="text/javascript">
	
    var uploader;
	$(function() {
		uploader = new plupload.Uploader({
			// General settings
			runtimes : 'html5,flash,html4',
			url : 'cloud/upload.do',
			max_file_size:'10gb',
			rename : true,
			dragdrop: true,
			
			/* filters : {
				// Maximum file size
				max_file_size : '10mb',
				// Specify what files to browse for
				mime_types: [
					{title : "Image files", extensions : "jpg,gif,png"},
					{title : "Zip files", extensions : "zip"}
				]
			}, */
			
			
			browse_button : 'pickfiles',
			container : 'container',
			max_file_size : '3gb',
			//chunk_size : '1mb',
			unique_names : true,

			// Resize images on clientside if we can
			resize : {width : 320, height : 240, quality : 90},

			flash_swf_url : '../../js/Moxie.swf',
			silverlight_xap_url : '../../js/Moxie.xap'
		});
		uploader.bind('Init', function(up, params) {
			$('#filelist').html("");
		});
		uploader.bind('BeforeUpload', function(uploader, file) {
			$('.plupload_delete').hide();
		});
		uploader.bind('FilesAdded', function(up, files) {
			$.each(files, function(i, file) {
				$('#filelist').append('<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b>' + '&nbsp;<span onclick="uploader.removeFile(uploader.getFile($(this).parent().attr(\'id\')));$(this).parent().remove();" style="cursor: pointer;" class="plupload_delete">删除</span></div>');
			});
			up.refresh();
		});
		uploader.bind('UploadProgress', function(up, file) {
			$('#' + file.id + " b").html(file.percent + "%");
		});
		uploader.bind('Error', function(up, err) {
			$('#filelist').append("<div>Error: " + err.code + ", Message: " + err.message + (err.file ? ", File: " + err.file.name : "") + "</div>");
			up.refresh();
		});
		uploader.bind('FileUploaded', function(up, file, info) {
			$('#' + file.id + " b").html("100%");
			$('#attachmentName').attr('value', file.name);
		});
		uploader.init();
		$('#uploadfiles').click(function(e) {
			uploader.start();
			e.preventDefault();
		});
	});
</script>


<div style="height:5px">
	
	    
	
        <div id="container" class="fitem">
			<button id="pickfiles" name="pickfiles" >选择文件</button> 
			<a  href="javascript:uploader.start()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" >开始上传</a>
			<a href="javascript:uploader.stop()" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true" >停止上传</a>
			<div id="filelist" class="fitem">您的浏览器没有安装Flash插件，或不支持HTML5！</div> </div> 
		    <input type="hidden" id="attachmentName" name="attachmentName" value="" />
		</div>
	
</div>  
  </body>
</html>
