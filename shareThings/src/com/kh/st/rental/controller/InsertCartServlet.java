package com.kh.st.rental.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.vo.Member;
import com.kh.st.rental.model.service.RentalService;
import com.kh.st.rental.model.vo.Cart;

/**
 * Servlet implementation class InsertRentalServlet
 */
@WebServlet("/insert.crt")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Date startDate = null;
		String st = request.getParameter("st");
		String[] stArr = st.split("-");
		for(int i = 0; i < stArr.length; i++) {
			startDate = new Date(new GregorianCalendar(Integer.parseInt(stArr[0]), Integer.parseInt(stArr[1]) - 1,
					Integer.parseInt(stArr[2])).getTimeInMillis());
			
		}
		Date endDate = null;
		String end = request.getParameter("end");
		String[] endArr = end.split("-");
		for(int i = 0; i < endArr.length; i++) {
			endDate = new Date(new GregorianCalendar(Integer.parseInt(endArr[0]), Integer.parseInt(endArr[1]) - 1,
					Integer.parseInt(endArr[2])).getTimeInMillis());
			
		}
		int pno = Integer.parseInt(request.getParameter("pno"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		Cart newCart = new Cart();
		newCart.setPno(pno);
		newCart.setUno(loginUser.getUno());
		newCart.setRtStartDate(startDate);
		newCart.setRtEndDate(endDate);
		
		int result = new RentalService().insertCart(newCart);
		if(result > 0) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
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
