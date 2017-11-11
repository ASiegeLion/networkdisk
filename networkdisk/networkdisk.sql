
			文件夹（categorie）数据表
                          
字段		         类型			Null		默认		注释
cat_id 		varchar(50)		    否				   主键id
cat_name 	varchar(255)		否				  分类名称
cat_reid 	varchar(255)		是				  上级分类id
cat_uid		varchar(50)         否                 用户id,
cat_state   int(1)              否                 文件夹是否删除（1表示删除）
cat_addtime	timestamp			否					文件创建时间

			好友（friend）数据表
                         
字段		类型			Null	默认	       注释
fri_id 		int(15)			否		主键（自增）
fri_uid 	varchar(50)		否		用户id（外键）
fri_fid 	varchar(50)		是		好友id（外键）
addtime 	timestamp 		否		添加时间
fri_static   int(1)         否      好友状态


			消息公告（notice）
                        
字段			      类型			   Null		默认		注释
not_id 			int(10)			    否				主键id
not_title 		varchar(255)		否				新闻公告名称
not_content 		text			否				新闻公告内容
not_time 		timestamp		    否				发布时间
   

			分享（share）数据表
                        
字段			类型				    Null		默认		    注释
sh_id 		varchar(50)		    否				        主键
sh_uid		varchar(50)		    否				    分享人id(外键)
sh_magid 	varchar(255)		否				    分享文件标识id
sh_pwd		varchar(255)		是				      分享密码
sh_startTime	timestamp 		是				       分享时间
sh_retain	int(2)			    是		-1（代表永久）  保留时长	


			分享文件（sharefile）数据表
字段			类型				    Null		默认		    注释
sf_id		varchar(50)			否						主键
sf_magid	varchar(50)			否						分享文件标识id
sf_fileandcateid	varchar(50) 是						文件和文件夹id
sf_iscate	int(1) 				是						是否为文件夹


			文件（file）数据表
                            
字段			        类型			    Null	默认	          注释
file_id 		varchar(50)			否		           主键（自增）
file_name 		varchar(255)		否		            文件名称
file_uid 		varchar(50)		    否		        上传用户id（外键）
file_catid		varchar(50)		    是	          	所属文件夹id(外键)
file_path		varchar(255)		否		            文件路径
file_addtime 		timestamp 		否		            上传时间
file_type		varchar(20)		    否		            文件类型
file_size		int(11)			    否		            文件字节
file_downum		int(11)			    否	      0	        下载次数
file_deletesign		int(1)			否		           文件删除标志(1,表示在回收站)



			用户（user）数据表
                
字段				        类型			    Null		默认		  注释
user_id 			varchar(50)		     否				      主键
user_name 			varchar(255)		 否				     用户名
user_password			varchar(255)	 否				    登录密码
user_truename			varchar(255)	 否				    真实姓名
user_email 			varchar(255)		 否				     email
user_phone			varchar(20)	         否				   注册手机号
user_isadmin 			int(1)			 否		    0		是否管理员
user_sex			int(1)			     否		    0		性别
user_about 			varchar(255)		 是				    个人介绍
user_cTime 			timestamp 		     否				    注册时间
user_photo			mediumblob           是                  个人头像

---------------------------------------------------------------------------------------------------------------------------

#sql语句操作:

create database networkdisk charset utf8;
use networkdisk;

#创建用户表
create table user(
			user_id        varchar(50)  PRIMARY KEY,
			user_name      varchar(255) NOT NULL UNIQUE,
			user_password  varchar(255) NOT NULL,
			user_truename  varchar(255) NOT NULL,	
			user_email	   varchar(255) NOT NULL UNIQUE,
			user_phone     varchar(20)	NOT NULL UNIQUE,
			user_isadmin   int(1)       NOT NULL DEFAULT 1,
			user_sex       int(1)       NOT NULL DEFAULT 1,
			user_photo     mediumblob   NOT NULL,
			user_about     varchar(255) ,
			user_cTime	timestamp 	DEFAULT CURRENT_TIMESTAMP
);
#文件夹表
create table categorie
(
			cat_id varchar(50) not null,
			cat_name varchar(255) not null ,
			cat_reid varchar(50),
			cat_uid varchar(50)not null,
			cat_addtime timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			cat_state int(1) not null ,
			primary key(cat_id),
			foreign key(cat_reid) references categorie(cat_id),
			foreign key(cat_uid) references user(user_id)
);

#创建文件表
create table file(
			file_id		varchar(50) PRIMARY KEY,
			file_name	varchar(255) not null,
			file_uid	varchar(50) not null,
			file_catid	varchar(50) ,
			file_path	varchar(255) not null,
			file_addtime	timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			file_type	varchar(20) not null,
			file_size   int(20)  not null,
			file_downum	int(11)  not null DEFAULT 0,
			file_deletesign	int(1) not null,
			FOREIGN key (file_uid) REFERENCES user(user_id),
			FOREIGN key (file_catid) REFERENCES categorie(cat_id)
	
);



#好友表
create table friend
(
	fri_id int(15) not null auto_increment,
	fri_uid varchar(50) not null,
	fri_fid varchar(50) not null,
	fri_addtime timestamp not null default current_timestamp,
	fri_static int(1) not null,
	primary key(fri_id),
	foreign key(fri_uid) references user(user_id),
	foreign key(fri_fid) references user(user_id)
);

#消息公告
create table notice
(
	not_id int(10) not null auto_increment,
	not_title varchar(255) not null,
	not_content text not null,
	not_time timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key(not_id)
);

#分享表
create table share
(
	sh_id varchar(50) not null,
	sh_uid varchar(50) not null,
	sh_magid varchar(50) not null,
	sh_pwd varchar(255) not null,
	sh_starttime timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	sh_retaintime int(2) not null default -1,
	primary key(sh_id),
	foreign key(sh_uid) references user(user_id)

);


#分享文件表
create table sharefile
(
	sf_id varchar(50) not null,
	sf_magid varchar(50) not null,
	sf_fileandcateid varchar(50) null,
	sf_iscate int(1) null,
	primary key(sf_id)
	
);
#聊天表
create table message
(
	msg_id int(15) not null auto_increment,
	msg_userid varchar(50) not null,
	msg_friendid varchar(50) not null,
	msg_content varchar(255) not null,
	msg_sendtime timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	msg_static int(1) not null,
	primary key(msg_id),
	foreign key(msg_userid) references user(user_id),
	foreign key(msg_friendid) references user(user_id)
)
