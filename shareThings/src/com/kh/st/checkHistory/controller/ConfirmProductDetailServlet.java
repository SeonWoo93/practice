package com.kh.st.checkHistory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.checkHistory.modal.service.CheckHistoryService;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.vo.Product;
import com.kh.st.request.model.service.ReqService;

/**
 * Servlet implementation class ConfirmProductDetailServlet
 */
@WebServlet("/confirmProductDetail.bo")
public class ConfirmProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		int reqNum = Integer.parseInt(request.getParameter("reqNum"));
		
		System.out.println(reqNum);
		
		HashMap<String, Object> hmap = new ReqService().reqProductDetail(reqNum);
		
		Product reqProduct = (Product) hmap.get("reqProduct");
		ArrayList<Attachment> fileList =
				(ArrayList<Attachment>) hmap.get("attachment");
		Member m = (Member) hmap.get("member");
		
		HashMap<String,Object> req = new HashMap<String,Object>();
		
		req.put("pStart", hmap.get("pStart"));
		req.put("pEnd", hmap.get("pEnd"));
		req.put("pName", hmap.get("pName"));
		req.put("reqpDate", hmap.get("reqpDate"));
		req.put("bContent", hmap.get("bContent"));
		req.put("rejectReason", hmap.get("rejectReason"));
		
		System.out.println(req.get("pStart"));
		
		String page = "";
		if(hmap != null) {
			HashMap<String, Object> hmap1 = new CheckHistoryService().confirmProductDetail(reqNum);
			if(hmap1 != null) {
				ArrayList<Attachment> confirmList =
						(ArrayList<Attachment>) hmap1.get("confirmList");
				page = "views/admin/request/reqDataDetail.jsp";
				req.put("condition", hmap1.get("condition"));
				req.put("chkContent", hmap1.get("chkContent"));
				request.setAttribute("reqProduct", reqProduct);
				request.setAttribute("fileList", fileList);
				request.setAttribute("m", m);
				request.setAttribute("req", req);
				request.setAttribute("confirmList", confirmList);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "상세보기 실패");
			}
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세보기 실패");
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
