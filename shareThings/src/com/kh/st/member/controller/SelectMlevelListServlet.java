package com.kh.st.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Mlevel;


@WebServlet("/selectMlevelList.me")
public class SelectMlevelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMlevelListServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		ArrayList<Mlevel> list = new MemberService().selectMlevelList();
		System.out.println(list);
		String page = "";
		if(list != null) {
			page = "views/admin/member/memberLevelList.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/admin/common/errorPage.jsp";
			request.setAttribute("msg", "회원등급 리스트 조회 실패!!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
