package com.july.networkdisk.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;


/**
 * 上传的文件备份到hadoop的hdfs中
 * @author 柳培岳
 *
 */
public class FileBak implements Runnable {
	private String path;
	private FileSystem fileSystem;
	private String dfsPath;
	private String dirPath;
	
	public FileBak(String path) throws Exception {
		this.path = path.replaceAll("\\\\", "/");
		dirPath=path.substring(2,54);
		dfsPath = "hdfs://s100:8020";
		URI uri = new URI(dfsPath);
        Configuration conf = new Configuration();
        fileSystem = FileSystem.get(uri, conf);
	}
	
	/**
	 * 上传
	 * @throws Exception
	 * D:/networkdiskFile/94376d5c-56ac-42da-84e1-b0480a990f72/1e611c9f-5a80-408f-ba4b-5c48f4cb750c.zip
	 */
	public void upload() throws Exception{
		Path srcPath = new Path(path);  
        Path dstPath = new Path(dirPath);
        if(!fileSystem.exists(dstPath)){
        	fileSystem.mkdirs(dstPath);
        }
        fileSystem.copyFromLocalFile(false, srcPath, dstPath);
        fileSystem.close();
	}
	
	/**
	 * 下载
	 * @throws Exception
	 */
	public void download() throws Exception{
		InputStream in = fileSystem.open(new Path(path.substring(2)));
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}
        OutputStream out = new FileOutputStream(path);  
        IOUtils.copyBytes(in, out, 4096, true); 
        in.close();
        out.close();
	}
	public void run() {
		try {
			upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws Exception {
		FileBak fileBak = new FileBak("D:\\networkdiskFile\\94376d5c-56ac-42da-84e1-b0480a990f72\\088286a3-9f1e-47d5-8756-d04fcc8807ca.png");
			fileBak.upload();
	}
} 
