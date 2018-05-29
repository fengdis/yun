<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%-- <jsp:include page="../inc.jsp"></jsp:include> --%>
<script type="text/javascript">
	var selectIcon = function($dialog, $input) {
		$input.val($(':radio:checked').val()).attr('class', $(':radio:checked').val());
		$dialog.dialog('destroy');
	};
	$(function() {

		$(':radio').each(function(index) {//初始化小图标
			$(this).after('<img class="iconImg ' + $(this).val() + '"/>');
		});
		$('.iconImg').attr('src', sy.pixel_0);

		$('td').click(function() {//绑定点击td事件，作用是点击td的时候，就可以选中，不一定非得点击radio组件
			$(this).find(':radio').attr('checked', 'checked');
		});

	});
</script>
</head>
<body>
	<table class="table" style="width: 100%;">
		<tr>
			<td><input name="r" value="ext-icon-anchor" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-asterisk_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-asterisk_yellow" type="radio" /></td>
			<td><input name="r" value="ext-icon-attach" type="radio" /></td>
			<td><input name="r" value="ext-icon-bell" type="radio" /></td>
			<td><input name="r" value="ext-icon-bell_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-bell_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-bell_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-bell_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-bell_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-bin" type="radio" /></td>
			<td><input name="r" value="ext-icon-bin_closed" type="radio" /></td>
			<td><input name="r" value="ext-icon-bin_empty" type="radio" /></td>
			<td><input name="r" value="ext-icon-bomb" type="radio" /></td>
			<td><input name="r" value="ext-icon-book" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-book_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_addresses" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-book_next" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_open" type="radio" /></td>
			<td><input name="r" value="ext-icon-book_previous" type="radio" /></td>
			<td><input name="r" value="ext-icon-box" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick" type="radio" /></td>
			<td><input name="r" value="ext-icon-bricks" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-brick_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-brick_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-briefcase" type="radio" /></td>
			<td><input name="r" value="ext-icon-building" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-building_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-building_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_arrow_bottom" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_arrow_down" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-bullet_arrow_top" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_arrow_up" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_black" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_disk" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_feed" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-bullet_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_picture" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_pink" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_purple" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_red" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-bullet_star" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_toggle_minus" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_toggle_plus" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_white" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_wrench" type="radio" /></td>
			<td><input name="r" value="ext-icon-bullet_yellow" type="radio" /></td>
			<td><input name="r" value="ext-icon-cake" type="radio" /></td>
			<td><input name="r" value="ext-icon-cancel" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-clock" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_pause" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-clock_play" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-clock_stop" type="radio" /></td>
			<td><input name="r" value="ext-icon-cog" type="radio" /></td>
			<td><input name="r" value="ext-icon-cog_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-cog_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-cog_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-cog_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-cog_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-coins" type="radio" /></td>
			<td><input name="r" value="ext-icon-coins_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-coins_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-color_swatch" type="radio" /></td>
			<td><input name="r" value="ext-icon-color_wheel" type="radio" /></td>
			<td><input name="r" value="ext-icon-comment" type="radio" /></td>
			<td><input name="r" value="ext-icon-comments" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-comments_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-comments_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-comment_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-comment_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-comment_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-compress" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-computer_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-computer_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-connect" type="radio" /></td>
			<td><input name="r" value="ext-icon-contrast" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-contrast_decrease" type="radio" /></td>
			<td><input name="r" value="ext-icon-contrast_high" type="radio" /></td>
			<td><input name="r" value="ext-icon-contrast_increase" type="radio" /></td>
			<td><input name="r" value="ext-icon-contrast_low" type="radio" /></td>
			<td><input name="r" value="ext-icon-controller" type="radio" /></td>
			<td><input name="r" value="ext-icon-controller_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-controller_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-controller_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-creditcards" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-cup_key" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-cup_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-cursor" type="radio" /></td>
			<td><input name="r" value="ext-icon-cut" type="radio" /></td>
			<td><input name="r" value="ext-icon-cut_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-database" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_connect" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-database_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_refresh" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-database_save" type="radio" /></td>
			<td><input name="r" value="ext-icon-database_table" type="radio" /></td>
			<td><input name="r" value="ext-icon-delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-disconnect" type="radio" /></td>
			<td><input name="r" value="ext-icon-disk" type="radio" /></td>
			<td><input name="r" value="ext-icon-disk_multiple" type="radio" /></td>
			<td><input name="r" value="ext-icon-door" type="radio" /></td>
			<td><input name="r" value="ext-icon-door_in" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-door_open" type="radio" /></td>
			<td><input name="r" value="ext-icon-door_out" type="radio" /></td>
			<td><input name="r" value="ext-icon-drink" type="radio" /></td>
			<td><input name="r" value="ext-icon-drink_empty" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-dvd_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-dvd_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_evilgrin" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_grin" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_happy" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_smile" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-emoticon_surprised" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_tongue" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_unhappy" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_waii" type="radio" /></td>
			<td><input name="r" value="ext-icon-emoticon_wink" type="radio" /></td>
			<td><input name="r" value="ext-icon-error" type="radio" /></td>
			<td><input name="r" value="ext-icon-error_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-error_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-error_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-exclamation" type="radio" /></td>
			<td><input name="r" value="ext-icon-eye" type="radio" /></td>
			<td><input name="r" value="ext-icon-female" type="radio" /></td>
			<td><input name="r" value="ext-icon-find" type="radio" /></td>
			<td><input name="r" value="ext-icon-font" type="radio" /></td>
			<td><input name="r" value="ext-icon-font_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-font_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-font_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-heart" type="radio" /></td>
			<td><input name="r" value="ext-icon-heart_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-heart_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-help" type="radio" /></td>
			<td><input name="r" value="ext-icon-hourglass" type="radio" /></td>
			<td><input name="r" value="ext-icon-hourglass_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-hourglass_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-hourglass_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-hourglass_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-house" type="radio" /></td>
			<td><input name="r" value="ext-icon-house_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-house_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-html" type="radio" /></td>
			<td><input name="r" value="ext-icon-html_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-html_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-html_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-html_valid" type="radio" /></td>
			<td><input name="r" value="ext-icon-image" type="radio" /></td>
			<td><input name="r" value="ext-icon-images" type="radio" /></td>
			<td><input name="r" value="ext-icon-images_send" type="radio" /></td>
			<td><input name="r" value="ext-icon-image_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-image_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-image_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-image_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-information" type="radio" /></td>
			<td><input name="r" value="ext-icon-joystick" type="radio" /></td>
			<td><input name="r" value="ext-icon-joystick_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-joystick_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-joystick_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-key" type="radio" /></td>
			<td><input name="r" value="ext-icon-key_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-key_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-key_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-layers" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightbulb" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightbulb_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightbulb_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightbulb_off" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightning" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-lightning_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightning_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-lightning_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-link" type="radio" /></td>
			<td><input name="r" value="ext-icon-link_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-link_break" type="radio" /></td>
			<td><input name="r" value="ext-icon-link_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-link_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-link_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-link_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry_flatbed" type="radio" /></td>
			<td><input name="r" value="ext-icon-lorry_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-lorry_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-male" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_bronze_1" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_bronze_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_bronze_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_bronze_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_bronze_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_gold_1" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-medal_gold_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_gold_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_gold_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_gold_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_silver_1" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_silver_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_silver_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-medal_silver_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-medal_silver_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-money" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_dollar" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_euro" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_pound" type="radio" /></td>
			<td><input name="r" value="ext-icon-money_yen" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-mouse" type="radio" /></td>
			<td><input name="r" value="ext-icon-mouse_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-mouse_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-mouse_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-music" type="radio" /></td>
			<td><input name="r" value="ext-icon-new" type="radio" /></td>
			<td><input name="r" value="ext-icon-package" type="radio" /></td>
			<td><input name="r" value="ext-icon-package_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-package_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-package_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-package_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-package_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-paintbrush" type="radio" /></td>
			<td><input name="r" value="ext-icon-paintcan" type="radio" /></td>
			<td><input name="r" value="ext-icon-palette" type="radio" /></td>
			<td><input name="r" value="ext-icon-pencil" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-pencil_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-pencil_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-pencil_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-phone" type="radio" /></td>
			<td><input name="r" value="ext-icon-phone_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-phone_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-phone_sound" type="radio" /></td>
			<td><input name="r" value="ext-icon-pilcrow" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-pill" type="radio" /></td>
			<td><input name="r" value="ext-icon-pill_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-pill_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-pill_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_disabled" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-plugin_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-plugin_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-rainbow" type="radio" /></td>
			<td><input name="r" value="ext-icon-resultset_first" type="radio" /></td>
			<td><input name="r" value="ext-icon-resultset_last" type="radio" /></td>
			<td><input name="r" value="ext-icon-resultset_next" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-resultset_previous" type="radio" /></td>
			<td><input name="r" value="ext-icon-rosette" type="radio" /></td>
			<td><input name="r" value="ext-icon-rss" type="radio" /></td>
			<td><input name="r" value="ext-icon-rss_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-rss_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-rss_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-rss_valid" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-ruby_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_get" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-ruby_put" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-search" type="radio" /></td>
			<td><input name="r" value="ext-icon-server" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_chart" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_compressed" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_connect" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_database" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-server_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-server_uncompressed" type="radio" /></td>
			<td><input name="r" value="ext-icon-shading" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-shape_align_bottom" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_align_center" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_align_left" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_align_middle" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_align_right" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_align_top" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_flip_horizontal" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_flip_vertical" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-shape_group" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_handles" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_move_back" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_move_backwards" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_move_forwards" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_move_front" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_rotate_anticlockwise" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_rotate_clockwise" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-shape_square" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-shape_square_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-shape_ungroup" type="radio" /></td>
			<td><input name="r" value="ext-icon-shield" type="radio" /></td>
			<td><input name="r" value="ext-icon-shield_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-shield_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-shield_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-sitemap" type="radio" /></td>
			<td><input name="r" value="ext-icon-sitemap_color" type="radio" /></td>
			<td><input name="r" value="ext-icon-sound" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-sound_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-sound_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-sound_low" type="radio" /></td>
			<td><input name="r" value="ext-icon-sound_mute" type="radio" /></td>
			<td><input name="r" value="ext-icon-sound_none" type="radio" /></td>
			<td><input name="r" value="ext-icon-spellcheck" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_8ball" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_basketball" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-sport_football" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_golf" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_raquet" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_shuttlecock" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_soccer" type="radio" /></td>
			<td><input name="r" value="ext-icon-sport_tennis" type="radio" /></td>
			<td><input name="r" value="ext-icon-star" type="radio" /></td>
			<td><input name="r" value="ext-icon-status_away" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-status_busy" type="radio" /></td>
			<td><input name="r" value="ext-icon-status_offline" type="radio" /></td>
			<td><input name="r" value="ext-icon-status_online" type="radio" /></td>
			<td><input name="r" value="ext-icon-stop" type="radio" /></td>
			<td><input name="r" value="ext-icon-style" type="radio" /></td>
			<td><input name="r" value="ext-icon-style_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-style_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-style_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-style_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-sum" type="radio" /></td>
			<td><input name="r" value="ext-icon-tab" type="radio" /></td>
			<td><input name="r" value="ext-icon-tab_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-tab_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-tab_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-tab_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-telephone" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-telephone_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-textfield" type="radio" /></td>
			<td><input name="r" value="ext-icon-textfield_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-textfield_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-textfield_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-textfield_rename" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_align_center" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_align_justify" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_align_left" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-text_align_right" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_allcaps" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_bold" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_columns" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_dropcaps" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_heading_1" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_heading_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_heading_3" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-text_heading_4" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_heading_5" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_heading_6" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_horizontalrule" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_indent" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_indent_remove" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_italic" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_kerning" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-text_letterspacing" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_letter_omega" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_linespacing" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_list_bullets" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_list_numbers" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_lowercase" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_padding_bottom" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_padding_left" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-text_padding_right" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_padding_top" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_replace" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_signature" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_smallcaps" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_strikethrough" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_subscript" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_superscript" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-text_underline" type="radio" /></td>
			<td><input name="r" value="ext-icon-text_uppercase" type="radio" /></td>
			<td><input name="r" value="ext-icon-thumb_down" type="radio" /></td>
			<td><input name="r" value="ext-icon-thumb_up" type="radio" /></td>
			<td><input name="r" value="ext-icon-tick" type="radio" /></td>
			<td><input name="r" value="ext-icon-time" type="radio" /></td>
			<td><input name="r" value="ext-icon-timeline_marker" type="radio" /></td>
			<td><input name="r" value="ext-icon-time_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-time_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-time_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-transmit_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-transmit_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-tux" type="radio" /></td>
			<td><input name="r" value="ext-icon-vector" type="radio" /></td>
			<td><input name="r" value="ext-icon-vector_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-vector_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-wand" type="radio" /></td>
			<td><input name="r" value="ext-icon-weather_clouds" type="radio" /></td>
			<td><input name="r" value="ext-icon-weather_cloudy" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-weather_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-weather_rain" type="radio" /></td>
			<td><input name="r" value="ext-icon-weather_snow" type="radio" /></td>
			<td><input name="r" value="ext-icon-weather_sun" type="radio" /></td>
			<td><input name="r" value="ext-icon-webcam" type="radio" /></td>
			<td><input name="r" value="ext-icon-webcam_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-webcam_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-webcam_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-wrench" type="radio" /></td>
			<td><input name="r" value="ext-icon-wrench_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-xhtml" type="radio" /></td>
			<td><input name="r" value="ext-icon-xhtml_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-xhtml_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-xhtml_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-xhtml_valid" type="radio" /></td>
			<td><input name="r" value="ext-icon-application" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-application_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_cascade" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_double" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_form" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_form_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-application_form_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_form_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_form_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_get" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_home" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_lightning" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-application_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_osx" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_osx_terminal" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_put" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_side_boxes" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_side_contract" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_side_expand" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_side_list" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-application_side_tree" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_split" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_tile_horizontal" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_tile_vertical" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_view_columns" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_view_detail" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_view_gallery" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_view_icons" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-application_view_list" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_view_tile" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_xp" type="radio" /></td>
			<td><input name="r" value="ext-icon-application_xp_terminal" type="radio" /></td>
			<td><input name="r" value="ext-icon-accept" type="radio" /></td>
			<td><input name="r" value="ext-icon-add" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_branch" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_divide" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-arrow_down" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_in" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_inout" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_join" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_left" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_merge" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_out" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_redo" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-arrow_refresh" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_refresh_small" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_rotate_anticlockwise" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_rotate_clockwise" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_switch" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_turn_left" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_turn_right" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_undo" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-arrow_up" type="radio" /></td>
			<td><input name="r" value="ext-icon-cross" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_bronze_1" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_bronze_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_bronze_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_gold_1" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-award_star_gold_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_gold_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_silver_1" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_silver_2" type="radio" /></td>
			<td><input name="r" value="ext-icon-award_star_silver_3" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-bug_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-bug_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-calculator" type="radio" /></td>
			<td><input name="r" value="ext-icon-calculator_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-calculator_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-calculator_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-calculator_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-calculator_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_view_day" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-calendar_view_month" type="radio" /></td>
			<td><input name="r" value="ext-icon-calendar_view_week" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-camera_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-camera_small" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-basket_put" type="radio" /></td>
			<td><input name="r" value="ext-icon-basket_remove" type="radio" /></td>
			<td><input name="r" value="ext-icon-car" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-cart_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_put" type="radio" /></td>
			<td><input name="r" value="ext-icon-cart_remove" type="radio" /></td>
			<td><input name="r" value="ext-icon-car_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-car_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd_burn" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-cd_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd_eject" type="radio" /></td>
			<td><input name="r" value="ext-icon-cd_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_bar" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_bar_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_bar_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_bar_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-chart_bar_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_bar_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_curve_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-chart_curve_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_line_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_organisation" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-chart_organisation_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_organisation_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-chart_pie_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-control_eject" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_eject_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_end" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_end_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_equalizer" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_equalizer_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_fastforward" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_fastforward_blue" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-control_pause" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_pause_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_play" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_play_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_repeat" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_repeat_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_rewind" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_rewind_blue" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-control_start" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_start_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_stop" type="radio" /></td>
			<td><input name="r" value="ext-icon-control_stop_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-css" type="radio" /></td>
			<td><input name="r" value="ext-icon-css_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-css_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-css_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-css_valid" type="radio" /></td>
			<td><input name="r" value="ext-icon-date" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-date_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_next" type="radio" /></td>
			<td><input name="r" value="ext-icon-date_previous" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_burn" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_cd" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_cd_empty" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-drive_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_disk" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_magnify" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-drive_network" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_rename" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_user" type="radio" /></td>
			<td><input name="r" value="ext-icon-drive_web" type="radio" /></td>
			<td><input name="r" value="ext-icon-email" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_attach" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-email_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_open" type="radio" /></td>
			<td><input name="r" value="ext-icon-email_open_image" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-feed_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_disk" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-feed_magnify" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-film" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-film_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-film_save" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_pink" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_purple" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-flag_yellow" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-folder" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_bell" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_brick" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_bug" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_camera" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_database" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-folder_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_explore" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_feed" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_find" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_heart" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_image" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-folder_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_lightbulb" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_page" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_page_white" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_palette" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_picture" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-folder_star" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_table" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_user" type="radio" /></td>
			<td><input name="r" value="ext-icon-folder_wrench" type="radio" /></td>
			<td><input name="r" value="ext-icon-group" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-group_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-group_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-ipod" type="radio" /></td>
			<td><input name="r" value="ext-icon-ipod_cast" type="radio" /></td>
			<td><input name="r" value="ext-icon-ipod_cast_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-ipod_cast_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-ipod_sound" type="radio" /></td>
			<td><input name="r" value="ext-icon-keyboard" type="radio" /></td>
			<td><input name="r" value="ext-icon-keyboard_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-keyboard_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-keyboard_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-layout_content" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_header" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-layout_sidebar" type="radio" /></td>
			<td><input name="r" value="ext-icon-overlays" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-lock" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_break" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-lock_open" type="radio" /></td>
			<td><input name="r" value="ext-icon-magifier_zoom_out" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-magnifier" type="radio" /></td>
			<td><input name="r" value="ext-icon-magnifier_zoom_in" type="radio" /></td>
			<td><input name="r" value="ext-icon-map" type="radio" /></td>
			<td><input name="r" value="ext-icon-map_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-map_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-map_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-map_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-map_magnify" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-monitor" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-monitor_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-newspaper" type="radio" /></td>
			<td><input name="r" value="ext-icon-newspaper_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-newspaper_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-newspaper_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-newspaper_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-note" type="radio" /></td>
			<td><input name="r" value="ext-icon-note_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-note_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-note_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-note_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-note_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-page" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_attach" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_code" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_copy" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_excel" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_find" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_green" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_paintbrush" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_paste" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_refresh" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_save" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_acrobat" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_actionscript" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_c" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_camera" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_cd" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_code" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_code_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_coldfusion" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_compressed" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_copy" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_cplusplus" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_csharp" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_cup" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_database" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_dvd" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_excel" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_find" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_flash" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_freehand" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_get" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_h" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_horizontal" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_link" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_medal" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_office" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_paint" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_paintbrush" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_paste" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_php" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_picture" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_powerpoint" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_put" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_ruby" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_stack" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_star" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_swoosh" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_text" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_text_width" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_white_tux" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_vector" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_visualstudio" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_width" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_word" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_world" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_wrench" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_white_zip" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-page_word" type="radio" /></td>
			<td><input name="r" value="ext-icon-page_world" type="radio" /></td>
			<td><input name="r" value="ext-icon-paste_plain" type="radio" /></td>
			<td><input name="r" value="ext-icon-paste_word" type="radio" /></td>
			<td><input name="r" value="ext-icon-report" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_disk" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-report_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_magnify" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_picture" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_user" type="radio" /></td>
			<td><input name="r" value="ext-icon-report_word" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-photo" type="radio" /></td>
			<td><input name="r" value="ext-icon-photos" type="radio" /></td>
			<td><input name="r" value="ext-icon-photo_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-photo_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-photo_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture" type="radio" /></td>
			<td><input name="r" value="ext-icon-pictures" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-picture_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_empty" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-picture_save" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-printer" type="radio" /></td>
			<td><input name="r" value="ext-icon-printer_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-printer_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-printer_empty" type="radio" /></td>
			<td><input name="r" value="ext-icon-printer_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-script" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_code" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-script_code_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_error" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_lightning" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-script_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_palette" type="radio" /></td>
			<td><input name="r" value="ext-icon-script_save" type="radio" /></td>
			<td><input name="r" value="ext-icon-table" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_error" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-table_gear" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_key" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_lightning" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_multiple" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_refresh" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_relationship" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-table_row_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_row_insert" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_save" type="radio" /></td>
			<td><input name="r" value="ext-icon-table_sort" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_blue" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_blue_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_blue_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_blue_edit" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-tag_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_pink" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_purple" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-tag_yellow" type="radio" /></td>
			<td><input name="r" value="ext-icon-television" type="radio" /></td>
			<td><input name="r" value="ext-icon-television_add" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-television_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-user" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_comment" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_female" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_go" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-user_gray" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_green" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_orange" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_red" type="radio" /></td>
			<td><input name="r" value="ext-icon-user_suit" type="radio" /></td>
			<td><input name="r" value="ext-icon-vcard" type="radio" /></td>
			<td><input name="r" value="ext-icon-vcard_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-vcard_delete" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-vcard_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-world" type="radio" /></td>
			<td><input name="r" value="ext-icon-world_add" type="radio" /></td>
			<td><input name="r" value="ext-icon-world_delete" type="radio" /></td>
			<td><input name="r" value="ext-icon-world_edit" type="radio" /></td>
			<td><input name="r" value="ext-icon-world_go" type="radio" /></td>
			<td><input name="r" value="ext-icon-world_link" type="radio" /></td>
			<td><input name="r" value="ext-icon-zoom" type="radio" /></td>
		</tr>
		<tr>
			<td><input name="r" value="ext-icon-zoom_in" type="radio" /></td>
			<td><input name="r" value="ext-icon-zoom_out" type="radio" /></td>
			<td><input name="r" value="ext-icon-arrow_right" type="radio" /></td>
		</tr>
	</table>
</body>
</html>