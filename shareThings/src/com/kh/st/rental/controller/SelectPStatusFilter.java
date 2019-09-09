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
* Comment  : 대여조회 페이지에서 대여상태로 조회 ajax 
* @version : 1.0
* @author  : 최병욱
* @date    : 19.05.15
*/
@WebServlet("/selectPStatus.ft")
public class SelectPStatusFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPStatusFilter() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rentalStatus = request.getParameter("rentalStatus");
		//조회 해서 받아올 리스트
		//ArrayList<HashMap<String,Object>> list = new RentalService().selectPStatusList(rentalStatus);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		//new Gson().toJson(list, response.getWriter());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
