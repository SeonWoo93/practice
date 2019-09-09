package com.kh.st.rental.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.rental.model.service.RentalService;


/**
 * Servlet implementation class DeleteInvoiceNumServlet
 */
@WebServlet("/deleteInvcNum.rt")
public class DeleteInvoiceNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteInvoiceNumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String rtNos = request.getParameter("rtNos");
		String[] rtNo = rtNos.split(",");
		String pnos = request.getParameter("pnos");
		String[] pno = pnos.split(",");
		String userId = request.getParameter("userId");
		 
		//변경할 물품상태
		String pStatus = "PS10";
		//변경할 대여상태
		String rtStatus = "RTS2";
		 
		 
		HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		invoiceVal.put("rtNo", rtNo);
		invoiceVal.put("pno",pno);
		invoiceVal.put("userId",userId);
		invoiceVal.put("pStatus",pStatus);
		invoiceVal.put("rtStatus",rtStatus);
		 
		int result = new RentalService().deleteInvcNum(invoiceVal);
		
		String page = "";
		 
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectShpMngList.rt");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "송장 취소 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
