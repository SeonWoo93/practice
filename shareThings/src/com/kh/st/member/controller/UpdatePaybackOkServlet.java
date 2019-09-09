package com.kh.st.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;


@WebServlet("/paybackOk.me")
public class UpdatePaybackOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdatePaybackOkServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		String[] nums = no.split(",");
		
		int result = new MemberService().updatePaybackOk(nums);
		for(int i = 0; i < nums.length; i++) {
			System.out.println(nums[i]);
		}
		
		if(result > 0) {
			response.sendRedirect("/st/selectPaybackList.me");
		}else {
			request.setAttribute("msg", "환급완료 처리 실패!!");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
