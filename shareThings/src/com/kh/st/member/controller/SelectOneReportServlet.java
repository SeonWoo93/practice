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
import com.kh.st.member.model.service.MemberService;


@WebServlet("/selectOneReport.me")
public class SelectOneReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectOneReportServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		int reportNo = Integer.parseInt(request.getParameter("no"));
		
		ArrayList<HashMap<String,Object>> list = new MemberService().selectOneReport(reportNo);
		
		if(list != null) {
			new Gson().toJson(list, response.getWriter());
		}else {
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
