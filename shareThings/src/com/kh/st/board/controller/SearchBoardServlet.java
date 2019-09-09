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
 * Servlet implementation class SearchBoardServlet
 */
@WebServlet("/search.bo")
public class SearchBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String input = request.getParameter("input");
		
		ArrayList<HashMap<String, Object>> bList = new BoardService().searchBoard(input);
		String page = "";
		if(!bList.isEmpty()) {
			page = "views/main/searchResult.jsp";
			request.setAttribute("bList", bList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "검색 결과가 존재하지 않습니다.");
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
