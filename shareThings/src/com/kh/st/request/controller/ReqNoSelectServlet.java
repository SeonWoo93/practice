package com.kh.st.request.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.request.model.service.ReqService;
import com.kh.st.request.model.vo.ReqProduct;

/**
 * Servlet implementation class ReqNoSelectServlet
 */
@WebServlet("/reqNoSelect.bo")
public class ReqNoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqNoSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String statuses = request.getParameter("status");
		String[] status = statuses.split(",");
		
		
		for(int i = 0; i < status.length; i++) {
			System.out.println(status[i]);
		}
		String page = "";
		if(statuses.equals("")) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "거절 물품을 선택하세요");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		ArrayList<ReqProduct> list = new ReqService().reqNoSelect(status);
		
		
		if(list != null) {
			new Gson().toJson(list, response.getWriter());
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
