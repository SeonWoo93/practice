package com.kh.st.product.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Board;
import com.kh.st.common.MyFileRenamePolicy;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import oracle.sql.DATE;

/**
 * Servlet implementation class productInserServlet
 */
@WebServlet("/productInsert.pd")
public class productInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String title = request.getParameter("title");
		 
		 Date stDate = Date.valueOf((request.getParameter("startDay")));
		 Date edDate = Date.valueOf((request.getParameter("endDay")));
		 Date buyDate = Date.valueOf((request.getParameter("buyDay")));
		
		String content = request.getParameter("content");
		String phone = request.getParameter("hp1");
		String phone2 = request.getParameter("em1");
		String zipCode = request.getParameter("zipNo");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = zipCode + "|" + address1 + "|" + address2;
		String model = request.getParameter("pmodel");
		int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));
		String asHistory = request.getParameter("asHistory");
		int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
		int ctgId = Integer.parseInt(request.getParameter("ctgId"));		
		int deposit = Integer.parseInt(request.getParameter("deposit"));
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		Product p = new Product();
		p.setUno(loginUser.getUno());
		p.setpStartDate(stDate);
		p.setpEndDate(edDate);
		p.setPrice(rentPrice);
		p.setDeposite(deposit);
		p.setModel(model);
		p.setCtgId(ctgId);
		p.setPurchaseDate(buyDate);
		p.setPurchasePrice(purchasePrice);
		p.setAsHistory(asHistory);
		
		
		int result = new ProductService().productInsert(p);
		
		*/
		if(ServletFileUpload.isMultipartContent(request)) {
	         int maxSize = 1024 * 1024 * 10;
	         
	         String root = request
	                     .getSession()
	                     .getServletContext()
	                     .getRealPath("/");
	         
	         System.out.println("root : " + root);
	          
	         //파일 저장 경로 설정
	         String filePath = root + "attach_upload/";
	         
	         MultipartRequest multiRequest 
	            = new MultipartRequest(request, filePath, maxSize,
	                     "UTF-8", new MyFileRenamePolicy());
	         
	         ArrayList<String> saveFiles = new ArrayList<String>();
	         ArrayList<String> originFiles = new ArrayList<String>();
	         
	         Enumeration<String> files = multiRequest.getFileNames();
	         
	         while(files.hasMoreElements()) {
	            String name = files.nextElement();
	            
	            System.out.println("name : " + name);
	            
	            saveFiles.add(multiRequest.getFilesystemName(name));
	            originFiles.add(multiRequest.getOriginalFileName(name));
	            
	            System.out.println("fileSystem name : " 
	                           + multiRequest.getFilesystemName(name));
	            System.out.println("originFile : " 
	                           + multiRequest.getOriginalFileName(name));
	         }
	         
	         String multiTitle = multiRequest.getParameter("title");
	         String multiContent = multiRequest.getParameter("content");
	         
	         //---------------------------------------------------프로덕트 폼데이터
	         Date stDate = Date.valueOf((multiRequest.getParameter("startDay")));
			 Date edDate = Date.valueOf((multiRequest.getParameter("endDay")));
			 Date buyDate = Date.valueOf((multiRequest.getParameter("buyDay")));
			
			String content = multiRequest.getParameter("content");
			String phone = multiRequest.getParameter("hp1");
			String phone2 = multiRequest.getParameter("em1");
			String zipCode = multiRequest.getParameter("zipNo");
			String address1 = multiRequest.getParameter("address1");
			String address2 = multiRequest.getParameter("address2");
			String address = zipCode + "|" + address1 + "|" + address2;
			String model = multiRequest.getParameter("pmodel");
			int purchasePrice = Integer.parseInt(multiRequest.getParameter("purchasePrice"));
			String asHistory = multiRequest.getParameter("asHistory");
			int rentPrice = Integer.parseInt(multiRequest.getParameter("rentPrice"));
			int ctgId = Integer.parseInt(multiRequest.getParameter("ctgId"));		
			int deposit = Integer.parseInt(multiRequest.getParameter("deposit"));
			int uno = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			Product p = new Product();
			p.setUno(uno);
			p.setpStartDate(stDate);
			p.setpEndDate(edDate);
			p.setPrice(rentPrice);
			p.setDeposite(deposit);
			p.setModel(model);
			p.setCtgId(ctgId);
			p.setPurchaseDate(buyDate);
			p.setPurchasePrice(purchasePrice);
			p.setAsHistory(asHistory);
			
			
			int presult = new ProductService().productInsert(p);
	         
			int pno = (new ProductService().getProductNo()) - 1;
			
	         System.out.println("multiTitle : " + multiTitle);
	         System.out.println("multiContent : " + multiContent);
	         
	         //Board객체 생성
	         Board b = new Board();
	         b.setbTitle(multiTitle);
	         b.setbContent(multiContent);
	         b.setbWriter(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno()));
	         b.setPno(pno);
	         
	         ArrayList<Attachment> fileList = new ArrayList<Attachment>();
	         for(int i = originFiles.size() - 1; i >= 0; i--) {
	            Attachment at = new Attachment();
	            at.setFilePath(filePath);
	            at.setOriginName(originFiles.get(i));
	            at.setChangeName(saveFiles.get(i));
	            
	            if(originFiles.get(i) != null) {
	            	fileList.add(at);
	            	
	            }
	         }
	         int rqresult = new ProductService().regreqProduct(pno);
	         if(rqresult > 0) {
		         }else {
		            request.setAttribute("msg", "물품등록게시판 등록 실패!");
		            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		         }
	         
	         int bresult = new BoardService().insertProductBoard(b, fileList);
	         
	         if(bresult > 0) {
	            response.sendRedirect(request.getContextPath() + "/views/product/complete.jsp");
	         }else {
	            for(int i = 0; i < saveFiles.size(); i++) {
	               File failedFile = new File(filePath + saveFiles.get(i));
	               
	               //true false 리턴됨
	               
	               System.out.println(failedFile.delete());
	               
	            }
	            request.setAttribute("msg", "물품등록게시판 등록 실패!");
	            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	         }
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
