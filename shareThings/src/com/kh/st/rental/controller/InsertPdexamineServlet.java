package com.kh.st.rental.controller;

import java.io.File;
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

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.checkHistory.modal.service.CheckHistoryService;
import com.kh.st.checkHistory.modal.vo.CheckHistory;
import com.kh.st.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertPdexamineServlet
 */
@WebServlet("/returnPdexamine.rt")
public class InsertPdexamineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPdexamineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("multipart로 request 요청");
			int maxSize = 1024 * 1024 * 10;
			
			//웹 서버 컨테이너 경로 추출
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
			
			//저정한 파일(변경된)의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본 파일 이름을 저장할 arrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
				System.out.println("fileSystem name : " 
									+ multiRequest.getFilesystemName(name));
				System.out.println("originFile : " 
									+ multiRequest.getOriginalFileName(name));
			}
			
			String rtNos = multiRequest.getParameter("rno");
			String[] rtNo = rtNos.split(",");
			String pnos = multiRequest.getParameter("pno");
			String[] pno = pnos.split(",");
			
			int pnum = Integer.parseInt(pnos);
			
			String textResult = multiRequest.getParameter("textResult");	//검수내용
			String checker = multiRequest.getParameter("checker");	//검수자 회원번호
			String userId = multiRequest.getParameter("userId");
			
			
			
			
			//변경할 물품상태 (창고적재)
			String pStatus = "PS10";
			//변경할 대여상태 (대여완료)
			String rtStatus = "RTS8";
			
			System.out.println("요청번호 : " + rtNo);
			System.out.println("물품번호 : " + pno);
			System.out.println("거절사유: " + textResult);
			System.out.println("검수자 회원 번호   : " + checker);
			System.out.println("유저 : " + userId);
			
			//검수 이력 객체 생성
			CheckHistory ch = new CheckHistory	 ();
			ch.setPno(pnum);	//물품번호
			ch.setChkContent(textResult);	//검수내용
			ch.setChecker(checker);	//검수자
			
			HashMap<String, Object> hmap = new HashMap<>();
			hmap.put("pno", pno);
			hmap.put("rtNo",rtNo);
			hmap.put("pStatus", pStatus);
			hmap.put("rtStatus", rtStatus);
			
			System.out.println(ch);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			for(int i = 0; i < fileList.size(); i++) {
				System.out.println(fileList.get(i));
			}
			
			int result = new CheckHistoryService().insertExamineImg(ch, fileList , hmap);
			
			String page = "";
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectReturnPdMngList.rt");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//true false 리턴됨
					System.out.println(failedFile.delete());
				}
				page = "views/common/errorPage.jsp";
				
				request.setAttribute("msg", "수거 실패");
				request.getRequestDispatcher(page).forward(request, response);
			}
		} else {
			System.out.println("실패");
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
