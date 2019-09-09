package com.kh.st.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Board;
import com.kh.st.common.SendSMS;
import com.kh.st.member.model.service.MemberService;

/**
 * Servlet implementation class InsertReviewAnswerServlet
 */
@WebServlet("/insertRvAns.bo")
public class InsertReviewAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvContent = request.getParameter("rvInput");
		String rvWriter = request.getParameter("rvWriter");
		int refBno = Integer.parseInt(request.getParameter("refBno"));
		int parentBno = Integer.parseInt(request.getParameter("parentBno"));
		int bLevel = Integer.parseInt(request.getParameter("bLevel"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		Board newReview = new Board();
		newReview.setbContent(rvContent);
		newReview.setbWriter(rvWriter);
		newReview.setParentBno(parentBno);
		newReview.setbLevel(bLevel);
		newReview.setPno(pno);
		int result = new BoardService().insertRvAns(newReview);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			ArrayList<HashMap<String, Object>> reviewList = new BoardService().selectReviewList(refBno);
			if(!reviewList.isEmpty()) {
				new Gson().toJson(reviewList, response.getWriter());
			}else {
				response.getWriter().append("List not found");
			}
			
			
		}else {
			response.getWriter().append("insert fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
