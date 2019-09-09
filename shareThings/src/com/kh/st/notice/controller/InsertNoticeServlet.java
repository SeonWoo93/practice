package com.kh.st.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.notice.model.service.NoticeService;
import com.kh.st.notice.model.vo.Notice;

/**
 * Servlet implementation class InsertNotice
 */
@WebServlet("/insert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String uno = request.getParameter("uno");
		String content = request.getParameter("content");
		
		Notice reqNotice = new Notice();
		
		System.out.println(title);
		System.out.println(uno);
		System.out.println(content);
		
		reqNotice.setnTitle(title);
		reqNotice.setnWriter(uno);
		reqNotice.setnContent(content);
		
		int result = new NoticeService().insertNotice(reqNotice);
		
		String page = "";
		  if(result > 0) {
			  response.sendRedirect("/st/selectAdminList.no");
		  }else {
			  page = "views/common/errorPage.jsp";
			  request.setAttribute("msg", "공지사항 등록 실패!");
			  request.getRequestDispatcher(page).forward(request, response);
			  
		  }
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
