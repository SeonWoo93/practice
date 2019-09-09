package com.kh.st.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.notice.model.service.NoticeService;
import com.kh.st.notice.model.vo.Notice;

/**
 * Servlet implementation class SelectNoticeList
 */
@WebServlet("/selectAdminList.no")
public class SelectAdminNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectAdminNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> list = new NoticeService().selectAdminNoticeList();
		
		System.out.println(list);
		
		String page = "";
		
		if(list != null) {
			page = "views/admin/notice/noticeList.jsp";
			request.setAttribute("list", list);
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
