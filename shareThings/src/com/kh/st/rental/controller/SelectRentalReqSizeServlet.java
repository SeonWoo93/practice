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
 * Servlet implementation class SelectRentalReqSizeServlet
 */
@WebServlet("/selectReqSize.rt")
public class SelectRentalReqSizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectRentalReqSizeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String>  rentalStatus = new ArrayList<String>();
		//대여 승인
		rentalStatus.add("RTS2");
		//대여 취소 요청
		rentalStatus.add("RTS9");
		//대여 반납 요청
		rentalStatus.add("RTS11");
		
		HashMap<String,Object> listSize  = new RentalService().selectListSize(rentalStatus);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(listSize, response.getWriter());
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
