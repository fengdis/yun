package com.fengdis.yun.base;

import com.fengdis.yun.db.HbaseDB;
import com.fengdis.yun.db.HdfsDB;

public class BaseController {

	public HbaseDB db = HbaseDB.getInstance();
	public HdfsDB hdfsDB = HdfsDB.getInstance();
	//public HbaseDB db = null;
	//public HdfsDB hdfsDB = null;
}
