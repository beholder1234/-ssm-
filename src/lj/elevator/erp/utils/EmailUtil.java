package lj.elevator.erp.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * 
 * 邮件发送 QQ邮箱---> 别的邮箱
 */
public class EmailUtil extends Thread {
	private String mailAdr;// 邮箱
	private String content;// 邮件的内容
	private String subject;// 邮件的题目

	public EmailUtil(String mailAdr, String subject, String content) {
		super();
		this.mailAdr = mailAdr;
		this.subject = subject;
		this.content = content;
	}

	public EmailUtil(String mailAdr) {
		super();
		this.mailAdr = mailAdr;

	}

	public void run() {
		super.run();
		try {
			sendMail(mailAdr, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void sendMail(String mailAdr, String subject, String content) throws Exception {
		// 加密的邮件套接字协议工厂
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		final Properties props = new Properties();
		// 表示SMTP发送邮件，需要进行身份验证
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.qq.com");
		// smtp登陆的账号、密码 ；需开启smtp登陆
		props.setProperty("mail.debug", "true");
		props.put("mail.user", "906336773@qq.com");
		props.put("mail.password", "lemahlwfixfubbei");
		// 特别需要注意，要将ssl协议设置为true,否则会报530错误
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);
		Authenticator authenticator = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				// 用户名、密码
				String userName = props.getProperty("mail.user");
				String password = props.getProperty("mail.password");
				return new PasswordAuthentication(userName, password);
			}
		};
		// 使用环境属性和授权信息，创建邮件会话
		Session mailSession = Session.getInstance(props, authenticator);
		// 创建邮件消息
		MimeMessage message = new MimeMessage(mailSession);
		// 设置发件人
		try {
			InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
			message.setFrom(form);
			// 设置收件人
			InternetAddress to = new InternetAddress(mailAdr);
			message.setRecipient(Message.RecipientType.TO, to);
			// 设置抄送
			// InternetAddress cc = new InternetAddress("591566764@qq.com");
			// message.setRecipient(RecipientType.CC, cc);
			// 设置密送，其他的收件人不能看到密送的邮件地址
			// InternetAddress bcc = new InternetAddress("mashen@163.com");
			// message.setRecipient(RecipientType.CC, bcc);
			// 设置邮件标题
			message.setSubject(subject);
			// 设置邮件的内容体
			message.setContent(content, "text/html;charset=UTF-8");
			// 发送邮件
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	/*
	 * public static void main(String[] args) { EmailUtil d = new
	 * EmailUtil("1400310420@qq.com", "syp：", "我呵呵，啊打： <br/><br/>加油哦！！！！....");
	 * d.start(); }
	 */

	public void resetPwdMail() {

		subject = "深圳市富士乐电梯公司：";
		content = "公司系统账号密码已成功重置.....";
		EmailUtil eUtil = new EmailUtil(mailAdr, subject, content);

		// 该方法由Tread继承而来
		eUtil.start();
	}

}
