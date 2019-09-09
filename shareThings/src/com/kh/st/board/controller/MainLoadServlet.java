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
import com.kh.st.notice.model.service.NoticeService;
import com.kh.st.notice.model.vo.Notice;

/**
 * Servlet implementation class MainLoadServlet
 */
@WebServlet("/mainLoad.bo")
public class MainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String verif = request.getParameter("verif");
		HashMap<String, Object> ctgTop5map = new BoardService().getTop5List(); 
		ArrayList<Notice> notice5List = new NoticeService().getNotice5List();
		String page = "";
		if(!ctgTop5map.isEmpty() && !notice5List.isEmpty()) {
			page = "views/main/main.jsp";
			request.setAttribute("ctgTop5map", ctgTop5map);
			request.setAttribute("notice5List", notice5List);
			if(verif != null) {
				request.setAttribute("verif", "success");
			}
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메인페이지 로드 실패..!");
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
