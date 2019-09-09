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


@WebServlet("/selectReportFilter.me")
public class SelectReportFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public SelectReportFilter() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String reportName = request.getParameter("reportName");
		String reportResult = request.getParameter("reportResult");
		String status = request.getParameter("status");
		String startReD = request.getParameter("startReD");
		String endReD = request.getParameter("endReD");
		String startRsD = request.getParameter("startRsD");
		String endRsD = request.getParameter("endRsD");
		
		System.out.println(userId);
		System.out.println(reportName);
		System.out.println(reportResult);
		System.out.println(status);
		System.out.println(startReD);
		System.out.println(endReD);
		System.out.println(startRsD);
		System.out.println(endReD);
		
		HashMap<String,Object> condition = new HashMap<String,Object>();
		
		condition.put("userId", userId);
		condition.put("reportName", reportName);
		condition.put("reportResult", reportResult);
		condition.put("status", status);
		condition.put("startReD", startReD);
		condition.put("endReD", endReD);
		condition.put("startRsD", startRsD);
		condition.put("endRsD", endRsD);
		
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
				
				int listCount = new MemberService().getReportFilterCount(condition);
				
				System.out.println(listCount);
				
				maxPage = (int)((double)listCount / limit + 0.98);
				
				startPage = (((int)((double)currentPage / limit + 0.98)) - 1) * 10 + 1;
				
				endPage = startPage + 10 - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
				
		// -----------------------------------------------  페이징 처리 (50개)  -----------------------------------------------
		
		ArrayList<HashMap<String,Object>> list = new MemberService().selectReportFilter(condition,pi);
		
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
