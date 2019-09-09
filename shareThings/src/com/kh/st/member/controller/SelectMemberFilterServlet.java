package com.kh.st.member.controller;

import java.io.IOException;
import java.sql.Date;
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


@WebServlet("/selectMemberFilter.me")
public class SelectMemberFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMemberFilterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userLv = request.getParameter("userLv");
		String status = request.getParameter("userStatus");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		
		
		System.out.println(userId);
		System.out.println(userName);
		System.out.println(userLv);
		System.out.println(status);
		System.out.println(sDate);
		System.out.println(eDate);
		HashMap<String,Object> condition = new HashMap<String,Object>();
		
		condition.put("userId", userId);
		condition.put("userName", userName); 
		condition.put("userLv", userLv);
		condition.put("status", status);
		condition.put("startDate", sDate);
		condition.put("endDate", eDate);
		
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
		
		int listCount = new MemberService().getMemberFilterCount(condition);
		
		System.out.println(listCount);
		
		maxPage = (int)((double)listCount / limit + 0.98);
		
		startPage = (((int)((double)currentPage / limit + 0.98)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
// -----------------------------------------------  페이징 처리 (50개)  -----------------------------------------------
		
		
		ArrayList<HashMap<String,Object>> list = new MemberService().selectMemberFilter(condition, pi);
		
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



























