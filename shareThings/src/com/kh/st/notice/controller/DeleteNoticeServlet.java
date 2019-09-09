package com.kh.st.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteNotice
 */
@WebServlet("/delete.no")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nnos = request.getParameter("nnos");
		String[] nno = nnos.split(",");
		
		int result = new NoticeService().deleteNotice(nno);
		
		String page ="";
		if(result > 0) {
			response.sendRedirect("/st/selectAdminList.no");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 삭제 에러");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
