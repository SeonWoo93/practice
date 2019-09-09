package com.kh.st.rental.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.product.model.vo.Product;

/**
 * Servlet implementation class DeleteCartListServlet
 */
@WebServlet("/deleteCart.rt")
public class DeleteCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartListServlet() {
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
		
		int result = new ProductService().DeleteCart(statusarr);
		
		
		ArrayList<Product> list = new ProductService().getCartList(u.getUno());
		
		String page = "";
		if(list != null) {
			page = "views/product/cart.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
