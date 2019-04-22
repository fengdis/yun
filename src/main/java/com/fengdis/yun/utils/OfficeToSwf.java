package com.fengdis.yun.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;

public class OfficeToSwf {
	private static  OfficeManager officeManager;
    private static int port[] = {8100};

    public static void convert2PDF(String inputFile, String pdfFile) {
        
        if(inputFile.endsWith(".txt")){
            String odtFile = FileUtils.getFilePrefix(inputFile)+".odt";
            if(new File(odtFile).exists()){
                //System.out.println("odt文件已存在！");
                inputFile = odtFile;
            }else{
                try {
                    FileUtils.copyFile(inputFile,odtFile);
                    inputFile = odtFile;
                } catch (FileNotFoundException e) {
                    //System.out.println("文档不存在！");
                    e.printStackTrace();
                }
            }
        }
        
        startService();
        //System.out.println("进行文档转换转换:" + inputFile + " --> " + pdfFile);
        OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);
        converter.convert(new File(inputFile),new File(pdfFile));
        stopService();
        //System.out.println();
        
        pdftoswf(pdfFile);
    }


	public static void pdftoswf(String pdfFile) {
		File pdfFile01 = new File(pdfFile);
        String swfFile = FileUtils.getFilePrefix(pdfFile)+".swf";
		File outFile = new File(swfFile);
		if(!pdfFile.endsWith(".pdf")){
			//System.out.println("文件格式非PDF！");
			return ;
		}
		if(!pdfFile01.exists()){
			//System.out.println("PDF文件不存在！");
			return ;
		}
		if(outFile.exists()){
			//System.out.println("SWF文件已存在！");
			return ;
		}
		String command = SiteUrl.readUrl("pdf2swf") +" \""+pdfFile+"\" -o "+swfFile+" -T 9 -f";
		try {
			//System.out.println("开始转换文档: "+inputFile);
			Runtime.getRuntime().exec(command);
			//System.out.println("成功转换为SWF文件！");
		} catch (IOException e) {
			e.printStackTrace();
			//System.out.println("转换文档为swf文件失败！");
		}
	}


    public static void convert2PDF(String inputFile) {
        String pdfFile = FileUtils.getFilePrefix(inputFile)+".pdf";
        convert2PDF(inputFile,pdfFile);
    }
    
    private static void startService(){
        DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();
        try {
          //System.out.println("准备启动服务....");
            configuration.setOfficeHome(SiteUrl.readUrl("openoffice"));//设置OpenOffice.org安装目录
            configuration.setPortNumbers(port); //设置转换端口，默认为8100
            configuration.setTaskExecutionTimeout(1000 * 60 * 5L);//设置任务执行超时为5分钟
            configuration.setTaskQueueTimeout(1000 * 60 * 60 * 24L);//设置任务队列超时为24小时
         
            officeManager = configuration.buildOfficeManager();
            officeManager.start();    //启动服务
            //System.out.println("office转换服务启动成功!");
        } catch (Exception ce) {
            //System.out.println("office转换服务启动失败!详细信息:" + ce);
            ce.printStackTrace();
        }
    }
    
    private static void stopService(){
          //System.out.println("关闭office转换服务....");
            if (officeManager != null) {
                officeManager.stop();
            }
            //System.out.println("关闭office转换成功!");
    }
    
    public static void main(String[] args) {
		convert2PDF("F:\\status.csv");
	}
}
