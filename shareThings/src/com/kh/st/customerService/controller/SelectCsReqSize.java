package com.kh.st.customerService.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.customerService.model.service.CsService;
import com.kh.st.rental.model.service.RentalService;

/**
 * Servlet implementation class SelectCsReqSize
 */
@WebServlet("/selectReqSize.cs")
public class SelectCsReqSize extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectCsReqSize() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listSize  = new CsService().selectListSize();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(listSize, response.getWriter());
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
