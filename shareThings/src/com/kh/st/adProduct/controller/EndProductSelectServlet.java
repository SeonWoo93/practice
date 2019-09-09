package com.kh.st.adProduct.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.adProduct.model.service.AdProductService;
import com.kh.st.adProduct.model.vo.EndProduct;

/**
 * Servlet implementation class EndProductSelectServlet
 */
@WebServlet("/endProductSelect.bo")
public class EndProductSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndProductSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		EndProduct ep = new AdProductService().endProductSelect(num);
		
		String page = "";
		if(ep != null) {
			new Gson().toJson(ep, response.getWriter());
		} else {
			page = "views/common/errorPage.jsp";
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
