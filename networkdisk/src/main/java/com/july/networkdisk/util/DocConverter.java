package com.july.networkdisk.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.InputStream;
public class DocConverter {
    private static final int environment=1;//环境1：windows 2:linux(涉及pdf2swf路径问题)
    private String fileString;
    private String outputPath="";//输出路径，如果不设置就输出在默认位置
    private String fileName;
    private File pdfFile;
    private File swfFile;
    private File docFile;
    private Integer flag;		//判读文件是pdf还是office文件
    
    public DocConverter(String fileString)
    {
        ini(fileString);
    }
    
    /*
     * 重新设置 file
     * @param fileString
     */
    public void setFile(String fileString)
    {
        ini(fileString);
    }
    
    /*
     * 初始化
     * @param fileString
     */
    private void ini(String fileString)
    {
    	flag = 0;
        this.fileString=fileString;
        fileName=fileString.substring(0,fileString.lastIndexOf("."));
        String type=fileString.substring(fileString.lastIndexOf(".")+1,fileString.length());
        if(type.equals("pdf")){
        	flag = 1;
        }
        docFile=new File(fileString);
        pdfFile=new File(fileName+".pdf");
        swfFile=new File(fileName+".swf");
    }
    
    /*
     * 转为PDF
     * @param file
     */
    private void doc2pdf() throws Exception
    {
        if(docFile.exists())
        {
            if(!pdfFile.exists())
            {
                try
                {
                    OfficeToPdf.getOffice2PdfUtil().office2Pdf(docFile.getPath(), pdfFile.getPath());
                    System.out.println("****pdf转换成功，PDF输出："+pdfFile.getPath()+"****");
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    throw e;
                }
            }
            else
            {
                System.out.println("****已经转换为pdf，不需要再进行转化****");
            }
        }
        else
        {
            System.out.println("****swf转换器异常，需要转换的文档不存在，无法转换****");
        }
    }
    
    /*
     * 转换成swf
     */
    public void pdf2swf() throws Exception
    {
        Runtime r=Runtime.getRuntime();
        if(!swfFile.exists())
        {
            if(pdfFile.exists())
            {
                if(environment==1)//windows环境处理
                {
                    try {
                        Process p=r.exec("C:/Program Files (x86)/SWFTools/pdf2swf.exe "+pdfFile.getPath()+" -o "+swfFile.getPath()+" -T 9");
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.print(loadStream(p.getErrorStream()));
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.println("****swf转换成功，文件输出："+swfFile.getPath()+"****");
                        if(pdfFile.exists() && flag == 0)
                        {
                            pdfFile.delete();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        throw e;
                    }
                }
                else if(environment==2)//linux环境处理
                {
                    try {
                        Process p=r.exec("pdf2swf "+pdfFile.getPath()+" -o "+swfFile.getPath()+" -T 9");
                        System.out.print(loadStream(p.getInputStream()));
                        System.err.print(loadStream(p.getErrorStream()));
                        System.err.println("****swf转换成功，文件输出："+swfFile.getPath()+"****");
                        if(pdfFile.exists()&& flag == 0)
                        {
                            pdfFile.delete();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        throw e;
                    }
                }
            }
            else {
                System.out.println("****pdf不存在，无法转换****");
            }
        }
        else {
            System.out.println("****swf已存在不需要转换****");
        }
    }
    
    static String loadStream(InputStream in) throws Exception
    {
        int ptr=0;
        in=new BufferedInputStream(in);
        StringBuffer buffer=new StringBuffer();
        
        while((ptr=in.read())!=-1)
        {
            buffer.append((char)ptr);
        }
        return buffer.toString();
    }
    
    /*
     * 转换主方法
     */
    public boolean conver()
    {
        if(swfFile.exists())
        {
        	
            System.out.println("****swf转换器开始工作，该文件已经转换为swf****");
            return true;
        }
        
        if(environment==1)
        {
            System.out.println("****swf转换器开始工作，当前设置运行环境windows****");
        }
        else {
            System.out.println("****swf转换器开始工作，当前设置运行环境linux****");
        }
        
        try {
        	if(flag == 0){
        		doc2pdf();
        	}
        		pdf2swf();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
        if(swfFile.exists())
        {
        	
            return true;
        }
        else {
            return false;
        }
    }
    
    /*
     * 返回文件路径
     * @param s
     */
    public String getswfPath()
    {
        if(swfFile.exists())
        {
            String tempString =swfFile.getPath();
            tempString=tempString.replaceAll("\\\\", "/");
            return tempString;
        }
        else{
            return "";
        }
    }
    
    /*
     * 设置输出路径
     */
    public void setOutputPath(String outputPath)
    {
        this.outputPath=outputPath;
        if(!outputPath.equals(""))
        {
            String realName=fileName.substring(fileName.lastIndexOf("/"),fileName.lastIndexOf("."));
            if(outputPath.charAt(outputPath.length())=='/')
            {
                swfFile=new File(outputPath+realName+".swf");
            }
            else
            {
                swfFile=new File(outputPath+realName+".swf");
            }
        }
    }
    
    public static void main(String s[])
    {
        DocConverter d=new DocConverter("D:/networkdiskFile/任务清单.txt");
        d.conver();
    }
}