package com.kh.st.rental.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.rental.model.dao.RentalDao;
import com.kh.st.rental.model.service.RentalService;

/**
 * Servlet implementation class InsertInvoiceNumServlet
 */
@WebServlet("/insertInvcNum.rt")
public class InsertInvoiceNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInvoiceNumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		/* int rtNo = Integer.parseInt(request.getParameter("rtNo"));
		 int pno = Integer.parseInt(request.getParameter("pno"));*/
		String rtNos = request.getParameter("rtNos");
		String[] rtNo = rtNos.split(",");
		String pnos = request.getParameter("pnos");
		String[] pno = pnos.split(",");
		String invoiceNum = request.getParameter("invoiceNum");
		String dCom = request.getParameter("dCom");
		String userId = request.getParameter("userId");
		//변경할 대여 상태 코드
		String rtStatus = "RTS4";
		 
		HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		invoiceVal.put("rtNo", rtNo);
		invoiceVal.put("invoiceNum",invoiceNum);
		invoiceVal.put("pno",pno);
		invoiceVal.put("dCom",dCom);
		invoiceVal.put("userId",userId);
		invoiceVal.put("rtStatus",rtStatus);
		 
		int result = new RentalService().insertInvcNum(invoiceVal);
		
		String page = "";
		 
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectShpMngList.rt");
		}else {
			page = "views/common/errorPage.jsp";
		request.setAttribute("msg", "송장 입력 오류");
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
