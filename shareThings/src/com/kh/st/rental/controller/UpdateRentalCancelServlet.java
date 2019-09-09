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
 * Servlet implementation class UpdateRentalCancelServlet
 */
@WebServlet("/cancel.rt")
public class UpdateRentalCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRentalCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String textResult = request.getParameter("textResult");
		String rtNos = request.getParameter("rtNos");
		String[] rtNo = rtNos.split(",");
		String pnos = request.getParameter("pnos");
		String[] pno = pnos.split(",");
		
		String pStatus = "PS10";
		String rtStatus = "RTS10";
	
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		
		hmap.put("pno", pno);
		hmap.put("textResult", textResult);
		hmap.put("rtNo", rtNo);
		hmap.put("pStatus", pStatus);
		hmap.put("rtStatus", rtStatus);
		
		
		int result = new RentalService().updateCancel(hmap);
		
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectShpMngList.rt");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상태 업데이트 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
