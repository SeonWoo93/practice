package com.kh.st.rental.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.dao.ProductDao;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.product.model.vo.Product;
import com.kh.st.rental.model.vo.Cart;

/**
 * Servlet implementation class getCartlistServlet
 */
@WebServlet("/cartlist3.rt")
public class getCartlistServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCartlistServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member u = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<Product> list = new ProductService().getCartList(u.getUno());
		
		String page = "";
		if(list != null) {
			page = "views/product/paycomplete.jsp";
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
