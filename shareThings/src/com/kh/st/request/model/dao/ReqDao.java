package com.kh.st.request.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.common.PageInfo;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.vo.Product;
import com.kh.st.request.model.vo.ReqProduct;

public class ReqDao {
	private Properties prop = new Properties();
	
	public ReqDao() {
		String fileName = ReqDao
							.class
							.getResource("/sql/request/request-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//페이징 처리 전체 조회 게시글 숫자
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}
	//페이징 처리 전체 조회
	public ArrayList<ReqProduct> reqList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReqProduct> list = null;
		String bType = "등록";
		
		String query = prop.getProperty("reqList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReqProduct>();
			
			while(rset.next()) {
				ReqProduct rp = new ReqProduct();
				
				rp.setUpNo(rset.getInt("REQP_NO"));
				rp.setbWriter(rset.getString("USER_NAME"));
				rp.setProductName(rset.getString("CTG_NAME"));
				rp.setReqDate(rset.getDate("REQP_DATE"));
				rp.setbTitle(rset.getString("BTITLE"));
				rp.setStatus(rset.getString("STATUS"));
				rp.setbNo(rset.getInt("BNO"));
				
				list.add(rp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
	//선택한 요청 거절 조회
	public ArrayList<ReqProduct> reqNoSelect(Connection con, String[] status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReqProduct> list = new ArrayList<ReqProduct>();
		
		String query = prop.getProperty("reqNoSelect");
		try {
			for(int i = 0; i < status.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(status[i]));
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					ReqProduct rp = new ReqProduct();
					
					rp.setUpNo(rset.getInt("REQP_NO"));
					rp.setProductName(rset.getString("CTG_NAME"));
					rp.setbWriter(rset.getString("USER_NAME"));
					
					list.add(rp);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(list);
		return list;
	}
	
	//요청 거절 처리
	public int reqNo(Connection con, String[] num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reqNo");
		
		try {
			for(int i = 0; i < num.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(num[i]));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//요청 거절 결과(사유 입력)
	public int reqNoResult(Connection con, String[] num, String textResult) {
		PreparedStatement pstmt = null;
		int result1 = 0;
		
		String query = prop.getProperty("reqNoResult");
		try {
			for(int i = 0; i < num.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, textResult);
				pstmt.setInt(2, Integer.parseInt(num[i]));
				
				result1 += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1;
	}
	
	//선택한 요청 승인 조회
	public ReqProduct reqOkSelect(Connection con, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReqProduct rp = null;
		
		String query = prop.getProperty("reqOkSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(status));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rp = new ReqProduct();
				
				rp.setUpNo(rset.getInt("REQP_NO"));
				rp.setProductName(rset.getString("CTG_NAME"));
				rp.setbWriter(rset.getString("USER_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return rp;
	}
	
	//요청 승인 처리
	public int reqOk(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reqOk");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//요청 승인 처리(승인 날짜)
	public int reqOkResult(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result1 = 0;
		
		String query = prop.getProperty("reqOkResult");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result1 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1;
	}
	
	//요청 승인 배송 처리
	public int delWait(Connection con, int num, String delivery, String dNo) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		String reg = "등록";
		String in = "입고";
		
		String query = prop.getProperty("delWait");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dNo);
			pstmt.setString(2, delivery);
			pstmt.setString(3, reg);
			pstmt.setInt(4, num);
			pstmt.setString(5, in);
			pstmt.setInt(6, num);
			
			result2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}
	
	//요청물품 상세 보기
	public HashMap<String, Object> reqProductDetail(Connection con, int reqNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Member m = null;
		Product reqProduct = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("reqProductDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reqNum);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			hmap = new HashMap<String, Object>();
			while(rset.next()) {
				reqProduct = new Product();		
				reqProduct.setPurchaseDate(rset.getDate("PURCHASE_DATE"));	//구입시기
				reqProduct.setModel(rset.getString("MODEL")); //모델명
				reqProduct.setPurchasePrice(rset.getInt("PURCHASE_PRICE"));	//구입가
				reqProduct.setPrice(rset.getInt("PRICE"));	//대여비
				reqProduct.setDeposite(rset.getInt("DEPOSIT"));	//보증금
				reqProduct.setPno(reqNum);	//물품번호
				
				at = new Attachment();
				at.setAno(rset.getInt("ANO"));	//파일번호
				at.setOriginName(rset.getString("ORIGIN_NAME"));	//원본
				at.setChangeName(rset.getString("CHANGe_NAME"));	//사본
				at.setFilePath(rset.getString("FILE_PATH"));	//경로
					
				m = new Member();
				m.setPhone(rset.getString("PHONE"));	//전화번호
				m.setAddress(rset.getString("ADDRESS"));	//주소
				m.setUserName(rset.getString("USER_NAME")); //이름
				
				list.add(at);
				
				hmap.put("pStart", rset.getDate("PSTART_DATE"));	//등록시작일
				hmap.put("pEnd", rset.getDate("PEND_DATE"));	//등록종료일
				hmap.put("pName", rset.getString("CTG_NAME"));	//물품명
				hmap.put("reqpDate", rset.getDate("REQP_DATE"));	//요청날짜
				hmap.put("bContent", rset.getString("BCONTENT"));	//글 내용
				hmap.put("rejectReason", rset.getString("REJECT_REASON"));	//거절 이유
				
			}
			hmap.put("reqProduct", reqProduct);
			hmap.put("attachment", list);
			hmap.put("member", m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}
	
	//조건 검색
	public ArrayList<HashMap<String, Object>> selectReqFilter(Connection con, 
			HashMap<String, Object> condition, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = null;
		
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		ArrayList<String> rnumArr = new ArrayList<String>();
		ArrayList<Object> rnumVal = new ArrayList<Object>();
		boolean allViewsChk = false;
		
		String bType = "등록";
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		//조건에 따른 query문 가져오기
		HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		//전체조회
		if(condition.get("okStatus").equals("0") &&
				detailsContent.get("details").equals("0") &&
				condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ?)) ");
			bindVal.add("1");
			rnumArr.add(" WHERE RNUM BETWEEN ? ");
			rnumArr.add(" AND ? ");
			rnumVal.add(startRow);
			rnumVal.add(endRow);
			System.out.println("전체조회");
		} else {
			//조건 검색
			//승인상태가 전체가 아닐때
			if(!(condition.get("okStatus").equals("0"))) {
				queryArr.add(" PS.SID = ? ");
				bindVal.add(condition.get("okStatus"));
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				
				//상세조건 별 쿼리문
				if(detailsContent.get("details").equals("reqNo")) {
					queryArr.add(" R.REQP_NO = ? ");
				} else if(detailsContent.get("details").equals("name")) {
					queryArr.add(" M.USER_NAME = ? ");
				} else if(detailsContent.get("details").equals("reqName")) {
					queryArr.add(" PC.CTG_NAME = ? ");
				}
				bindVal.add(detailsContent.get("filterContent"));
			}
			//날짜값 있을 경우
			if(!(condition).get("startD").equals("")) {
				//날짜 2개 비교 인덱스 맞추기
				queryArr.add(" P.PSTART_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startD"));
				bindVal.add(condition.get("endD"));
				System.out.println(condition.get("startD"));
			}
			
			rnumArr.add(" WHERE RNUM BETWEEN ? ");
			rnumArr.add(" AND ? ");
			rnumVal.add(startRow);
			rnumVal.add(endRow);
		}
		query = prop.getProperty("selectReqFilter");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더하기
			for(int i = 0; i < queryArr.size(); i++) {
				if(i==queryArr.size() - 1) {
					query += queryArr.get(i) + "))";
					
				} else {
					query += queryArr.get(i) + "AND ";
				}
			}
		} else {
			//전제조회 쿼리
			query += queryArr.get(0);
		}
		for(int i = 0; i < rnumArr.size(); i++) {
			query += rnumArr.get(i);
		}
		
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bType);
			//반다온값으로 바인드값 보내기
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+2, bindVal.get(i));
			}
			for(int i = 0; i < rnumVal.size(); i++) {
				pstmt.setObject(bindVal.size() + (i + 2), rnumVal.get(i));
			}
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("reqNo", rset.getInt("REQP_NO"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("ctgName", rset.getString("CTG_NAME"));
				hmap.put("bTitle", rset.getString("BTITLE"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("bNo", rset.getInt("BNO"));
				hmap.put("reqD", rset.getDate("REQP_DATE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//페이징 처리 요청 승인 게시글 숫자
	public int getListOkCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listOkCount = 0;
		
		String query = prop.getProperty("listOkCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listOkCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listOkCount;
	}
	//페이징 처리 요청 승인 전체 게시글
	public ArrayList<ReqProduct> reqOkList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReqProduct> list = null;
		String bType = "등록";
		
		String qeury = prop.getProperty("reqOkList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, bType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReqProduct>();
			
			while(rset.next()) {
				ReqProduct rp = new ReqProduct();
				
				rp.setbNo(rset.getInt("BNO"));
				rp.setUpNo(rset.getInt("REQP_NO"));
				rp.setbWriter(rset.getString("USER_NAME"));
				rp.setProductName(rset.getString("CTG_NAME"));
				rp.setReqDate(rset.getDate("REQP_DATE"));
				rp.setbTitle(rset.getString("BTITLE"));
				rp.setStatus(rset.getString("STATUS"));;
				
				list.add(rp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	
	//선택 검수 거절 조회
	public ReqProduct reqRejectSelect(Connection con, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReqProduct rp = null;
		
		String query = prop.getProperty("reqRejectSelect");
		try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(status));
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					rp = new ReqProduct();
					
					rp.setUpNo(rset.getInt("REQP_NO"));
					rp.setProductName(rset.getString("CTG_NAME"));
					rp.setbWriter(rset.getString("USER_NAME"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return rp;
	}
	
	//선택 검수 승인 조회
	public ReqProduct reqConfirmSelect(Connection con, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReqProduct rp = null;
		
		String query = prop.getProperty("reqConfirmSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(status));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rp = new ReqProduct();
				
				rp.setUpNo(rset.getInt("REQP_NO"));
				rp.setProductName(rset.getString("CTG_NAME"));
				rp.setbWriter(rset.getString("USER_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return rp;
	}
	
	//ajax페이징 처리 개수
	public int getReqFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		String bType = "등록";
		
		//조건에 따른 query문 가져오기
		HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		if(condition.get("okStatus").equals("0") &&
				detailsContent.get("details").equals("0") &&
				condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회");
		} else {
			//조건 검색
			//승인상태가 전체가 아닐때
			if(!(condition.get("okStatus").equals("0"))) {
				queryArr.add(" PS.SID = ? ");
				bindVal.add(condition.get("okStatus"));
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				
				//상세조건 별 쿼리문
				if(detailsContent.get("details").equals("reqNo")) {
					queryArr.add(" R.REQP_NO = ? ");
				} else if(detailsContent.get("details").equals("name")) {
					queryArr.add(" M.USER_NAME = ? ");
				} else if(detailsContent.get("details").equals("reqName")) {
					queryArr.add(" PC.CTG_NAME = ? ");
				}
				bindVal.add(detailsContent.get("filterContent"));
			}
			//날짜값 있을 경우
			if(!(condition).get("startD").equals("")) {
				//날짜 2개 비교 인덱스 맞추기
				queryArr.add(" P.PSTART_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startD"));
				bindVal.add(condition.get("endD"));
				System.out.println(condition.get("startD"));
			}
		}
		query = prop.getProperty("reqFilterCount");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더하기
			for(int i = 0; i < queryArr.size(); i++) {
				if(i==queryArr.size() - 1) {
					query += queryArr.get(i) + ")";
				} else {
					query += queryArr.get(i) + " AND ";
				}
			}
		} else {
			//전제조회 쿼리
			query += queryArr.get(0) + ")";
		}
		//등록 요청 상태, 요청번호 순으로 내림차순
		query += " ORDER BY STATUS DESC, REQP_NO";
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bType);
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+2, bindVal.get(i));
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}
	
	//요청 승인 업무
	public int reqProductSize(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("reqProductSize");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return result;
	}
	
	//등록 승인 업무
	public int confirmSize(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("confirmSize");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return result;
	}
	
	//등록 물품 갯수
	public int adProductSize(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("adProductSize");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return result;
	}
}
