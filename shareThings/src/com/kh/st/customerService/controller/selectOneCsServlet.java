package com.kh.st.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.customerService.model.service.CsService;
import com.kh.st.customerService.model.vo.Cs;

/**
 * Servlet implementation class selectOneCsServlet
 */
@WebServlet("/selectOne.cs")
public class selectOneCsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectOneCsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Cs c = new CsService().selectOne(num);
		
		String page="";
		if(c != null) {
			page = "views/customerService/myCs2.jsp";
			request.setAttribute("c", c);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패");
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
