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
 * Servlet implementation class InsertReturnInvoiceNumServlet
 */
@WebServlet("/insertReturnInvcNum.rt")
public class InsertReturnInvoiceNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertReturnInvoiceNumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rtNos = request.getParameter("rtNos");
		String[] rtNo = rtNos.split(",");
		String pnos = request.getParameter("pnos");
		String[] pno = pnos.split(",");
		String invoiceNum = request.getParameter("invoiceNum");
		String dCom = request.getParameter("dCom");
		//변경할 물품 상태 코드
		String pStatus = "PS11";
		//변경할 대여 상태 코드
		String rtStatus = "RTS6";
		 
		HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		invoiceVal.put("rtNo", rtNo);
		invoiceVal.put("invoiceNum",invoiceNum);
		invoiceVal.put("pno",pno);
		invoiceVal.put("dCom",dCom);
		invoiceVal.put("pStatus",pStatus);
		invoiceVal.put("rtStatus",rtStatus);
		 
		int result = new RentalService().insertReturnInvcNum(invoiceVal);
		
		String page = "";
		 
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectReturnPdMngList.rt");
		}else {
			page = "views/common/errorPage.jsp";
		request.setAttribute("msg", "송장 입력 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
