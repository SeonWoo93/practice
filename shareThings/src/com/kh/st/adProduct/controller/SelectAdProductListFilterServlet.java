package com.kh.st.adProduct.controller;

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
import com.kh.st.adProduct.model.service.AdProductService;
import com.kh.st.common.PageInfo;

/**
 * Servlet implementation class SelectAdProductListFilterServlet
 */
@WebServlet("/selectAdProductListFilter.bo")
public class SelectAdProductListFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdProductListFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*category:category,
		startD:startD,
		endD:endD,*/
		String category = request.getParameter("category");
		String startD = request.getParameter("startD");
		String endD = request.getParameter("endD");
		
		Date startDate = null;
		Date endDate = null;
		
		if(startD != "" && endD != "") {
			startDate = Date.valueOf(startD);
			endDate = Date.valueOf(endD);
		} else {
			startDate = null;
			endDate = null;
		}
		
		//각 조건 묶기
		HashMap<String, Object> condition = new HashMap<String, Object>(); 
		
		condition.put("category", category);
		condition.put("startD", startD);
		condition.put("endD", endD);
		
		System.out.println(condition.get("category"));
		System.out.println(condition.get("startD"));
		System.out.println(condition.get("endD"));
		
		//페이징 처리
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
				
		currentPage = 1;
				
		if(!(request.getParameter("currentPage").equals("1"))) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		limit = 10;
		
		int listCount = new AdProductService().getAdProductFilterCount(condition);
		
		System.out.println(listCount);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		startPage = (((int)((double) currentPage / limit + 0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new AdProductService().selectAdProductFilter(condition, pi);
		
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("list", list);
		hmap.put("pi", pi);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(list != null) {
			new Gson().toJson(hmap, response.getWriter());
		} else {
			request.setAttribute("msg", "필터 조회 실패!!");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
