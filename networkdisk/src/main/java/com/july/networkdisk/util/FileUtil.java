package com.july.networkdisk.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.User;

public class FileUtil {
	/**
	 * 把上传的文件和用户包装到netFile,
	 * 
	 * @param file
	 * @param fileName
	 * @param fileContentType
	 * @param netFile
	 * @return
	 */
	public static NetFile layFile(File file, String fileName,
			String fileContentType, User user, NetFile netFile)
			throws Exception {
		netFile.setId(CommonUtil.createUUID());
		netFile.setUid(user.getId());
		netFile.setName(fileName); // 截取文件名

		String str = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (str == null) {
			netFile.setType((fileContentType.split("/"))[0]); // 截取文件类型
		}
		netFile.setType(str);
		netFile.setSize(file.length());

		// linux 为/home/julyteam    windows 为 D：
		String folderpath = "D:" + File.separatorChar + "networkdiskFile"
				+ File.separatorChar + user.getId();
		File newFile = new File(folderpath);// 构造一个存储路径 D：\networkdiskFile\用户id

		if (!newFile.exists()) {
			newFile.mkdirs();
		}

		String turePath = folderpath + File.separatorChar + netFile.getId()
				+ "." + netFile.getType(); // 真实的文件存储路径

		write(file.getPath(), turePath);

		netFile.setPath(turePath);
		netFile.setDownum(0);
		netFile.setDeletesign(0);

		/**
		 * 如果上传的是视频，就进行转码 wmv9，rm，rmvb，asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等
		 */
		    if(    netFile.getType().equals("wmv9") 
				|| netFile.getType().equals("rm")
				|| netFile.getType().equals("rmvb")
				|| netFile.getType().equals("asx")
				|| netFile.getType().equals("asf")
				|| netFile.getType().equals("mpg")
				|| netFile.getType().equals("wmv")
				|| netFile.getType().equals("3gp")
				|| netFile.getType().equals("mp4")
				|| netFile.getType().equals("mov")
				|| netFile.getType().equals("avi")
				|| netFile.getType().equals("flv"))
		{
			ConvertVideo convertVideo = new ConvertVideo(turePath);
			convertVideo.start();//开启另外一个线程，进行视频转码；
		}
		
		/**
		 * 开启线程备份到hadoop上
		 */
		/*FileBak fileBak = new FileBak(turePath);
		new Thread(fileBak).start();*/
		
		return netFile;
	}

	/**
	 * 文件下载
	 */
	public static InputStream downFile(String file_path) throws Exception {
		File file = new File(file_path);
		if (!file.exists()) {
			/**
			 * 本地不存在则从备份处下载
			 */
			FileBak fileBak = new FileBak(file_path);
			fileBak.download();
			return null;
		}
		InputStream inputStream = new FileInputStream(file);
		return inputStream;
	}

	/**
	 * 删除文件
	 * 
	 * @param file_path
	 * @return
	 * @throws Exception
	 */
	public static void deleteFile(String file_path) throws Exception {
		File newFile = new File(file_path);
		if (newFile.exists()) {
			newFile.delete();
		}
	}

	/**
	 * 写入文件
	 * 
	 * @param inputFile
	 * @param targetFile
	 */
	public static void write(String inputFile, String targetFile) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = new FileInputStream(inputFile);
			outputStream = new FileOutputStream(targetFile);
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = inputStream.read(buf)) > 0) {
				outputStream.write(buf, 0, length);
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
	}
}
