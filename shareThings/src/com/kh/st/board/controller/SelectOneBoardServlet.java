package com.kh.st.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.board.model.service.BoardService;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.bo")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		HashMap<String, Object> bDetailMap = new BoardService().selectOneBoard(bno);
		String page = "";
		if(!bDetailMap.isEmpty()) {
			page = "views/main/productDetail.jsp";
			request.setAttribute("bDetailMap", bDetailMap);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "물품 상세글 불러오기 실패..");
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
