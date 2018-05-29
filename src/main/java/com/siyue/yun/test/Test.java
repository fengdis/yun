package com.siyue.yun.test;

import java.io.IOException;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


public class Test {

	public static void main(String[] args) {
		/*Connection connection;
		Configuration conf = HBaseConfiguration.create();
		conf.set("hbase.zookeeper.quorum", "192.168.0.80");
		//conf.set("hbase.master", "192.168.0.80:600000");
		try {
//			connection = HConnectionManager.createConnection(conf);
			connection = ConnectionFactory.createConnection(conf);
			System.out.println("====================="+connection);
			//HBaseAdmin admin = new HBaseAdmin(connection);
			Admin admin = connection.getAdmin();
			HTableDescriptor[] listTables = admin.listTables();
			for(HTableDescriptor item : listTables){
				System.out.println("--------------"+item.getNameAsString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		String str = "[{'id':'1','score':'99'},{'id':'2','score':'88'}]";
		JSONArray array = JSON.parseArray(str);
		for(int i=0;i<array.size();i++){
			JSONObject jsonObject = array.getJSONObject(i);
			String id = (String) jsonObject.get("id");
			String score = (String) jsonObject.get("score");
			System.out.println("=========="+id);
			System.out.println("=========="+score);
		}
	}
}
