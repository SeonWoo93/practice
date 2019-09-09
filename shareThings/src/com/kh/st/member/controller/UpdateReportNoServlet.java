package com.kh.st.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;

@WebServlet("/reportNo.me")
public class UpdateReportNoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateReportNoServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nums = request.getParameter("nums");
		String[] num = nums.split(" ");
		for(int i = 0; i < num.length; i++) {
			System.out.println(num[i]);
		}
		
		String inputReject = request.getParameter("inputReject");
		System.out.println(inputReject);
		
		int result = new MemberService().updateReportNo(num,inputReject);
		
		if(result > 0) {
			response.sendRedirect("/st/selectReportList.me");
		}else {
			request.setAttribute("msg", "신고 부적합처리 실패!!");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



















