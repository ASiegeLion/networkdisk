package com.july.networkdisk.web;

import java.io.PrintWriter;
import java.security.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.july.networkdisk.service.ISharefileService;
import com.july.networkdisk.util.CommonUtil;
import com.july.networkdisk.vo.Categorie;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.Share;
import com.july.networkdisk.vo.Sharefile;
import com.july.networkdisk.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SharefileAction extends ActionSupport implements ModelDriven<Sharefile>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Sharefile sharefile = new Sharefile();
	private ISharefileService iSharefileService;
	private User user;
	private String name;
	private String passWord;
	private String uid;
	private Map<String, Object> map;  //用来接收查询的数据和返回到前台
	private Categorie categorie;
	private Share share;
	private String fidlist;
	private String fnamelist;
	private String cateid;
	private String catename;
	private String uuid;
	private String url;
	private String pretime;
	private String sharepwd;
	private List<Categorie> catelist;
	private List<NetFile> filelist;
	HttpSession session = CommonUtil.createSession();
	HttpServletResponse response=ServletActionContext.getResponse();
	    
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Sharefile getSharefile() {
		return sharefile;
	}

	public void setSharefile(Sharefile sharefile) {
		this.sharefile = sharefile;
	}
	
	public ISharefileService getiSharefileService() {
		return iSharefileService;
	}

	public void setiSharefileService(ISharefileService iSharefileService) {
		this.iSharefileService = iSharefileService;
	}

	public Sharefile getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Share getShare() {
		return share;
	}

	public void setShare(Share share) {
		this.share = share;
	}
	
	public String getFidlist() {
		return fidlist;
	}

	public void setFidlist(String fidlist) {
		this.fidlist = fidlist;
	}
	
	public String getFnamelist() {
		return fnamelist;
	}

	public void setFnamelist(String fnamelist) {
		this.fnamelist = fnamelist;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getCateid() {
		return cateid;
	}

	public void setCateid(String cateid) {
		this.cateid = cateid;
	}

	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}
	
	public String getPretime() {
		return pretime;
	}

	public void setPretime(String pretime) {
		this.pretime = pretime;
	}

	public String getSharepwd() {
		return sharepwd;
	}

	public void setSharepwd(String sharepwd) {
		this.sharepwd = sharepwd;
	}
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Categorie> getCatelist() {
		return catelist;
	}

	public void setCatelist(List<Categorie> catelist) {
		this.catelist = catelist;
	}

	public List<NetFile> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<NetFile> filelist) {
		this.filelist = filelist;
	}

	/*分享*/
	public String share() throws Exception{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		uuid = uuid.substring(uuid.length()-36);
		String[] fid = fidlist.split(",");
		String[] cid = cateid.split(",");
		sharefile.setMagid(uuid);
		User u = CommonUtil.getSessionUser();
		Share share = new Share();
		share.setId(CommonUtil.createUUID());
		share.setUid(u.getId());
		share.setMagid(sharefile.getMagid());
		int time = 0;
		if(pretime.equals("7天")){
			time = 7;
		}else if(pretime.equals("1天")){
			time=1;
		}
		System.out.println(sharepwd);
		share.setPwd(sharepwd);
		share.setRetain(time);
		if(fid[0].length() == 0){
			if(cid[0].length() == 0){
				out.print("0");
				
			}else{
				sharefile.setIscate(1);
				this.iSharefileService.sharefile(sharefile,cid);
				
			}
		}else{
			if(cid[0].length() == 0){
				sharefile.setIscate(0);
				this.iSharefileService.sharefile(sharefile,fid);
				
			}else{
				sharefile.setIscate(1);
				this.iSharefileService.sharefile(sharefile,cid);
				
				sharefile.setIscate(0);
				this.iSharefileService.sharefile(sharefile,fid);
				
			}
		}
		this.iSharefileService.addshare(share);
		out.print("1");
		out.flush();
		out.close();
		return null;
	}
	
	/*分享链接跳转*/
	public String shareurl(){
		try {
			map = new HashMap<String, Object>();
			catelist = new ArrayList<Categorie>();
			filelist = new ArrayList<NetFile>();
			sharefile.setMagid(url);
			share = this.iSharefileService.getsharebyid(url);
			user = this.iSharefileService.getuserbyid(share.getUid());
			long t = System.currentTimeMillis();
			List<Sharefile> sflist = this.iSharefileService.sharecent(sharefile);
			
			session.setAttribute("url", share.getMagid());
			
			if(share.getRetain() == 0){
				if(!share.getPwd().equals("")){
					return "havepwd";
				}else{
					for(int i=0;i<sflist.size();i++){
						if(sflist.get(i).getIscate() == 1){
							Categorie cate = this.iSharefileService.getcate(sflist.get(i).getFileandcateid());
							if(cate != null){
								catelist.add(cate);
							}
						}else{
							NetFile file = this.iSharefileService.getfile(sflist.get(i).getFileandcateid());
							if(file != null){
								filelist.add(file);
							}
						}
					}
				}
			}else if(share.getStartTime().getTime()+share.getRetain()*24*3600*1000<t){
				return ERROR;
			}else{
				if(!share.getPwd().equals("")){
					return "havepwd";
				}else{
					for(int i=0;i<sflist.size();i++){
						if(sflist.get(i).getIscate() == 1){
							Categorie cate = this.iSharefileService.getcate(sflist.get(i).getFileandcateid());
							if(cate != null){
								catelist.add(cate);
							}
						}else{
							NetFile file = this.iSharefileService.getfile(sflist.get(i).getFileandcateid());
							if(file != null){
								filelist.add(file);
							}
						}
					}
					
				}
			}
			if(filelist.size() == 0 && catelist.size() == 0){
				return ERROR;
			}
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
		
	}
	/*密码提取*/
	public String pwdextract() throws Exception{
		if(sharepwd == null){
			return "false";
		}
		map = new HashMap<String, Object>();
		share = this.iSharefileService.getsharebyid(url);
		user = this.iSharefileService.getuserbyid(share.getUid());
		this.sharefile.setMagid(url);
		catelist = new ArrayList<Categorie>();
		filelist = new ArrayList<NetFile>();
		List<Sharefile> sflist = this.iSharefileService.sharecent(sharefile);
		if(!share.getPwd().equals(sharepwd)){
			return ERROR;
		}else{
			for(int i=0;i<sflist.size();i++){
				if(sflist.get(i).getIscate() == 1){
					Categorie cate = this.iSharefileService.getcate(sflist.get(i).getFileandcateid());
					if(cate != null){
						catelist.add(cate);
					}
				}else{
					NetFile file = this.iSharefileService.getfile(sflist.get(i).getFileandcateid());
					if(file != null){
						filelist.add(file);
					}
				}
			}
		}
		if(filelist.size() == 0 && catelist.size() == 0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	/*分享文件夹下一层*/
	public String showcatenext() throws Exception{
		map = new HashMap<String, Object>();
		List<Categorie> catelist = this.iSharefileService.getcatenext(cateid);
		List<NetFile> filelist = this.iSharefileService.getcatenextfile(cateid);
		map.put("catelist", catelist);
		map.put("filelist", filelist);
		return "json";
	}
	
	/*保存分享的文件和文件夹*/
	public String preservation() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int fileflag = 1,cateflag = 1;
		String[] fid = fidlist.split(",");
		String[] fname = fnamelist.split(",");
		String[] cidlist = cateid.split(",");
		String[] cnamelist = catename.split(",");
		if(uuid.equals("null")){
			uuid = null;
		}
		if(fid[0].length() == 0){
			if(cidlist[0].length() == 0){
				return null;
			}else{
				cateflag = this.iSharefileService.checkcate(cidlist,cnamelist,cateflag,uid,uuid);
				if(cateflag == 1){
					this.iSharefileService.preservationcate(uid, cidlist, uuid);
					out.print(1);
				}else{
					out.print(0);
				}
			}
		}else{
			if(cidlist[0].length() == 0){
				fileflag = this.iSharefileService.checkfile(fid,fname,fileflag,uid,uuid);
				if(fileflag == 1){
					this.iSharefileService.preservation(uid,fid, uuid);
					out.print(1);
				}else{
					out.print(0);
				}
			}else{
				fileflag = this.iSharefileService.checkfile(fid,fname,fileflag,uid,uuid);
				if(fileflag == 0){
					out.print(0);
					return null;
				}
				cateflag = this.iSharefileService.checkcate(cidlist,cnamelist,cateflag,uid,uuid);
				if(cateflag == 0){
					out.print(0);
					return null;
				}
				
				this.iSharefileService.preservation(uid,fid,uuid);
				this.iSharefileService.preservationcate(uid, cidlist, uuid);
				out.print(1);
			}
		}
		out.flush();
		out.close();
		return null;
	}
	
	 /*分享页面登陆*/
		public String sharelogin() throws Exception{
			map = new HashMap<String, Object>();
			String password = CommonUtil.getMD5(passWord);
	    	User u = new User();
	    	u.setName(name);
	    	u.setPassWord(password);
	    	User user = this.iSharefileService.findOne(u);
	    	
	    	if(user == null){
	    		return ERROR;
	    	}else{
	    		session.setAttribute("user", user);
	    	}
	    	map.put("user", user);
			return "json";
		}
	
}
