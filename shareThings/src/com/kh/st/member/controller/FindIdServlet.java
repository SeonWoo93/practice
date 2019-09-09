package com.kh.st.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.common.EmailVerification;
import com.kh.st.common.Gmail;
import com.kh.st.common.SendSMS;
import com.kh.st.member.model.service.MemberService;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		String userName = request.getParameter("userName");
		String userId = "";
		if(type.equals("phone")) {
			String phone = request.getParameter("phone");
			int code = Integer.parseInt(request.getParameter("code"));
			userId = new MemberService().findIdwithPhone(userName, phone);
			if(!userId.equals("")) {
				new SendSMS().sendCode(phone, code);
				response.getWriter().print(userId);
			}else {
				response.getWriter().print("fail");
			}
		}else if(type.equals("email")){
			String email = request.getParameter("email");
			int code = Integer.parseInt(request.getParameter("code"));
			userId = new MemberService().findIdwithEmail(userName, email);
			if(!userId.equals("")) {
				String host = "http://127.0.0.1:8888/st";
				String from = "sharethings1224@gmail.com";
				String to = email;
				String subject = "쉐어띵스 인증 메일입니다.";
				String content = "인증번호 " + code;
				
				Properties p = new Properties();
				p.put("mail.smtp.user", from);
				p.put("mail.smtp.host", "smtp.gmail.com");
				p.put("mail.smtp.port", "465");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.port", "465");
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				
				
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				try {
					msg.setSubject(subject);
					Address fromAddr = new InternetAddress(from);
					msg.setFrom(fromAddr);
					Address toAddr = new InternetAddress(to);
					msg.addRecipient(Message.RecipientType.TO, toAddr);
					msg.setContent(content, "text/html; charset=UTF-8");
					Transport.send(msg);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
				response.getWriter().print(userId);
			}else {
				response.getWriter().print("fail");
			}
		}
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
