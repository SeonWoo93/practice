package com.kh.st.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.common.PageInfo;
import com.kh.st.member.model.service.MemberService;


@WebServlet("/selectPaybackFilter.me")
public class SelectPaybackFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public SelectPaybackFilterServlet() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String status = request.getParameter("status");
		String startM = request.getParameter("startMoney");
		String endM = request.getParameter("endMoney");
		String startReq = request.getParameter("startReq");
		String endReq = request.getParameter("endReq");
		String startPb = request.getParameter("startPb");
		String endPb = request.getParameter("endPb");

		HashMap<String,Object> condition = new HashMap<String,Object>();

		condition.put("userId", userId);
		condition.put("status", status);
		condition.put("startM", startM);
		condition.put("endM", endM);
		condition.put("startReq", startReq);
		condition.put("endReq", endReq);
		condition.put("startPb", startPb);
		condition.put("endPb", endPb);

		// -----------------------------------------------  페이징 처리 (50개)  -----------------------------------------------
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		if(!(request.getParameter("currentPage").equals("1"))) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 50;

		int listCount = new MemberService().getPaybackFilterCount(condition);

		System.out.println(listCount);

		maxPage = (int)((double)listCount / limit + 0.98);

		startPage = (((int)((double)currentPage / limit + 0.98)) - 1) * 10 + 1;

		endPage = startPage + 10 - 1;

		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);

		// -----------------------------------------------  페이징 처리 (50개)  -----------------------------------------------

		ArrayList<HashMap<String,Object>> list = new MemberService().selectPaybackFilter(condition, pi);

		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("list", list);
		hmap.put("pi", pi);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		if(list != null) {
			new Gson().toJson(hmap, response.getWriter());
		}else {
			request.setAttribute("msg", "필터 조회 실패!!");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
