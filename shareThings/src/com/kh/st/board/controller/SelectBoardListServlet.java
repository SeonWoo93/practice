package com.kh.st.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.board.model.service.BoardService;

/**
 * Servlet implementation class SelectBoardListServlet
 */
@WebServlet("/selectList.bo")
public class SelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ctgLv2 = request.getParameter("ctgLv2");
		
		HashMap<String, Object> listMap = new BoardService().selectList(ctgLv2);
		String page = "";
		if(!listMap.isEmpty()) {
			page = "views/main/productList.jsp";
			request.setAttribute("listMap", listMap);
			request.setAttribute("ctgLv2", ctgLv2);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 리스트 페이지 불러오기 실패..");
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
