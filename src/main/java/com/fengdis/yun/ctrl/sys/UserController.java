package com.fengdis.yun.ctrl.sys;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siyue.yun.base.BaseController;
import com.fengdis.yun.utils.BaseUtils;
import com.fengdis.yun.utils.Json;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

	@ResponseBody
	@RequestMapping("/reg")
	public Json reg(String userName,String pwd,String email) throws Exception {
		Json json = new Json();
		if(db.checkUsername(userName)){
			json.setMsg("该用户名已存在，请换一个");
			return json;
		}
		if (db.checkEmail(email)) {
			json.setMsg("该邮箱已存在");
			return json;
		}
		try {
			long id = db.getGid("gid");
			//创建用户
			db.add("user_id", userName, "id", "id", id);
			db.add("id_user", id, "user", "name", userName);
			db.add("id_user", id, "user", "pwd", pwd);
			db.add("id_user", id, "user", "email", email);
			db.add("email_user", email, "user", "userid", id);
			//在hdfs中创建用户根目录
			db.add("hdfs", id, "dir", "name", userName);
			db.add("hdfs", id, "dir", "type", "D");//D表示是目录，F表示是文件
			db.add("hdfs_name", userName, "id", "id", id);
			hdfsDB.mkdir(userName);
			
			json.setSuccess(true);
			json.setMsg("用户注册成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("用户注册失败");
		}
		return json;
	}
	/**
	 * 获取关注的用户
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/followlist")
	public String followlist(HttpSession session,Model model) throws Exception {
		String name = (String) session.getAttribute("username");
		if (name!=null) {
			model.addAttribute("follows", db.getFollow(name));
		}
		return "cloud/follow";
	}
	@RequestMapping("/getFollow")
	public String getFollow(String ids,String dir,String types,HttpSession session,Model model) throws Exception {
		String name = (String) session.getAttribute("username");
		if (name!=null) {
			model.addAttribute("follows", db.getFollow(name));
		}
		model.addAttribute("dir", dir);
		model.addAttribute("ids", ids);
		model.addAttribute("types", types);
		return "cloud/share_getfollow";
	}
	/**
	 * 关注用户
	 * @param username
	 * @param session
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/follow")
	public Json follow(String username,HttpSession session) throws Exception {
		Json json = new Json();
		String name = (String) session.getAttribute("username");
		if (name!=null && BaseUtils.isNotEmpty(username)) {
			try {
				db.follow(name, username);
				json.setSuccess(true);
			} catch (Exception e) {
				json.setMsg("关注失败");
				e.printStackTrace();
			}
		}
		return json;
	}
	/**
	 * 取消关注
	 * @param username
	 * @param session
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/unfollow")
	public Json unfollow(String username,HttpSession session) throws Exception {
		Json json = new Json();
		String name = (String) session.getAttribute("username");
		if (name!=null && BaseUtils.isNotEmpty(username)) {
			try {
				db.unfollow(name, username);
				json.setSuccess(true);
			} catch (Exception e) {
				json.setMsg("取消失败");
				e.printStackTrace();
			}
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/getuser")
	public Json getuser(String username) {
		Json json = new Json();
		if (db.checkUsername(username)) {
			json.setSuccess(true);
			json.setMsg(username);
		}else{
			json.setMsg("没有该用户");
		}
		return json;
	}
}
