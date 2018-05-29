package com.siyue.yun.pdf;

import java.io.File;
import java.io.IOException;

import com.siyue.yun.utils.FileUtils;
import com.siyue.yun.utils.SiteUrl;

public class SWFToolsSWFConverter implements SWFConverter{

	@Override
	public void convert2SWF(String inputFile, String swfFile) {
		File pdfFile = new File(inputFile);
		File outFile = new File(swfFile);
		if(!inputFile.endsWith(".pdf")){
			//System.out.println("文件格式非PDF！");
			return ;
		}
		if(!pdfFile.exists()){
			//System.out.println("PDF文件不存在！");
			return ;
		}
		if(outFile.exists()){
			//System.out.println("SWF文件已存在！");
			return ;
		}
		String command = SiteUrl.readUrl("pdf2swf") +" \""+inputFile+"\" -o "+swfFile+" -T 9 -f";
		try {
			//System.out.println("开始转换文档: "+inputFile);
			Runtime.getRuntime().exec(command);
			//System.out.println("成功转换为SWF文件！");
		} catch (IOException e) {
			e.printStackTrace();
			//System.out.println("转换文档为swf文件失败！");
		}
		
	}

	@Override
	public void convert2SWF(String inputFile) {
		String swfFile = FileUtils.getFilePrefix(inputFile)+".swf";
		convert2SWF(inputFile,swfFile);
	}

	public static void main(String[] args) {
		SWFToolsSWFConverter swf = new SWFToolsSWFConverter();
		swf.convert2SWF("D:\\activiti.pdf");
	}
}
