package com.kh.st.stat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.stat.model.service.StatService;



@WebServlet("/selectStatList.st")
public class SelectStatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectStatListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String,Object>> list = new StatService().selectStatList();
		
		System.out.println(list);
		String page = "";
		if(list != null) {
			page = "views/admin/money/salesST.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "기업매출 리스트 조회 실패!!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
