package com.siyue.yun.utils;

import java.text.DecimalFormat;

public class BaseUtils {
	public static String FormetFileSize(long fileS) {
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
	
	public static boolean isNotEmpty(String str) {
		if(str!=null && !"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	public static String getUrl(String str) {
		String[] ss = str.split("/");
		if(ss.length>2){
			StringBuffer sb = new StringBuffer();
			for (int i = 2; i < ss.length; i++) {
				sb.append("<a href='cloud/list.do?name="+str.substring(0, str.indexOf(ss[i])-1)+"'>"+ss[i-1]+"</a>").append("|");
			}
			return sb.deleteCharAt(sb.length()-1).toString();
		}
		return null;
	}
	
	public static void main(String[] args) {
//		System.out.println(isNotEmpty("null"));
//		System.out.println(getUrl("/admin/sss/asdsd"));
//		String s = "dsdsda.zip";
		String s = "dsdsdawwzip";
		System.out.println(s.lastIndexOf("."));
	}
}
