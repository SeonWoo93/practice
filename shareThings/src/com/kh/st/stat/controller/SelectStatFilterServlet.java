package com.kh.st.stat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.stat.model.service.StatService;


@WebServlet("/selectStatFilter.st")
public class SelectStatFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectStatFilterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startD = request.getParameter("startDate");
		String endD = request.getParameter("endDate");
		System.out.println(startD);
		ArrayList<HashMap<String,Object>> list = new StatService().selectFilter(startD, endD);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(list != null) {
			new Gson().toJson(list, response.getWriter());
		}else {
			request.setAttribute("msg", "필터 조회 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
