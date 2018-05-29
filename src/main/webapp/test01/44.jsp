<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>MyWebProject</title>
<meta charset="utf-8" />
	<link type="text/css" href="js/AjaxFileUploaderV2.1/ajaxfileupload.css"
	rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/AjaxFileUploaderV2.1/ajaxfileupload.js"></script>
<script type="text/javascript">
function ajaxFileUpload() {
	$.ajaxFileUpload({
		url : "cloud/upload.do",   //submit to UploadFileServlet
		secureuri : false,
		fileElementId : 'fileToUpload',
		dataType : 'text', //or json xml whatever you like~
		success : function(data, status) {
			$("#result").append(data);
		},
		error : function(data, status, e) {
			$("#result").append(data);
		}
	});
	return false;
}
</script>
</head>

<body>
	<!-- upload file -->
	<form name="form" action="cloud/upload.do" method="POST" enctype="multipart/form-data">
		<table class="tableForm">
			<thead>
				<tr>
					<th>JQuery Ajax File Upload</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input id="fileToUpload"  type="file" size="45" 
						name="fileToUpload"  class="input"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td><button class="button" id="buttonUpload"
							onclick="return ajaxFileUpload();">Upload</button></td>
				</tr>
			</tfoot>
		</table>
		<div id="result" style="margin-left:200px"></div>
	</form>
</body>
</html>

