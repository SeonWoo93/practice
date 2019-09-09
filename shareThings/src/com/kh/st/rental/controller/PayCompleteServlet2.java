package com.kh.st.rental.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.rental.model.service.RentalService;
import com.kh.st.rental.model.vo.Cart;

/**
 * Servlet implementation class PayCompleteServlet
 */
@WebServlet("/paycomplete2.rt")
public class PayCompleteServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayCompleteServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String status = request.getParameter("status");
		String[] statusarr = status.split(",");
		int result = 0;
		int pno = 0;
		
		for(int i = 0; i < statusarr.length; i++) {
		pno = new ProductService().getProductNoinCart2(Integer.parseInt(statusarr[i]));
		
		}
		if(pno > 0) {
            response.sendRedirect(request.getContextPath() + "/views/product/rentalcomplete.jsp");
         }else {
 
            request.setAttribute("msg", "물품등록게시판 등록 실패!");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
