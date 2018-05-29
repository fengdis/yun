<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>云盘用户关注</title>
<jsp:include page="/public/pub.jsp"></jsp:include>
</head>

<body>
<jsp:include page="/public/top.jsp"></jsp:include>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span class="menu-text"></span>
			</a>
			<jsp:include page="/public/left.jsp"></jsp:include>
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
						<li class="active">欢迎页面</li>
					</ul>
					<!-- .breadcrumb -->
				</div>

				<div class="page-content">
					<div class="page-header">
						<form id="searchUser">
							<input type="text" id="username" name="username" placeholder="输入用户名" /> <input class="button purple" type="button" onclick="getUser()" value="搜索" />
						</form>
						
					</div>
					<!-- /.page-header -->
					<div class="row" id="showsearch"></div>
					<div class="row">
						<c:forEach items="${follows}" var="entry">
							<div class="col-lg-1 col-md-1">
								<div class="thumbnail">
									<img src="assets/avatars/profile-pic.jpg" alt="...">
								</div>
								<div class="caption itemdiv commentdiv">
									<h4>${entry}</h4>
									<div class="tools">
										<div class="action-buttons bigger-125">
											<!-- <a href="#"> <i class="icon-pencil blue"></i>
											</a> <a href="#"> <i class="icon-trash red"></i>
											</a> -->
											<button type="button" onclick="unfollowUser('${entry}')" class="btn btn-grep btn-xs">
											<span class="glyphicon glyphicon-remove"></span> 取消关注
										</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->
			<jsp:include page="/public/container.jsp"></jsp:include>
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<script type="text/javascript">
		function getUser() {
			var name = $.trim($("#username").val());
			if (name == null || name == '') {
				alert("请输入你要找的用户名");
				return false;
			}
			var data = $("#searchUser").formToArray();
			$.ajax({
						type : "POST",
						url : "user/getuser.do",
						data : data,
						dataType : "json",
						success : function(json) {
							if (json.success) {
								var str = "";
								str += '<div class="col-lg-1 col-md-1">';
								str += '<div class="thumbnail"><img src="assets/avatars/profile-pic.jpg"></div>';
								str += '<div class="caption itemdiv commentdiv"><h4>'
										+ json.msg + '</h4>';
								str += '<div class="tools">';
								str += '<div class="action-buttons bigger-125">';
								str += '<button type="button" onclick="followUser(\''
										+ json.msg
										+ '\')" class="btn btn-success btn-xs">';
								str += '<span class="glyphicon glyphicon-ok"></span> 立刻关注</button>';
								str += '</div></div>';
								str += '</div></div>';
								$("#showsearch").append(str);
								//location.reload();
							} else {
								alert(json.msg);
							}

						}
					});
		}
		function followUser(name) {
			$.post('${pageContext.request.contextPath}/user/follow.do', {
				username : name
			}, function(j) {
				if (j.success) {
					location.reload();
				} else {
					alert(json.msg);
				}
			}, 'json');
		}
		function unfollowUser(name) {
			$.post('${pageContext.request.contextPath}/user/unfollow.do', {
				username : name
			}, function(j) {
				if (j.success) {
					location.reload();
				} else {
					alert(json.msg);
				}
			}, 'json');
		}
		jQuery(function($) {
			$('#tasks').sortable({
				opacity:0.8,
				revert:true,
				forceHelperSize:true,
				placeholder: 'draggable-placeholder',
				forcePlaceholderSize:true,
				tolerance:'pointer',
				stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
					$(ui.item).css('z-index', 'auto');
				}
				}
			);
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
				if(this.checked) $(this).closest('li').addClass('selected');
				else $(this).closest('li').removeClass('selected');
			});
		})
	</script>
</body>
</html>
