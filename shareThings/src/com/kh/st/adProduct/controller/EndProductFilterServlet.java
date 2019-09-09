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
 * Servlet implementation class EndProductFilterServlet
 */
@WebServlet("/endProductFilter.bo")
public class EndProductFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndProductFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*details:details,
		filterContent:filterContent,
		startD:startD,
		endD:endD,
		currentPage:currentPage*/
		String details = request.getParameter("details");
		String filterContent = request.getParameter("filterContent");
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
		
		//상세조건과 상세내용 묶기
		HashMap<String, Object> detailsContent = new HashMap<String, Object>();
		detailsContent.put("details",details);
		detailsContent.put("filterContent", filterContent);
		
		HashMap<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("detailsContent", detailsContent);
		condition.put("startD", startD);
		condition.put("endD", endD);
		
		System.out.println(condition.get("detailsContent"));
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
		
		int listCount = new AdProductService().endProductFilterList(condition);
		
		System.out.println(listCount);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		startPage = (((int)((double) currentPage / limit + 0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		//----------- 페이징 처리
		
		ArrayList<HashMap<String, Object>> list = new AdProductService().selectEndProductFilter(condition, pi);
		
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
