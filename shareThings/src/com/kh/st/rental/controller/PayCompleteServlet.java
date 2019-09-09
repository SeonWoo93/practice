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
@WebServlet("/paycomplete.rt")
public class PayCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member u = (Member) request.getSession().getAttribute("loginUser");
		String status = request.getParameter("status");
		String[] statusarr = status.split(",");
		String price = request.getParameter("price");
		String applynum = request.getParameter("applynum");
		int result = 0;
		
		for(int i = 0; i < statusarr.length; i++) {
		Cart pno = new ProductService().getProductNoinCart(Integer.parseInt(statusarr[i]));
		
		result = new RentalService().reqRental(pno, u.getUno());
		}
		if(result > 0) {
            response.sendRedirect(request.getContextPath() + "/cartlist3.rt");
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
