package com.kh.st.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.checkHistory.modal.service.CheckHistoryService;
import com.kh.st.checkHistory.modal.vo.CheckStandard;

/**
 * Servlet implementation class CheckStandardServlet
 */
@WebServlet("/checkStandard.bo")
public class CheckStandardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckStandardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String result = request.getParameter("result");
		System.out.println(result);
		
		ArrayList<CheckStandard> list = new CheckHistoryService().checkStandard(result);
		
		String page = "";
		if(list != null) {
			new Gson().toJson(list, response.getWriter());			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "검수 기준 조회 실패");
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
