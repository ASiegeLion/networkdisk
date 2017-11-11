package com.july.networkdisk.util;
import java.io.File;  

import org.artofsolving.jodconverter.OfficeDocumentConverter;  
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;  
import org.artofsolving.jodconverter.office.OfficeManager;  

  
 
public class OfficeToPdf{  
      
    private static OfficeToPdf office2PdfUtil = new OfficeToPdf();  
    private static  OfficeManager officeManager;  
    //openOffice安装路径  
    private static String OPEN_OFFICE_HOME = "C:\\Program Files (x86)\\OpenOffice 4";   //linux系统为/opt/openoffice4  windows系统为C:\\Program Files (x86)\\OpenOffice 4
    //服务端口  
    private static int OPEN_OFFICE_PORT[] = {8100};  
      
    public static OfficeToPdf getOffice2PdfUtil() {  
        return office2PdfUtil;  
    }  
      
    /** 
     *  
     * office2Pdf 方法 
     * @param inputFile 文件全路径 
     * @param pdfFilePath pdf文件全路径 
     * @return void 
     * @author lxz 
     * @return  
     */      
    public void office2Pdf(String inputFile,String pdfFilePath) {  
    	if(inputFile.endsWith(".txt")) {  
            
    		 //先保存为.odt  
            StringBuffer odtPath = new StringBuffer(inputFile.substring(0 , inputFile.lastIndexOf(".")));  
            odtPath.append(".odt");  
            
            FileUtil.write(inputFile , odtPath.toString());  
            inputFile = odtPath.toString(); 
             
        }  
        File pdfFile = new File(pdfFilePath);  
        if (pdfFile.exists()) {  
            pdfFile.delete();  
        }  
        try{  
            long startTime = System.currentTimeMillis();  
            //打开服务  
            startService();          
            OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);  
            //开始转换  
            converter.convert(new File(inputFile),new File(pdfFilePath));  
            //关闭  
            stopService();  
            System.out.println("运行结束");  
            if(inputFile.endsWith(".odt")){
            	new File(inputFile).delete();
            }
           
        }catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static void stopService(){  
        if (officeManager != null) {  
            officeManager.stop();  
        }  
    }  
      
    public static void startService(){  
        DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();  
        try {  
            configuration.setOfficeHome(OPEN_OFFICE_HOME);//设置安装目录  
            configuration.setPortNumbers(OPEN_OFFICE_PORT); //设置端口  
            configuration.setTaskExecutionTimeout(1000 * 60 * 5L);  
            configuration.setTaskQueueTimeout(1000 * 60 * 60 * 24L);  
            officeManager = configuration.buildOfficeManager();  
            officeManager.start();    //启动服务  
        } catch (Exception ce) {  
            System.out.println("office转换服务启动失败!详细信息:" + ce);  
        }  
    } 
    
    public static void main(String[] args) {
    	String inputFile="D:\\Javanew面试宝典2012版.doc";
    	String pdfFilePath="D:\\Javanew面试宝典2012版.pdf";
		OfficeToPdf.getOffice2PdfUtil().office2Pdf(inputFile, pdfFilePath);
	}
}  