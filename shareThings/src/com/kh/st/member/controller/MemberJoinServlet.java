package com.kh.st.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import javax.servlet.http.HttpSession;

import com.kh.st.common.EmailVerification;
import com.kh.st.common.Gmail;
import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/join.me")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		int birthYear = Integer.parseInt(request.getParameter("birthYear"));
		int birthMonth = Integer.parseInt(request.getParameter("birthMonth"));
		int birthDay = Integer.parseInt(request.getParameter("birthDay"));
		Calendar cbirth = new GregorianCalendar(birthYear, birthMonth, birthDay);
		Date birthDate = new Date(cbirth.getTimeInMillis());
		String phone0 = request.getParameter("phone0");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = "(" + phone0 + ")" + phone1 + phone2 + phone3;
		String email = request.getParameter("email");
		String zipCode = request.getParameter("zipCode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = zipCode + "|" + address1 + "|" + address2;
		String subPhone0 = request.getParameter("subPhone0");
		String subPhone1 = request.getParameter("subPhone1");
		String subPhone2 = request.getParameter("subPhone2");
		String subPhone3 = request.getParameter("subPhone3");
		String subPhone;
		if(subPhone1.equals("") || subPhone2.equals("") || subPhone3.equals("")) {
			subPhone = null;
		}else {
			subPhone = "(" + subPhone0 + ")" + subPhone1 + subPhone2 + subPhone3;
		}
		String[] tnc = request.getParameterValues("TnC");
		String optionCheck = "N";
		for(int i = 0; i < tnc.length; i++) {
			if(tnc[i].equals("check3")) {
				optionCheck = "Y";
			}
		}
		
		Member newMember = new Member();
		newMember.setUserId(userId);
		newMember.setUserPwd(userPwd);
		newMember.setUserName(userName);
		newMember.setGender(gender);
		newMember.setBirthDate(birthDate);
		newMember.setPhone(phone);
		newMember.setEmail(email);
		newMember.setAddress(address);
		newMember.setSubPhone(subPhone);
		newMember.setOptionCheck(optionCheck);
		System.out.println(newMember);
		
		int result = new MemberService().insertMember(newMember);
		String page = "";
		if(result > 0) {
			
			String host = "http://127.0.0.1:8888/st";
			String from = "sharethings1224@gmail.com";
			String to = newMember.getEmail();
			String subject = "쉐어띵스 인증 메일입니다.";
			String content = "아래 링크에 접속하여 이메일 인증을 진행해주세요." + "<br><a href='" + host + "/views/member/emailVerif.jsp?code="
					+ new EmailVerification().getSHA256(to) + "'>이메일 인증하기</a>";
			
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
			
			response.sendRedirect("views/member/loginPage.jsp?login=first");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "죄송합니다.. 회원가입에 실패했습니다!");
			request.getRequestDispatcher(page).forward(request, response);
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
