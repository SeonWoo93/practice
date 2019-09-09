package com.kh.st.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.board.model.service.BoardService;

/**
 * Servlet implementation class BoardFilterServlet
 */
@WebServlet("/filter.bo")
public class BoardFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(URLDecoder.decode(request.getParameter("ctgLv2"), "UTF-8"));
		//System.out.println(URLDecoder.decode(request.getParameter("ctgLv3Arr"), "UTF-8"));
		String ctgLv2 = request.getParameter("ctgLv2");
		String ctgLv3Str = request.getParameter("ctgLv3Arr");
		String start = request.getParameter("startFilter");
		System.out.println(start);
		Date startDate = null;
		//Date startDate = Date.valueOf("start");
		if(!start.equals("")) {
			String[] startArr = start.split("-");
			startDate = new Date(new GregorianCalendar(Integer.parseInt(startArr[0]), 
					Integer.parseInt(startArr[1]) - 1, Integer.parseInt(startArr[2])).getTimeInMillis());
		}
		String end = request.getParameter("endFilter");
		System.out.println(end);
		Date endDate = null;
		//Date endDate = Date.valueOf("end");
		if(!end.equals("")) {
			String[] endArr = end.split("-");
			endDate = new Date(new GregorianCalendar(Integer.parseInt(endArr[0]), 
					Integer.parseInt(endArr[1]) - 1, Integer.parseInt(endArr[2])).getTimeInMillis());
		}
		String priceRange = request.getParameter("priceFilter");
		int minPrice = Integer.parseInt(priceRange.substring(0, priceRange.indexOf("원")));
		int maxPrice = Integer.parseInt(priceRange.substring(priceRange.indexOf("-") + 1, priceRange.length() - 1));
		String orderBy = request.getParameter("orderBy");
		System.out.println(ctgLv2);
		System.out.println(ctgLv3Str);
		//System.out.println(ctgLv3Arr);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(minPrice);
		System.out.println(maxPrice);
		System.out.println(orderBy);
		
		HashMap<String, Object> filterMap = new HashMap<String, Object>();
		filterMap.put("ctgLv2", ctgLv2);
		filterMap.put("ctgLv3Str", ctgLv3Str);
		filterMap.put("startDate", startDate);
		filterMap.put("endDate", endDate);
		filterMap.put("minPrice", minPrice);
		filterMap.put("maxPrice", maxPrice);
		filterMap.put("orderBy", orderBy);
		
		HashMap<String, Object> listMap = new BoardService().selectFilterList(filterMap);
		String page = "";
		
		/*response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");*/
		if(!listMap.isEmpty()) {
			//new Gson().toJson(bList, response.getWriter());
			page = "views/main/productList.jsp";
			request.setAttribute("listMap", listMap);
			request.setAttribute("ctgLv2", ctgLv2);
			request.setAttribute("filterMap", filterMap);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "필터 적용 실패..");
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
