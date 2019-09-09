package com.kh.st.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.board.model.service.BoardService;
import com.kh.st.board.model.vo.Board;
import com.kh.st.common.MyFileRenamePolicy;
import com.kh.st.common.SendSMS;
import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertBoardReviewServlet
 */
@WebServlet("/insertReview.bo")
public class InsertBoardReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root: " + root);
			String filePath = root + "attach_upload/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, 
					maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				
				if(multiRequest.getFilesystemName(name) != null && multiRequest.getOriginalFileName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
					System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
					System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
				}
			}
			
			String rvContent = multiRequest.getParameter("reviewInput");
			System.out.println("rvContent : " + rvContent);
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			String rvWriter = loginUser.getUno() + "";
			System.out.println("rvWriter : " + rvWriter);
			String parentBno = multiRequest.getParameter("bno");
			System.out.println("parentBno : " + parentBno);
			String parentBtitle = multiRequest.getParameter("bTitle");
			String pno = multiRequest.getParameter("pno");
			System.out.println("pno : " + pno);
			int bLevel = Integer.parseInt(multiRequest.getParameter("bLevel"));
			String reviewStar = multiRequest.getParameter("reviewStar");
			System.out.println("reviewStar " + reviewStar);
			
			Board newReview = new Board();
			newReview.setbContent(rvContent);
			newReview.setbWriter(rvWriter);
			newReview.setParentBno(Integer.parseInt(parentBno));
			newReview.setPno(Integer.parseInt(pno));
			newReview.setbLevel(bLevel);
			newReview.setReviewStar(Integer.parseInt(reviewStar));
			
			ArrayList<Attachment> rvImgList = new ArrayList<Attachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				rvImgList.add(at);
			}
			
			
			int result = new BoardService().insertReview(newReview, rvImgList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			if(result > 0) {
				ArrayList<HashMap<String, Object>> reviewList = new BoardService().selectReviewList(Integer.parseInt(parentBno));
				if(!reviewList.isEmpty()) {
					String phone = new MemberService().getBwriterPhone(Integer.parseInt(parentBno));
					int index = phone.indexOf(")");
					new SendSMS().send(phone.substring(index + 1), parentBtitle, "대여 후기");
					new Gson().toJson(reviewList, response.getWriter());
				}else {
					response.getWriter().append("List not found");
				}
				
				
			}else {
				
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
