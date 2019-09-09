package com.kh.st.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.kh.st.member.model.service.MemberService;
import com.kh.st.member.model.vo.Payback;

@WebServlet("/paybackDownload.me")
public class PaybackDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PaybackDownloadServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		String[] nums = no.split(",");
		for(int i = 0; i < nums.length; i++) {
			System.out.println(nums[i]);
		}
		Workbook xlsWb = new HSSFWorkbook();
		//Workbook xlsxWb = new XSSFWorkbook();
		
		Sheet sheet1 = xlsWb.createSheet("firstSheet");
		
		sheet1.setColumnWidth(0, 5000);
		sheet1.setColumnWidth(1, 5000);
		sheet1.setColumnWidth(2, 5000);
		sheet1.setColumnWidth(3, 5000);
		sheet1.setColumnWidth(4, 5000);
		
		Row row = null;
		Cell cell = null;
		
		row = sheet1.createRow(0);
		
		cell = row.createCell(0);
		cell.setCellValue("No.");
		cell = row.createCell(1);
		cell.setCellValue("예금주");
		cell = row.createCell(2);
		cell.setCellValue("은행명");
		cell = row.createCell(3);
		cell.setCellValue("계좌번호");
		cell = row.createCell(4);
		cell.setCellValue("이체금액");
		
		
		ArrayList<Payback> list = new MemberService().getDownloadList(nums);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		if(list != null) {
			for(int i = 1; i <= list.size(); i++) {
				row = sheet1.createRow(i);
				
				cell = row.createCell(0);
				cell.setCellValue(list.get(i - 1).getPbNo());
				cell = row.createCell(1);
				cell.setCellValue(list.get(i - 1).getAccName());
				cell = row.createCell(2);
				cell.setCellValue(list.get(i - 1).getBank());
				cell = row.createCell(3);
				cell.setCellValue(list.get(i - 1).getAccount());
				cell = row.createCell(4);
				cell.setCellValue(list.get(i - 1).getPbAmount());
				
			}
			
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName = ft.format(new Date(currentTime));
			int randomNumber = (int)(Math.random() * 100000);
			
			File xlsFile = new File("D:/Payback" + fileName + randomNumber +  ".xls");
			FileOutputStream fileOut = new FileOutputStream(xlsFile);
			xlsWb.write(fileOut);
			
			xlsWb.close();
			
			response.sendRedirect("/st/selectPaybackList.me");
		}else {
			request.setAttribute("msg", "수익금 환급 이력 다운로드 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
