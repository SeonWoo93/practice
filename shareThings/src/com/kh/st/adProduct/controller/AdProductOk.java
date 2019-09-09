package com.kh.st.adProduct.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.adProduct.model.service.AdProductService;

/**
 * Servlet implementation class AdProductOk
 */
@WebServlet("/adProductOk.bo")
public class AdProductOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdProductOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String confirmNum = request.getParameter("confirmNum");
		String[] num = confirmNum.split(",");
		
		for(int i = 0; i < num.length; i++) {
			System.out.println(num[i]);
		}
		
		int result = new AdProductService().adProductOk(num);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/reqOkProduct.bo");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "물품 등록 실패");
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
