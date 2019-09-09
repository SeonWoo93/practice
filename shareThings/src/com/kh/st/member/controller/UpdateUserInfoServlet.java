package com.kh.st.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Member;

@WebServlet("/updateUser.me")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateUserInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUno();
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("Pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String phone2 = request.getParameter("phone2");
		
		loginUser.setUserName(userName);
		loginUser.setEmail(email);
		loginUser.setPhone(phone);
		loginUser.setSubPhone(phone2);
		
		int result = new MemberService().updateUserInfo(loginUser);
		
		if(result > 0) {
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('회원 정보가 수정 되었습니다!'); return false;");

			out.println("history.back();");

			out.println("</script>");
			
			response.sendRedirect("/st/views/mypage/mypgUser.jsp");

		}else {
			
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");

			out.println("alert('회원 정보가 수정 실패 되었습니다!');");

			out.println("history.back();");

			out.println("</script>");
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
