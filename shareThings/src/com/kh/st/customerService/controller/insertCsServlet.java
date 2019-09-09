package com.kh.st.customerService.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
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
import com.kh.st.customerService.model.service.CsService;
import com.kh.st.customerService.model.vo.Cs;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.service.ProductService;
import com.kh.st.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class insertCsServlet
 */
@WebServlet("/csInsert.cs")
public class insertCsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			if(ServletFileUpload.isMultipartContent(request)) {
		        
		         int maxSize = 1024 * 1024 * 10;
		         
		        
		         String root = request
		                     .getSession()
		                     .getServletContext()
		                     .getRealPath("/");
		         
		         System.out.println("root : " + root);
		         
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
		         
		         String category = multiRequest.getParameter("csCategory");
		         String content = multiRequest.getParameter("content");
		         Member u = (Member) request.getSession().getAttribute("loginUser");
				
				
		    
		         
		         Cs c = new Cs();
		         c.setcCategory(category);
		         c.setcContent(content);
		         c.setUno(u.getUno());
		         
		         
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
		         
		         int cresult = new CsService().insertCsBoard(c, fileList);
		         
		         if(cresult > 0) {
		            response.sendRedirect(request.getContextPath() + "/views/product/complete2.jsp");
		         }else {
		            for(int i = 0; i < saveFiles.size(); i++) {
		               File failedFile = new File(filePath + saveFiles.get(i));
		               
		               
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
