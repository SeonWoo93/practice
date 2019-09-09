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
 * Servlet implementation class SelectAdminNoticeServlet
 */
@WebServlet("/selectAdminNotice.no")
public class SelectAdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectAdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(Integer.parseInt(request.getParameter("nno")));
		int nno = Integer.parseInt(request.getParameter("nno"));
		Notice reqNotice = new NoticeService().selectAdminOne(nno);
		
		String page = "";
		
		if(reqNotice != null) {
			page = "views/admin/notice/noticeUpdate.jsp";
			request.setAttribute("reqNotice", reqNotice);
		}else {
			page = "views/common/erroePage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세보기 실패!");
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
