package com.kh.st.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.member.model.service.MemberService;

@WebServlet("/selectMoneySize.me")
public class SelectMoneySizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public SelectMoneySizeServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> hmap = new MemberService().selectMoneySize();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(hmap != null) {
			new Gson().toJson(hmap, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
