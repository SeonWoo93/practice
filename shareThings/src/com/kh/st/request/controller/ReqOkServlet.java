package com.kh.st.request.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.request.model.service.ReqService;
import com.kh.st.request.model.vo.ReqProduct;

/**
 * Servlet implementation class ReqOkServlet
 */
@WebServlet("/reqOk.bo")
public class ReqOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqOkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String delivery = request.getParameter("delivery");
		String dNo = request.getParameter("dNo");
		
		System.out.println(num);
		System.out.println(delivery);
		System.out.println(dNo);
		
		int result = new ReqService().reqOk(num, delivery, dNo);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/reqProduct.bo");
			System.out.println("성공");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "승인 오류");
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
