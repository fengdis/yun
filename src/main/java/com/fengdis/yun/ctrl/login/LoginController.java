package com.fengdis.yun.ctrl.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siyue.yun.base.BaseController;
import com.fengdis.yun.utils.BaseUtils;
import com.fengdis.yun.utils.Json;

@Controller
@RequestMapping("/")
public class LoginController extends BaseController {

	@RequestMapping("login")
	public String login(String userName,String pwd,HttpSession session) throws Exception {
		long userId = db.checkUser(userName, pwd);
		Json json = new Json();
		if (userId>0) {
			json.setSuccess(true);
			session.setAttribute("userid", userId);
			session.setAttribute("username", db.getUserNameById(userId));
		}else {
			json.setMsg("用户名或密码不正确");
		}
		return "redirect:index.jsp";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		if (session!=null) {
			session.invalidate();
		}
		return "redirect:login.jsp";
	}
	
	@RequestMapping("reg")
	public String reg(String email,String username,String password) throws Exception {
		if(BaseUtils.isNotEmpty(email) && BaseUtils.isNotEmpty(username) && BaseUtils.isNotEmpty(password)){
			long id = db.getGid("gid");
			db.add("user_id", username, "id", "id", id);
			db.add("id_user", id, "user", "name", username);
			db.add("id_user", id, "user", "pwd", password);
			db.add("id_user", id, "user", "email", email);
			db.add("email_user", email, "user", "userid", id);
			hdfsDB.mkdir("/"+username);
		}
		return "redirect:login.jsp";
	}
	
	@RequestMapping("init")
	public String init() throws Exception {
		String table_gid = "gid";
		String[] fam_gid = {"gid"};
		db.createTable(table_gid, fam_gid,1);
		
		String table_id = "id_user";
		String[] fam_id = {"user"};
		db.createTable(table_id, fam_id,1);
		
		String table_user = "user_id";
		String[] fam_user = {"id"};
		db.createTable(table_user, fam_user,1);
		
		String table_email = "email_user";
		String[] fam_email = {"user"};
		db.createTable(table_email, fam_email,1);
		
		db.add(table_gid, "gid", "gid", "gid", (long)0);
		
		long id = db.getGid("gid");
		db.add("user_id", "admin", "id", "id", id);
		db.add("id_user", id, "user", "name", "admin");
		db.add("id_user", id, "user", "pwd", "admin");
		db.add("id_user", id, "user", "email", "923610744@qq.com");
		db.add("email_user", "923610744@qq.com", "user", "userid", id);
		
		hdfsDB.mkdir("/admin");
		
		String table_follow = "follow";
		String[] fam_follow_name = {"name"};
		db.createTable(table_follow, fam_follow_name,1);
		
		String table_followed = "followed";
		String[] fam_followed_userid = {"userid"};
		db.createTable(table_followed, fam_followed_userid,1);
		
		db.add("gid", "shareid", "gid", "shareid", (long)0);
		/*
		 * tableName:share
		 * rowkey:userid+shareid
		 * content:path,content:ts
		 */ 
		String table_share = "share";
		String[] fam_centent = {"content"};
		db.createTable(table_share, fam_centent,1);
		
		/*
		 * tableName:shareed
		 * rowkey:userid+userid+shareid
		 * shareid:
		 */ 
		String table_shareed = "shareed";
		String[] fam_shareid = {"shareid"};
		db.createTable(table_shareed, fam_shareid,1);
		
		db.add("gid", "bookid", "gid", "bookid", (long)0);
		//tableName:book
		//rowkey:userid+id
		//content:
		String table_book = "book";
		String[] fam_book_content = {"content"};
		db.createTable(table_book, fam_book_content,1);
		
		return "redirect:login.jsp";
	}
}
