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


@WebServlet("/updateMlevel.me")
public class UpdateMlevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateMlevelServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] levelCode = request.getParameterValues("levelCode");
		String[] levelName = request.getParameterValues("levelName");
		String[] levelStd = request.getParameterValues("levelStd");
		String[] perPoint = request.getParameterValues("perPoint");
		
		ArrayList<Mlevel> list = new ArrayList<Mlevel>();
		
		for(int i = 0; i < levelCode.length; i++) {
			Mlevel ml = new Mlevel();
			ml.setLevelCode(levelCode[i]);
			ml.setLevelName(levelName[i]);
			ml.setLevelStd(Integer.parseInt(levelStd[i]));
			ml.setPerPoint(Integer.parseInt(perPoint[i]));
			
			list.add(ml);
		}
		
		int result = new MemberService().updateMlevel(list);
		
		if(result > 0) {
			response.sendRedirect("/st/selectMlevelList.me");
		}else {
			request.setAttribute("msg", "회원등급 수정에 실패했습니다.");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
			
		}
	} 


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

















