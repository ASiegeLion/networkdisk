package com.july.networkdisk.web;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.july.networkdisk.service.IFileService;
import com.july.networkdisk.util.CommonUtil;
import com.july.networkdisk.util.ConvertVideo;
import com.july.networkdisk.util.DocConverter;
import com.july.networkdisk.util.JPG2PDFUtil;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.User;
import com.opensymphony.xwork2.ActionSupport;

public class FileAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private File file; // 上传的文件，对应表单的file的name属性
	private String fileFileName; // 文件名，xxxxFileName，xxx对应表单file的name属性
	private String fileContentType; // 文件类型，xxxContentType，xxx对应表单file的name属性
	private String netFileID; // 得到下载文件的ID或要预览office文件的id
	private String categorie_id; //上传文件夹的id
	private String swfFilePath; //得到swf文件的地址
	private Map<String, Object> map;//返回前台map;
	private String fileType;        //接受前台传过来的种类；
	
	private IFileService fileService;
	private User user = CommonUtil.getSessionUser(); // 获取session中的User

	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileType() {
		return fileType;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public String getSwfFilePath() {
		return swfFilePath;
	}
	public String getCategorie_id() {
		return categorie_id;
	}
	public void setCategorie_id(String categorie_id) {
		this.categorie_id = categorie_id;
	}
	public void setNetFileID(String netFileID) {
		this.netFileID = netFileID;
	}

	public String getNetFileID() {
		return netFileID;
	}


	public IFileService getFileService() {
		return fileService;
	}

	public void setFileService(IFileService fileService) {
		this.fileService = fileService;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	
	/**
	 * office文件和视频和图片预览
	 * @return
	 * @throws Exception
	 */
	public String officeView() throws Exception{
		NetFile officeFile = fileService.get(netFileID, 0);
		String type = officeFile.getType();
		if(type.equals("xls")||type.equals("word")||type.equals("pdf")||type.equals("ppt")||type.equals("docx")||type.equals("doc")||type.equals("txt"))
		{
			DocConverter docConverter = new DocConverter(officeFile.getPath());
			docConverter.conver();
			swfFilePath=docConverter.getswfPath();
			swfFilePath = swfFilePath.substring(2); //windows 为 2，linux 为 14；
			System.out.println(swfFilePath);
			
		}else if (type.equals("jpg")||type.equals("jpeg")||type.equals("png")||type.equals("gif")||type.equals("bmp")) {
			/*jpg、jpeg、png、gif、bmp*/
			JPG2PDFUtil pt=new JPG2PDFUtil(officeFile.getPath());
	        pt.imgtopdf();
	        DocConverter docConverter = new DocConverter(officeFile.getPath());
	        docConverter.pdf2swf();
	        swfFilePath=docConverter.getswfPath();
			swfFilePath = swfFilePath.substring(2); //windows 为 2，linux 为 14；
			System.out.println(swfFilePath);
		}else if (type.equals("wmv9")||type.equals("rm")||type.equals("rmvb")
				||type.equals("asx")||type.equals("asf")
				||type.equals("mpg")||type.equals("wmv")
				||type.equals("3gp")||type.equals("mp4")
				||type.equals("mov")||type.equals("avi")||type.equals("flv")) {
			/*wmv9，rm，rmvb，asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv*/
			String path =officeFile.getPath();
			swfFilePath=path.substring(0,  path.indexOf("."))+".flv";
			swfFilePath=swfFilePath.replaceAll("\\\\", "/");
			File file = new File(swfFilePath);
			if(!file.exists()){
				ConvertVideo convertVideo = new ConvertVideo(path);
	            convertVideo.process();        //执行转码任务
			}
			swfFilePath = swfFilePath.substring(2); //windows 为 2，linux 为 14；
			System.out.println(swfFilePath);
		}
		else {
			swfFilePath="文件类型错误";
		}
		return "json";
	}
	/**
	 * 展示文件按文件类型
	 * @return
	 */
	public String showFileByType(){
		map = new HashMap<String, Object>();
		String[] typestr= fileType.split(",");
		List<String> list = Arrays.asList(typestr);
		List<String> listtime= fileService.findTime(user.getId(), list);
		List<NetFile> files = fileService.findAllByType(user.getId(), list);
		map.put("listtime", listtime);
		map.put("files",files );
		return "json";
	}
	
	/**
	 * 展示文件按文件类型
	 * @return
	 */
	public String showOtherFile(){
		map = new HashMap<String, Object>();
		fileType="docx,ppt,xls,txt,xls,pdf,doc,mp4,rmvb,avi,mkv,wmv,3gp,mov,flv,jpg,jpeg,png,gif,bmp";
		String[] typestr= fileType.split(",");
		List<String> list = new ArrayList<String>();
		list= Arrays.asList(typestr);
		List<NetFile> files = fileService.findOtherType(user.getId(), list);
		map.put("files",files );
		return "json";
	}

	/**
	 * 文件上传
	 * 
	 * @return
	 * @throws Exception
	 */
	public String fileUpLoad() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String jsonString;
		PrintWriter out = response.getWriter();

		if (file == null) {
			jsonString = "上传文件失败！";
		} else {
			NetFile netFile = new NetFile();
			if("null".equals(categorie_id))
			{
				
			}else {
				netFile.setCatid(categorie_id);				
			}
			try {
				
				fileService.fileUpLoad(netFile, file, fileFileName,
						fileContentType, user);

			} catch (Exception e) {
				jsonString = "上传文件失败！";
				out.println(jsonString);
				out.flush();
				out.close();
			}

			jsonString = "上传文件成功！";
		}
		out.println(jsonString);
		out.flush();
		out.close();
		return null;
	}

	/**
	 * 文件下载
	 * 
	 * @return
	 * @throws Exception
	 */
	private InputStream in;

	public InputStream getDownloadFile() throws Exception {

		return in;
	}

	public String execute() throws Exception {
		in = fileService.fileDownLoad(netFileID);
		if (in == null) {
			return ERROR;
		}
		return SUCCESS;
	}

	 /*  回收站文件下载*/
		public String adminLoadFile()throws Exception
		{
			in = fileService.adminFileDownLoad(netFileID);
			if (in == null) {
				return ERROR;
			}
			return SUCCESS;
		}

	/* 文件名称乱码 */
	public String getFileName() throws Exception {
		return new String(fileFileName.getBytes("GBK"), "Iso8859-1");
	}
}
