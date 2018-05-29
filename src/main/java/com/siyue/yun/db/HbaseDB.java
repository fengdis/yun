package com.siyue.yun.db;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;

import com.siyue.yun.utils.DateUtil;
import com.siyue.yun.utils.SiteUrl;
import com.siyue.yun.vo.FileSystemVo;
import com.siyue.yun.vo.Menu;
import com.siyue.yun.vo.ShareVo;
import com.siyue.yun.vo.bookVo;

public class HbaseDB  implements Serializable{
	private static final long serialVersionUID = -7137236230164276653L;
//	static HConnection connection;
	static Connection connection;
	
	private static class HbaseDBInstance{
		private static final HbaseDB instance = new HbaseDB();
	}
	public static HbaseDB getInstance() {
		return HbaseDBInstance.instance;
	}
	private HbaseDB() {
		Configuration conf = HBaseConfiguration.create();
		conf.set("hbase.zookeeper.quorum", SiteUrl.readUrl("host"));
		try {
//			connection = HConnectionManager.createConnection(conf);
			connection = ConnectionFactory.createConnection(conf);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Object readResolve(){
		return getInstance();
	}
	/**
	 * 获取所有表
	 * @return
	 * @throws Exception
	 */
	public static TableName[] listTable() throws Exception {
//		HBaseAdmin admin = new HBaseAdmin(connection);
		Admin admin = connection.getAdmin();
		TableName[] tableNames = admin.listTableNames();
		admin.close();
		return tableNames;
	}
	/**
	 * 删除所有表
	 */
	public static void deleteAllTable() throws Exception{
//		HBaseAdmin admin = new HBaseAdmin(connection);
		Admin admin = connection.getAdmin();
		TableName[] tableNames = admin.listTableNames();
		for (int i = 0; i < tableNames.length; i++) {
//			admin.disableTable(tableNames[i].getNameAsString());
//			admin.deleteTable(tableNames[i].getNameAsString());
			admin.disableTable(tableNames[i]);
			admin.deleteTable(tableNames[i]);
		}
		admin.close();
	}
	/**
	 * 创建表
	 * @param tableName
	 * @param fams
	 * @throws Exception
	 */
	public static void createTable(String tableName,String[] fams,int version) throws Exception {
//		HBaseAdmin admin = new HBaseAdmin(connection);
		Admin admin = connection.getAdmin();
		TableName tn = TableName.valueOf(tableName);
		if (admin.tableExists(tn)) {
			admin.disableTable(tn);
			admin.deleteTable(tn);
		}
		/*if (admin.tableExists(tableName)) {
			admin.disableTable(tableName);
			admin.deleteTable(tableName);
		}*/
		HTableDescriptor tableDescriptor = null;
		HColumnDescriptor hd = null;
		for (int i = 0; i < fams.length; i++) {
			tableDescriptor = new HTableDescriptor(tn);
			hd = new HColumnDescriptor(fams[i]);
			hd.setMaxVersions(version);
			tableDescriptor.addFamily(hd);
			admin.createTable(tableDescriptor);
		}
		admin.close();
	}
	
	
	/**
	 * 删除表
	 * @param tableName
	 * @throws Exception
	 */
	public static void delTable(String tableName) throws Exception {
//		HBaseAdmin admin = new HBaseAdmin(connection);
		Admin admin = connection.getAdmin();
		TableName tn = TableName.valueOf(tableName);
		/*if (admin.tableExists(tableName)) {
			admin.disableTable(tableName);
			admin.deleteTable(tableName);
		}*/
		if (admin.tableExists(tn)) {
			admin.disableTable(tn);
			admin.deleteTable(tn);
		}
		admin.close();
	}
	
	/**
	 * getGid
	 * @param row
	 * @throws Exception
	 */
	public static long getGid(String row) throws Exception {
		Table table_gid = connection.getTable(TableName.valueOf("gid"));
//		HTable table_gid = new HTable(TableName.valueOf("gid"), connection);
		long id = table_gid.incrementColumnValue(Bytes.toBytes(row), Bytes.toBytes("gid"), Bytes.toBytes(row), 1);
		table_gid.close();
		return id;
	}
	
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, String rowKey, String family, String qualifier, String value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.toBytes(rowKey));
//		put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey, String family, Long qualifier, String value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.toBytes(rowKey));
//		put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey01,Long rowKey02, String family, String qualifier, Long value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.add(Bytes.toBytes(rowKey01), Bytes.toBytes(rowKey02)));
		if (qualifier!=null) {
//			put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
			put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		}else{
//			put.add(Bytes.toBytes(family), null, Bytes.toBytes(value));
			put.addColumn(Bytes.toBytes(family), null, Bytes.toBytes(value));
		}
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey01,Long rowKey02,Long rowKey03, String family, String qualifier, Long value01, Long value02) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.add(Bytes.toBytes(rowKey01), Bytes.toBytes(rowKey02), Bytes.toBytes(rowKey03)));
		if (qualifier!=null) {
//			put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.add(Bytes.toBytes(value01), Bytes.toBytes(value02)));
			put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.add(Bytes.toBytes(value01), Bytes.toBytes(value02)));
		}else{
//			put.add(Bytes.toBytes(family), null, Bytes.add(Bytes.toBytes(value01), Bytes.toBytes(value02)));
			put.addColumn(Bytes.toBytes(family), null, Bytes.add(Bytes.toBytes(value01), Bytes.toBytes(value02)));
		}
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey01,Long rowKey02, String family, String qualifier, String value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.add(Bytes.toBytes(rowKey01), Bytes.toBytes(rowKey02)));
		if (qualifier!=null) {
//			put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
			put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		}else{
//			put.add(Bytes.toBytes(family), null, Bytes.toBytes(value));
			put.addColumn(Bytes.toBytes(family), null, Bytes.toBytes(value));
		}
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey, String family, String qualifier, String value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.toBytes(rowKey));
//		put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, Long rowKey, String family, String qualifier, Long value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.toBytes(rowKey));
//		put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		table.put(put);
		table.close();
	}
	/**
	 * 添加数据
	 * @param tableName
	 * @param rowKey
	 * @param family
	 * @param qualifier
	 * @param value
	 * @throws IOException
	 */
	public static void add(String tableName, String rowKey, String family, String qualifier, Long value) throws IOException {
		//连接到table
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Put put = new Put(Bytes.toBytes(rowKey));
//		put.add(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), Bytes.toBytes(value));
		table.put(put);
		table.close();
	}
	/**
	 * 根据row删除数据
	 * @param tableName
	 * @param rowKey
	 * @throws Exception
	 */
	public static void deleteRow(String tableName, String[] rowKey) throws Exception {
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		List<Delete> list = new ArrayList<Delete>();
		for (int i = 0; i < rowKey.length; i++) {
			Delete delete = new Delete(Bytes.toBytes(Long.valueOf(rowKey[i])));
			list.add(delete);
		}
		table.delete(list);
		table.close();
	}
	
	public static void deleteColumns(String tableName,Long rowKey,String family, Long qualifier) throws Exception {
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Delete delete = new Delete(Bytes.toBytes(rowKey));
//		delete.deleteColumns(Bytes.toBytes(family), Bytes.toBytes(qualifier));
		delete.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier));
		table.delete(delete);
		table.close();
	}
	public static void deleteRow(String tableName,Long rowKey01,Long rowKey02) throws Exception {
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		Delete delete = new Delete(Bytes.add(Bytes.toBytes(rowKey01), Bytes.toBytes(rowKey02)));
		table.delete(delete);
		table.close();
	}
	
	public static long getIdByUsername(String name) {
		long id = 0;
		try {
//			HTable table = new HTable(TableName.valueOf("user_id"), connection);
			Table table = connection.getTable(TableName.valueOf("user_id"));
			Get get = new Get(Bytes.toBytes(name));
			get.addColumn(Bytes.toBytes("id"), Bytes.toBytes("id"));
			Result rs = table.get(get);
			byte[] value = rs.getValue(Bytes.toBytes("id"), Bytes.toBytes("id"));
			id = Bytes.toLong(value);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
			return id;
		}
		return id;
	}
	
	public boolean checkUsername(String name) {
		try {
//			HTable table = new HTable(TableName.valueOf("user_id"), connection);
			Table table = connection.getTable(TableName.valueOf("user_id"));
			Get get = new Get(Bytes.toBytes(name));
			table.exists(get);
			if (table.exists(get)) {
				table.close();
				return true;
			}else{
				table.close();
				return false;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static String getUserNameById(long id) {
		String name = null;
		try {
//			HTable table = new HTable(TableName.valueOf("id_user"), connection);
			Table table = connection.getTable(TableName.valueOf("id_user"));
			Get get = new Get(Bytes.toBytes(id));
			get.addColumn(Bytes.toBytes("user"), Bytes.toBytes("name"));
			Result rs = table.get(get);
			byte[] value = rs.getValue(Bytes.toBytes("user"), Bytes.toBytes("name"));
			name = Bytes.toString(value);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return name;
	}
	
	public static String getStringById(String tableName,Long rowKey,String family,String qualifier) {
		String name = null;
		try {
//			HTable table = new HTable(TableName.valueOf(tableName), connection);
			Table table = connection.getTable(TableName.valueOf(tableName));
			Get get = new Get(Bytes.toBytes(rowKey));
			get.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier));
			Result rs = table.get(get);
			byte[] value = rs.getValue(Bytes.toBytes(family), Bytes.toBytes(qualifier));
			name = Bytes.toString(value);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return name;
	}
	/**
	 * 通过目录名获取ID
	 * @param name
	 * @return
	 */
	public static long getIdByDirName(String name) {
		long id = 0;
		try {
//			HTable table = new HTable(TableName.valueOf("hdfs_name"), connection);
			Table table = connection.getTable(TableName.valueOf("hdfs_name"));
			Get get = new Get(name.getBytes());
			get.addColumn(Bytes.toBytes("id"), Bytes.toBytes("id"));
			Result rs = table.get(get);
			byte[] value = rs.getValue(Bytes.toBytes("id"), Bytes.toBytes("id"));
			id = Bytes.toLong(value);
			table.close();
		} catch (IOException e) {
			e.printStackTrace();
			return id;
		}
		return id;
	}
	
	public static boolean checkEmail(String email) throws Exception {
//		HTable table = new HTable(TableName.valueOf("email_user"), connection);
		Table table = connection.getTable(TableName.valueOf("email_user"));
		Get get = new Get(Bytes.toBytes(email));
		get.addColumn(Bytes.toBytes("user"), Bytes.toBytes("userid"));
		Result rs = table.get(get);
		byte[] value = rs.getValue(Bytes.toBytes("user"), Bytes.toBytes("userid"));
		table.close();
		if(value!=null){
			return true;
		}else {
			return false;
		}
	}
	
	public long checkUser(String userName,String pwd) throws Exception {
		long id = getIdByUsername(userName);
		if (id==0) {
			return 0;
		}
//		HTable table = new HTable(TableName.valueOf("id_user"), connection);
		Table table = connection.getTable(TableName.valueOf("id_user"));
		Get get = new Get(Bytes.toBytes(id));
		get.addColumn(Bytes.toBytes("user"), Bytes.toBytes("pwd"));
		Result rs = table.get(get);
		byte[] value = rs.getValue(Bytes.toBytes("user"), Bytes.toBytes("pwd"));
		if (pwd.equals(Bytes.toString(value))) {
			table.close();
			return id;
		}
		table.close();
		return 0;
	}
	
	public void queryAll(String tableName) throws Exception {
//		HTable table = new HTable(TableName.valueOf(tableName), connection);
		Table table = connection.getTable(TableName.valueOf(tableName));
		ResultScanner rs = table.getScanner(new Scan());
		for (Result result : rs) {
			System.out.println("rowkey" +result.getRow());
			for (Cell cell : result.rawCells()) {
				System.out.println("family"+new String(cell.getFamilyArray()));
				System.out.println("Qualifier"+new String(cell.getQualifierArray()));
				System.out.println("value"+new String(cell.getValueArray()));
			}
		}
		table.close();
	}
	
	public void queryAllHDFS(String username) throws Exception {
//		HTable table = new HTable(TableName.valueOf("hdfs"), connection);
		Table table = connection.getTable(TableName.valueOf("hdfs"));
		ResultScanner rs = table.getScanner(new Scan());
		for (Result result : rs) {
			System.out.println("rowkey" +result.getRow());
			for (Cell cell : result.rawCells()) {
				System.out.println("family"+new String(cell.getFamilyArray()));
				System.out.println("Qualifier"+new String(cell.getQualifierArray()));
				System.out.println("value"+new String(cell.getValueArray()));
			}
		}
		table.close();
	}
	
	public static List<Menu> qureyAllEmun() throws Exception {
//		HTable table = new HTable(TableName.valueOf("emun"), connection);
		Table table = connection.getTable(TableName.valueOf("emun"));
		ResultScanner rs = table.getScanner(new Scan());
		List<Menu> menus = new ArrayList<Menu>();
		Menu m = null;
		for (Result r : rs) {
			m = new Menu();
			byte[] name = r.getValue(Bytes.toBytes("emun"), Bytes.toBytes("name"));
			byte[] url = r.getValue(Bytes.toBytes("emun"), Bytes.toBytes("url"));
			m.setName(Bytes.toString(name));
			m.setUrl(Bytes.toString(url));
			m.setText(Bytes.toString(name));
			menus.add(m);
		}
		table.close();
		return menus;
	}
	
	public static void getAllUserTree(Long id) throws Exception {
//		HTable table_hdfs = new HTable(TableName.valueOf("hdfs"), connection);
//		HTable table = new HTable(TableName.valueOf("hdfs_cid"), connection);
		Table table_hdfs = connection.getTable(TableName.valueOf("hdfs"));
		Table table = connection.getTable(TableName.valueOf("hdfs_cid"));
		Get get = new Get(Bytes.toBytes(id));
		Result rs = table.get(get);
//		List<Menu> menus = new ArrayList<Menu>();
		Menu menu = null;
		for (Cell cell : rs.rawCells()) {
			Get get1 = new Get(CellUtil.cloneValue(cell));
			get1.addColumn(Bytes.toBytes("dir"), Bytes.toBytes("name"));
			Result rs1 = table_hdfs.get(get1);
			byte[] value = rs1.getValue(Bytes.toBytes("dir"), Bytes.toBytes("name"));
			String name = Bytes.toString(value);
			
			get1.addColumn(Bytes.toBytes("dir"), Bytes.toBytes("type"));
//			Result rs2 = table_hdfs.get(get1);
//			byte[] type = rs2.getValue(Bytes.toBytes("dir"), Bytes.toBytes("type"));
//			String y = Bytes.toString(type);
			menu = new Menu();
			menu.setId(Bytes.toString(CellUtil.cloneValue(cell)));
			menu.setName(name);
		}
		table.close();
	}
	
	public static List<FileSystemVo> getFile(String dir) throws Exception {
//		HTable fileTable = new HTable(TableName.valueOf("filesystem"), connection);
		Table fileTable = connection.getTable(TableName.valueOf("filesystem"));
		Scan scan = new Scan();
		Filter filter = new QualifierFilter(CompareOp.LESS_OR_EQUAL, new SubstringComparator(dir));
		scan.setFilter(filter);
		ResultScanner rs = fileTable.getScanner(scan);
		List<FileSystemVo> fs = new ArrayList<FileSystemVo>();
		FileSystemVo f = null;
		for (Result r : rs) {
			Cell cellName = r.getColumnLatestCell(Bytes.toBytes("files"), Bytes.toBytes("name"));
			Cell cellPdir = r.getColumnLatestCell(Bytes.toBytes("files"), Bytes.toBytes("pdir"));
			Cell cellType = r.getColumnLatestCell(Bytes.toBytes("files"), Bytes.toBytes("type"));
			Cell cellSize = r.getColumnLatestCell(Bytes.toBytes("files"), Bytes.toBytes("size"));
			f = new FileSystemVo();
			f.setId(Bytes.toLong(r.getRow()));
			f.setDir(dir);
			f.setName(Bytes.toString(CellUtil.cloneValue(cellName)));
			if (cellSize!=null) {
				f.setSize(Bytes.toString(CellUtil.cloneValue(cellSize)));
			}
			if(cellPdir!=null){
				f.setPdir(Bytes.toString(CellUtil.cloneValue(cellPdir)));
			}
			if (cellType!=null) {
				f.setType(Bytes.toString(CellUtil.cloneValue(cellType)));
			}
			f.setDate(DateUtil.longToString("yyyy-MM-dd HH:mm", cellName.getTimestamp()));
			fs.add(f);
		}
		fileTable.close();
		return fs;
	}
	
	public static void delByDir(String dir) throws Exception {
//		HTable fileTable = new HTable(TableName.valueOf("filesystem"), connection);
		Table fileTable = connection.getTable(TableName.valueOf("filesystem"));
		Scan scan = new Scan();
		Filter filter = new QualifierFilter(CompareOp.LESS_OR_EQUAL, new BinaryComparator(Bytes.toBytes(dir)));
		scan.setFilter(filter);
		ResultScanner rs = fileTable.getScanner(scan);
		for (Result r : rs) {
			fileTable.delete(new Delete(r.getRow()));
		}
		fileTable.close();
	}
	
	public boolean follow(String oname,String dname) throws Exception {
		long oid = this.getIdByUsername(oname);
		long did = this.getIdByUsername(dname);
		if (oid == 0 || did == 0 || oid == did){
			return false;
		}
		this.add("follow", oid, "name", did, dname);
		
		this.add("followed", did, oid, "userid", null, oid);
		return true;
	}
	public boolean unfollow(String oname,String dname) throws Exception {
		long oid = this.getIdByUsername(oname);
		long did = this.getIdByUsername(dname);
		if (oid == 0 || did == 0 || oid == did){
			return false;
		}
		this.deleteColumns("follow", oid, "name", did);
		
		this.deleteRow("followed", did, oid);
		return true;
	}
	/**
	 * 获取关注的用户
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Set<String> getFollow(String username) throws Exception {
		Set<String> set = new HashSet<String>();
		long id = this.getIdByUsername(username);
//		HTable table = new HTable(TableName.valueOf("follow"), connection);
		Table table = connection.getTable(TableName.valueOf("follow"));
		Get get = new Get(Bytes.toBytes(id));
		Result rs = table.get(get);
		for (Cell cell : rs.rawCells()) {
			set.add(Bytes.toString(CellUtil.cloneValue(cell)));
		}
		return set;
	}
	/**
	 * 分享文件及文件夹
	 * @param username
	 * @param path
	 * @param shareusername
	 * @throws Exception
	 */
	public void share(String dir,String username,String[] path,String[] type,String shareusername) throws Exception {
		long uid = getIdByUsername(username);
		for (int i = 0; i < path.length; i++) {
			long id = getGid("shareid");
			add("share", uid,id, "content", "dir", dir);
			add("share", uid,id, "content", "type", type[i]);
			add("share", uid,id, "content", "path", path[i]);
			add("share", uid,id, "content", "ts", DateUtil.DateToString("yyyy-MM-dd HH:mm", new Date()));
			
			long suid = getIdByUsername(shareusername);
			add("shareed", suid,uid,id, "shareid", null, uid,id);
		}
	}
	/**
	 * 分享列表
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public List<ShareVo> getshare(String name) throws Exception {
		long uid = getIdByUsername(name);
		Scan scan = new Scan();
		scan.setStartRow(Bytes.toBytes(uid));
		scan.setStopRow(Bytes.toBytes(uid+1));
//		HTable share_table = new HTable(TableName.valueOf("share"), connection);
		Table share_table = connection.getTable(TableName.valueOf("share"));
		ResultScanner rs = share_table.getScanner(scan);
		List<ShareVo> shareVos = new ArrayList<ShareVo>();
		ShareVo share = null;
		for (Result r : rs) {
			Cell cellPath = r.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("path"));
			Cell cellTs = r.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("ts"));
			Cell cellType = r.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("type"));
			Cell cellDir = r.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("dir"));
			share = new ShareVo();
			share.setShareid(Bytes.toString(r.getRow()));
			share.setPath(Bytes.toString(CellUtil.cloneValue(cellPath)));
			share.setTs(Bytes.toString(CellUtil.cloneValue(cellTs)));
			share.setType(Bytes.toString(CellUtil.cloneValue(cellType)));
			share.setDir(Bytes.toString(CellUtil.cloneValue(cellDir)));
			shareVos.add(share);
		}
		share_table.close();
		return shareVos;
	}
	/**
	 * 被分享
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public List<FileSystemVo> getshareed(String username) throws Exception {
		long uid = getIdByUsername(username);
		Scan scan = new Scan();
		scan.setStartRow(Bytes.toBytes(uid));
		scan.setStopRow(Bytes.toBytes(uid+1));
//		HTable shareed_table = new HTable(TableName.valueOf("shareed"), connection);
		Table shareed_table = connection.getTable(TableName.valueOf("shareed"));
		ResultScanner rs = shareed_table.getScanner(scan);
//		HTable share_table = new HTable(TableName.valueOf("share"), connection);
		Table share_table = connection.getTable(TableName.valueOf("share"));
		List<FileSystemVo> fs = new ArrayList<FileSystemVo>();
		FileSystemVo f = null;
		for (Result r : rs) {
			Result shareRs = share_table.get(new Get(r.getValue(Bytes.toBytes("shareid"), null)));
			Cell cellPath = shareRs.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("path"));
			Cell cellTs = shareRs.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("ts"));
			Cell cellType = shareRs.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("type"));
			Cell cellDir = shareRs.getColumnLatestCell(Bytes.toBytes("content"), Bytes.toBytes("dir"));
			f = new FileSystemVo();
//			f.setShareid(Bytes.toString(shareRs.getRow()));
			f.setName(Bytes.toString(CellUtil.cloneValue(cellPath)));
			f.setDate(Bytes.toString(CellUtil.cloneValue(cellTs)));
			f.setType(Bytes.toString(CellUtil.cloneValue(cellType)));
			f.setDir(Bytes.toString(CellUtil.cloneValue(cellDir)));
			fs.add(f);
		}
		share_table.close();
		shareed_table.close();
		return fs;
	}
	/**
	 * 新增记事本
	 * @param username
	 * @param content
	 * @throws Exception
	 */
	public void addbook(String username,String content) throws Exception {
		long uid = getIdByUsername(username);
		long id = getGid("bookid");
		add("book", uid, id, "content", null, content);
	}
	/**
	 * 查询记事本
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public List<bookVo> listbook(String username) throws Exception {
		long uid = getIdByUsername(username);
		Scan scan = new Scan();
		scan.setStartRow(Bytes.toBytes(uid));
		scan.setStopRow(Bytes.toBytes(uid+1));
//		HTable table = new HTable(TableName.valueOf("book"), connection);
		Table table = connection.getTable(TableName.valueOf("book"));
		ResultScanner rs = table.getScanner(scan);
		List<bookVo> books = new ArrayList<bookVo>();
		bookVo book = null;
		for (Result r : rs) {
			book = new bookVo();
			book.setId(Bytes.toString(r.getRow()));
			book.setContent(Bytes.toString(r.getValue(Bytes.toBytes("content"), null)));
			books.add(book);
		}
		table.close();
		return books;
	}
	
	public static void main(String[] args) throws Exception {
//		HbaseDB db = new HbaseDB();
		
		System.out.println("ok");
	}
}
