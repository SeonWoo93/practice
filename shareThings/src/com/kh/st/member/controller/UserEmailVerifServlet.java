package com.kh.st.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Member;

/**
 * Servlet implementation class MemberEmailCheckServlet
 */
@WebServlet("/emailVerif.me")
public class UserEmailVerifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEmailVerifServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		Member updateUser = new MemberService().setEmailChecked(loginUser);
		String page = "";
		if(updateUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateUser);
			response.sendRedirect("mainLoad.bo?verif=success");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "인증결과 전송에 실패했습니다..!");
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
