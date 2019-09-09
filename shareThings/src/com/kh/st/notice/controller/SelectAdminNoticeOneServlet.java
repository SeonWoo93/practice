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
 * Servlet implementation class SelectAdminNoticeOne
 */
@WebServlet("/selectAdminOne.no")
public class SelectAdminNoticeOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminNoticeOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		Notice repNotice = new NoticeService().selectAdminOne(nno);
		
		String page = "";
		if(repNotice != null) {
			page = "views/admin/notice/noticeDetail.jsp";
			request.setAttribute("repNotice", repNotice);
		}else {
			page = "views/common/erroePage.jsp";
			request.setAttribute("msg", "공지사항 상세보기 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
