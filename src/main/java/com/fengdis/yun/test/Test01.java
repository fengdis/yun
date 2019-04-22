package com.fengdis.yun.test;

import java.text.DecimalFormat;

public class Test01 {

	public static void main(String[] args) {
		Long m = 7940268l;
//		System.out.println(m/1024+"KB");
//		System.out.println(m/(1024*1024)+"MB");
		System.out.println(FormetFileSize(m));
	}
	
	public static String FormetFileSize(long fileS) {//转换文件大小
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "G";
        }
        return fileSizeString;
    }
}
