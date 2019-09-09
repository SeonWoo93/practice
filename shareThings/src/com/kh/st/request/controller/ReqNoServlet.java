package com.kh.st.request.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.request.model.service.ReqService;

/**
 * Servlet implementation class ReqNoServlet
 */
@WebServlet("/reqNo.bo")
public class ReqNoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqNoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String textResult = request.getParameter("textResult");
		String nums = request.getParameter("nums");
		String[] num = nums.split(",");
		
		for(int i = 0; i < num.length; i++) {
			System.out.println(num[i]);
		}

		System.out.println(textResult);
		int result = new ReqService().reqNo(num, textResult);
		
		String page = "";
		if(result > 0) {
			System.out.println("성공");
			response.sendRedirect(request.getContextPath() + "/reqProduct.bo");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "거절 오류");
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
