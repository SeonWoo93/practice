package com.kh.st.rental.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.rental.model.service.RentalService;

/**
 * Servlet implementation class SelectRtPdFilterServlet
 */
@WebServlet("/selectRtPdFilter.rt")
public class SelectRtPdFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRtPdFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rentalStatus = request.getParameter("rentalStatus");
		String details = request.getParameter("details");
		String filterContent = request.getParameter("filterContent");
	
		System.out.println("rentalStatus : " + rentalStatus);
		System.out.println("details : " + details);
		System.out.println("filterContent : " + filterContent);
		
		HashMap<String,Object> detailsContent = new HashMap<>();
		detailsContent.put("details", details);
		detailsContent.put("filterContent",filterContent);
		
		//각 조건들을 묶음
		HashMap<String,Object> condition = new HashMap<>();

		condition.put("rentalStatus", rentalStatus);
		condition.put("detailsContent", detailsContent);
		
		ArrayList<HashMap<String,Object>> list = new RentalService().selectRtPdFilter(condition);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
