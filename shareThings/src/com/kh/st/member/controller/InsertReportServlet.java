package com.kh.st.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Report;

/**
 * Servlet implementation class InsertReportServlet
 */
@WebServlet("/insert.rp")
public class InsertReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int targetUno = Integer.parseInt(request.getParameter("targetUno"));
		int reportUno = Integer.parseInt(request.getParameter("reportUno"));
		String reportCode = request.getParameter("reportCode");
		String reportContent = request.getParameter("reportContent");
		Report newReport = new Report();
		newReport.setReportUno(reportUno);
		newReport.setTargetUno(targetUno);
		newReport.setReportCode(reportCode);
		newReport.setReportContent(reportContent);
		
			
		int result = new MemberService().insertReport(newReport); 
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
