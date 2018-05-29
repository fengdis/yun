package com.siyue.yun.test;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 读取目录及子目录下指定文件名的路径 并放到一个数组里面返回遍历
 * 
 * @author zdz8207
 * 
 */
public class FileViewer {
	public static void main(String[] args) {
		List arrayList = FileViewer.getListFiles("E:/baiduyundownload", null, true);

		if (arrayList.isEmpty()) {
			System.out.println("没有符号要求的文件");
		} else {
			String message = "";
			message += "符号要求的文件数：" + arrayList.size() + "\r\n";
			System.out.println(message);

			for (Iterator i = arrayList.iterator(); i.hasNext();) {
				String temp = (String) i.next();
				System.out.println(temp);
				message += temp + "\r\n";
			}

			// appendMethod("d:/ajax/menu.txt",message);
		}
	}

	public static List<String> fileList = new ArrayList<String>();

	/**
	 * 
	 * @param path
	 *            文件路径
	 * @param suffix
	 *            后缀名
	 * @param isdepth
	 *            是否遍历子目录
	 * @return
	 */
	public static List getListFiles(String path, String suffix, boolean isdepth) {
		File file = new File(path);
		return FileViewer.listFile(file, suffix, isdepth);
	}

	public static List listFile(File f, String suffix, boolean isdepth) {
		// 是目录，同时需要遍历子目录
		if (f.isDirectory() && isdepth == true) {
			File[] t = f.listFiles();
			for (int i = 0; i < t.length; i++) {
				listFile(t[i], suffix, isdepth);
			}
		} else {
			String filePath = f.getAbsolutePath();

			if (suffix != null) {
				int begIndex = filePath.lastIndexOf(".");// 最后一个.(即后缀名前面的.)的索引
				String tempsuffix = "";

				if (begIndex != -1)// 防止是文件但却没有后缀名结束的文件
				{
					tempsuffix = filePath.substring(begIndex + 1, filePath.length());
				}

				if (tempsuffix.equals(suffix)) {
					fileList.add(filePath);
				}
			} else {
				// 后缀名为null则为所有文件
				fileList.add(filePath);
			}

		}

		return fileList;
	}

	/**
	 * 方法追加文件：使用FileWriter
	 * 
	 * @param fileName
	 * @param content
	 */
	public static void appendMethod(String fileName, String content) {
		try {
			// 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件
			FileWriter writer = new FileWriter(fileName, true);
			writer.write(content + "\r\n");
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}