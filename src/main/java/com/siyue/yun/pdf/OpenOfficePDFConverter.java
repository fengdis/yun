package com.siyue.yun.pdf;

import java.io.File;
import java.io.FileNotFoundException;

import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;

import com.siyue.yun.utils.FileUtils;
import com.siyue.yun.utils.SiteUrl;

public class OpenOfficePDFConverter implements PDFConverter{
    
    private static  OfficeManager officeManager;
    private static int port[] = {8100};

    public  void convert2PDF(String inputFile, String pdfFile) {
        
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
        System.out.println("进行文档转换转换:" + inputFile + " --> " + pdfFile);
        OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);
        converter.convert(new File(inputFile),new File(pdfFile));
        stopService();
        //System.out.println();
    }


    public void convert2PDF(String inputFile) {
        String pdfFile = FileUtils.getFilePrefix(inputFile)+".pdf";
        convert2PDF(inputFile,pdfFile);
    }
    
    public static void startService(){
        DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();
        try {
            System.out.println("准备启动服务....");
            configuration.setOfficeHome(SiteUrl.readUrl("openoffice"));//设置OpenOffice.org安装目录
            configuration.setPortNumbers(port); //设置转换端口，默认为8100
            configuration.setTaskExecutionTimeout(1000 * 60 * 5L);//设置任务执行超时为5分钟
            configuration.setTaskQueueTimeout(1000 * 60 * 60 * 24L);//设置任务队列超时为24小时
         
            officeManager = configuration.buildOfficeManager();
            officeManager.start();    //启动服务
            System.out.println("office转换服务启动成功!");
        } catch (Exception ce) {
            System.out.println("office转换服务启动失败!详细信息:" + ce);
            ce.printStackTrace();
        }
    }
    
    public static void stopService(){
            System.out.println("关闭office转换服务....");
            if (officeManager != null) {
                officeManager.stop();
            }
            System.out.println("关闭office转换成功!");
    }
    
    public static void main(String[] args) {
    	OpenOfficePDFConverter op = new OpenOfficePDFConverter();
    	op.convert2PDF("E:\\工作\\陈志凯的交接文档.docx");
	}
}