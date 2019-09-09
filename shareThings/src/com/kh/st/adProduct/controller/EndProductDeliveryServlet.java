package com.kh.st.adProduct.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.adProduct.model.service.AdProductService;

/**
 * Servlet implementation class EndProductDeliveryServlet
 */
@WebServlet("/endProductDelivery.bo")
public class EndProductDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndProductDeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		int pno = Integer.parseInt(request.getParameter("pno"));	//물품번호
		String dlocation = request.getParameter("dlocation");	//배송지
		String delivery = request.getParameter("delivery");	//택배사
		String dNo = request.getParameter("dNo");	//송장번호
		
		System.out.println("물품번호 : " + pno);
		System.out.println("배송지 : " + dlocation);
		System.out.println("택배사 : " + delivery);
		System.out.println("송장번호 : " + dNo);
		
		int result = new AdProductService().endProductDelivery(pno, dlocation, delivery, dNo);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/endProductList.bo");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "반환 처리 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
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
