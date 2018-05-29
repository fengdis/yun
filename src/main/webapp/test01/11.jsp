<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="js/upload/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/upload/jquery.uploadify.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#uploadify").uploadify({ //初始化函数
	    width: 100,
	    uploader: '${pageContext.request.contextPath}/cloud/upload.do',
	    swf: 'js/upload/uploadify.swf',//flash文件位置，注意路径
	    //script: '${pageContext.request.contextPath}/cloud/upload.do',//后台处理的请求(sevlet)
	    buttonImg: '',//上传按钮的背景图片
	    auto: false,//选定文件后是否自动上传，默认false
	    cancelImg: '${pageContext.request.contextPath}/js/upload/uploadify-cancel.png',//取消按钮图片
	    queueID: 'fileQueue',//与下面的上传文件列表id对应
	    queueSizeLimit: 8,//上传文件的数量
	    scriptData: {
	        'userID': ''
	    },
	    //向后台传的数据
	    fileDesc: '',
	    //上传文件类型说明
	    fileExt: '*.*',
	    //控制可上传文件的扩展名，启用本项时需同时声明fileDesc
	    method: 'post',
	    //如果向后台传输数据，必须是get
	    //  sizeLimit:10000,//文件上传的大小限制，单位是字节
	    multi: true,
	    simUploadLimit: 8,
	    //同时上传文件的数量，设置了这个参数后，
	    //那么你会因设置multi:true和queueSizeLimit：8而可以多选8个文件，
	    //但如果一旦你将simUploadLimit也设置了，那么只会上传这个参数指定的文件个数，其它就上传不了
	    buttonText: '选择文件',
	    //浏览按钮上的文字
	    onComplete: function(event, queueID, fileObj, serverData, data) { //当上传完成后的回调函数，ajax方式哦~~
	        //alert("上传成功");
	        addImg(serverData);
	        // alert(serverData);
	        //addImg(serverData);
	        /* $('#image').attr("src",serverData);//serverData是sevlet中out.print图片的路径
	                              $('#image').show();*/
	    },
	    onSelect: function(e, queueId, fileObj) {
	        /*alert("唯一标识:" + queueId + "\r\n" +
		                  "文件名：" + fileObj.name + "\r\n" +
		                  "文件大小：" + fileObj.size + "\r\n" +
		                  "创建时间：" + fileObj.creationDate + "\r\n" +
		                  "最后修改时间：" + fileObj.modificationDate + "\r\n" +
		                  "文件类型：" + fileObj.type
		            );*/

	    },
	    onError: function(event, queueID, fileObj) {　alert("文件:" + fileObj.name + " 上传失败");
	    }
	});
});
function addImg(imgUrl){
	var path=[];
	path=imgUrl.split("#");
   var list=$("#imgList");
   var img=$("<img>");
   img.attr("src",path[0]);
   img.attr("id",path[1]);
   img.attr("height","150px");
   img.attr("width","150px");
   img.click(function(){
           alert("设为首页募捐显示照片吗？");
	   });
   img.css("cursor","pointer");
   list.append(img);
}
</script>



</head>

<body>
	<div id="fileQueue"></div>
	<input type="file" name="uploadify" id="uploadify" />
	<p>
		<a href="javascript:jQuery('#uploadify').uploadify('upload')">开始上传</a>&nbsp;
		<a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消所有上传</a>
	</p>
</body>

</html>