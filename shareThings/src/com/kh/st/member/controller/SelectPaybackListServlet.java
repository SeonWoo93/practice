package com.kh.st.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.common.PageInfo;
import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Payback;


@WebServlet("/selectPaybackList.me")
public class SelectPaybackListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public SelectPaybackListServlet() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -----------------------------------------------  페이징 처리 (20개)  -----------------------------------------------
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 50;

		int listCount = new MemberService().getPaybackListCount();

		maxPage = (int)((double)listCount / limit + 0.98);

		startPage = (((int)((double)currentPage / limit + 0.98)) - 1) * 10 + 1;

		endPage = startPage + 10 - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);

		// -----------------------------------------------  페이징 처리 (20개)  -----------------------------------------------
		
		ArrayList<Payback> list = new MemberService().selectPaybackList(pi);
		
		String page = "";
		if(list != null) {
			page = "views/admin/money/paybackMember.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/admin/common/errorPage.jsp";
			request.setAttribute("msg", "수익금 환급 이력 조회 실패!!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
