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
 * Servlet implementation class UpdateNotice
 */
@WebServlet("/update.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateNoticeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		int nNo = Integer.parseInt(request.getParameter("nno"));
		String content = request.getParameter("content");

		Notice reqNotice = new Notice();

		reqNotice.setNno(nNo);
		reqNotice.setnTitle(title);
		reqNotice.setnContent(content);

		int result = new NoticeService().updateNotice(reqNotice);

		String page = "";
		if (result > 0) {
			response.sendRedirect("/st/selectAdminList.no");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정실패!");
			request.getRequestDispatcher(page).forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
