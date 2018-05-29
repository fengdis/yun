package com.siyue.yun.base;

import com.siyue.yun.db.HbaseDB;
import com.siyue.yun.db.HdfsDB;

public class BaseController {

	public HbaseDB db = HbaseDB.getInstance();
	public HdfsDB hdfsDB = HdfsDB.getInstance();
	//public HbaseDB db = null;
	//public HdfsDB hdfsDB = null;
}
