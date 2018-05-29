<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>follow</title>
<jsp:include page="/public/pub.jsp"></jsp:include>
<script type="text/javascript">
var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
$(function(){
	$('#sharebut').on('click', function(){
		var data = $("#shareForm").formToArray();
		$.ajax({
			type:"POST",
			url:"cloud/share.do",
			data:data,
			dataType:"json",
			success:function(json){
				if(json.success){
					parent.layer.close(index); //执行关闭
				}else{
					alert(json.msg);
				}
				
			}
		});
	    //parent.layer.close(index); //执行关闭
	});
});

</script>
</head>

<body>
	<form id="shareForm" method="post">
		<input type="hidden" name="dir" value="${dir}" />
		<input type="hidden" name="names" value="${ids}" />
		<input type="hidden" name="types" value="${types}" />
		<c:forEach items="${follows}" var="entry">
			<span>
				<label> <input name="usernames" value="${entry}" type="checkbox" class="ace"> <span class="lbl"> ${entry}</span>
				</label>
			</span>
		</c:forEach>
	</form>
	<button id="sharebut" class="btn btn-info" type="button">
		<i class="icon-ok bigger-110"></i>分享
	</button>
</body>
</html>