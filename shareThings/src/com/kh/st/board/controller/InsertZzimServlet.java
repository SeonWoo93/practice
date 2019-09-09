package com.kh.st.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.board.model.service.BoardService;

/**
 * Servlet implementation class InsertZzimServlet
 */
@WebServlet("/insert.zz")
public class InsertZzimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertZzimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uno = Integer.parseInt(request.getParameter("uno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new BoardService().insertZzim(uno, pno);
		if(result == -1) {
			response.getWriter().print("already exist");
		}else if(result > 0) {
			int zzimCnt = new BoardService().getZzimCnt(pno);
			response.getWriter().print(zzimCnt);
		}else {
			response.getWriter().print("insert fail");
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
