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
 * Servlet implementation class InsertBoardQnAServlet
 */
@WebServlet("/insertQnA.bo")
public class InsertBoardQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaContent = request.getParameter("qnaInput");
		String qnaWriter = request.getParameter("qnaWriter");
		int refBno = Integer.parseInt(request.getParameter("refBno"));
		int parentBno = Integer.parseInt(request.getParameter("parentBno"));
		int bLevel = Integer.parseInt(request.getParameter("bLevel"));
		String parentBtitle = request.getParameter("parentBtitle");
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		Board newQnA = new Board();
		newQnA.setbContent(qnaContent);
		newQnA.setbWriter(qnaWriter);
		newQnA.setParentBno(parentBno);
		newQnA.setbLevel(bLevel);
		newQnA.setPno(pno);
		int result = new BoardService().insertQnA(newQnA);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			ArrayList<HashMap<String, Object>> qnaList = new BoardService().selectQnAList(refBno);
			if(!qnaList.isEmpty()) {
				if(bLevel == 0) {
					String phone = new MemberService().getBwriterPhone(parentBno);
					int index = phone.indexOf(")");
					new SendSMS().send(phone.substring(index + 1), parentBtitle, "Q&A");
				}
				new Gson().toJson(qnaList, response.getWriter());
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
