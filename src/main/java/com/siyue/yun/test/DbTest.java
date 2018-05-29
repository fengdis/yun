package com.siyue.yun.test;

import com.siyue.yun.db.HbaseDB;
import com.siyue.yun.db.HdfsDB;

public class DbTest {

	public static void main(String[] args) throws Exception {
		HbaseDB db = HbaseDB.getInstance();
		HdfsDB hdfsDB = HdfsDB.getInstance();
		
		/*String table_user = "user_id11";
		String[] fam_user = {"id11"};
		db.createTable(table_user, fam_user,1);*/
		
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
		
		 /** tableName:share
		 * rowkey:userid+shareid
		 * content:path,content:ts*/
		  
		String table_share = "share";
		String[] fam_centent = {"content"};
		db.createTable(table_share, fam_centent,1);
		
		
		 /** tableName:shareed
		 * rowkey:userid+userid+shareid
		 * shareid:*/
		  
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
		
		/*String table_filesystem = "filesystem";
		String[] fam_filesystem = {"filesystemId"};
		db.createTable(table_filesystem, fam_filesystem,1);*/
		
		System.out.println("ok");
	}

}
