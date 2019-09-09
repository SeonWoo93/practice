package com.kh.st.checkHistory.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.checkHistory.modal.service.CheckHistoryService;
import com.kh.st.checkHistory.modal.vo.CheckHistory;
import com.kh.st.common.PageInfo;

/**
 * Servlet implementation class CheckHistoryAdProductServlet
 */
@WebServlet("/checkHistoryAdProduct.bo")
public class CheckHistoryAdProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckHistoryAdProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new CheckHistoryService().getListCount();
		System.out.println("검수 처리 갯수 : " + listCount);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage =(((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<CheckHistory> list = new CheckHistoryService().checkHistoryList(pi);
		
		String page = "";
		if(list != null) {
			System.out.println(list);
			page = "views/admin/product/check.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("listCount", listCount);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "등록 물품 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
