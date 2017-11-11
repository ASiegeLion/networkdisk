package com.july.networkdisk.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailUtil {
	public static String createRandomVcode() {
		// 验证码
		String vcode = "";
		for (int i = 0; i < 6; i++) {
			vcode = vcode + (int) (Math.random() * 9);
		}
		return vcode;
	}

	public static MimeMessage createSimpleMail(Session session, String email,
			String code) throws Exception {
		// 创建邮件对象
		MimeMessage mm = new MimeMessage(session);
		// 设置发件人
		mm.setFrom(new InternetAddress("945076608@qq.com"));
		// 设置收件人
		mm.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		// 设置抄送人
		//mm.setRecipient(Message.RecipientType.CC, new InternetAddress("18874488896@163.com"));

		String MailBody = "<p><img alt=\"westlakelogo\" src=\"http://mt1.baidu.com/timg?shitu&quality=100&sharpen=100&er=&imgtype=0&wh_rate=null&size=h120&sec=1506158359&di=b069c1b6064030bf6262630f97677234&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2F%2570%2569%2563%2Fitem%2F279759ee3d6d55fbdbdb823a66224f4a20a4dd89.jpg\" border=\"0\" /></p>"
				+ "<p> 尊敬的用户,您好！<br />"
				+ "这封信是由 july云盘 发送的。您收到这封邮件，是由于在 july云盘 获取了新用户注册地址使用 了这个邮箱地址。如果您并没有访问过 july云盘，或没有进行上述操作，请忽 略这封邮件。您不需要退订或进行其他进一步的操作。"
				+ "<br />"
				+ "<p>您的验证码为   <span style='color:red;font-size:30px'> "
				+ code
				+ "</span>，有效期为180秒</p>"
				+ " <p>感谢您的访问，祝您使用愉快！如有疑虑请详询18552329592（客服电话）【july云盘】</p>";

		mm.setSubject("july云盘官方邮件");
		mm.setContent(MailBody, "text/html;charset=gbk");

		return mm;

	}

	public static void sendEmail(String email, String code) throws Exception {
		Properties prop = new Properties();
		prop.put("mail.host", "smtp.qq.com");
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.port", "587");
		// 使用java发送邮件5步骤
		// 1.创建sesssion
		Session session = Session.getInstance(prop);
		// 开启session的调试模式，可以查看当前邮件发送状态
		session.setDebug(true);

		// 2.通过session获取Transport对象（发送邮件的核心API）
		Transport ts = session.getTransport();
		// 3.通过邮件用户名密码链接
		ts.connect("945076608@qq.com", "uxfwhrrwwjvjbdhj");

		// 4.创建邮件

		Message msg = createSimpleMail(session, email, code);

		// 5.发送电子邮件

		ts.sendMessage(msg, msg.getAllRecipients());

	}

	public static void main(String[] args) throws Exception {
		SendEmailUtil.sendEmail("1370058053@qq.com",
				SendEmailUtil.createRandomVcode());

	}
}
