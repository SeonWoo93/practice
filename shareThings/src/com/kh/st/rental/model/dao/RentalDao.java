package com.kh.st.rental.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Properties;

import com.kh.st.rental.model.vo.Cart;

/**
 * @author uukk
 *
 */
public class RentalDao {
	private Properties prop = new Properties();
	
	
	public RentalDao() {
		String fileName = RentalDao.class.getResource("/sql/rental/rental-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 대여중/대여완료 리스트 조회
	public ArrayList<HashMap<String, Object>> selectRentalList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRentalList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("CTG_NAME"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);	
		}
	
		
		
		System.out.println(list);
		return list;
		
	}
	
	// 상세조건들로 대여목록조회 해쉬맵
	public ArrayList<HashMap<String, Object>> selectRentalFilter(Connection con, HashMap<String, Object> condition) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		//상세조건에 따라 query문 가져오기
		HashMap<String,Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		//전체조회
		if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0") && condition.get("sDate").equals("")) {
			//조건없이 전체 조회
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
		}else {
			//상태조건이 전체가 아닐때
			
			if(!(condition.get("rentalStatus").equals("0"))) {
				//STATUS 컬럼을 조회하게 문자열 합치기
				queryArr.add(" R.RT_SID = ? ");
				bindVal.add(condition.get("rentalStatus"));
				System.out.println(condition.get("rentalStatus"));
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				//상세조건 선택하여 컬럼명 입력
				if(detailsContent.get("details").equals("rtNo")) {
					queryArr.add(" R.RT_NO "+ " = ? ");
				} else if(detailsContent.get("details").equals("rtUserName")) {
					queryArr.add(" M.USER_NAME " + " = ? ");
				} else if(detailsContent.get("details").equals("model")) {
					queryArr.add(" PC.CTG_NAME "+" = ? ");
				} else if(detailsContent.get("details").equals("pno")) {
					queryArr.add(" P.PNO "+ " = ? ");
				}
				bindVal.add(detailsContent.get("filterContent"));
			}
			//날짜값이 있는경우
			if(!(condition.get("sDate").equals(""))) {
				//날짜 2개를 비교하기위한  인덱스 맞추기
				queryArr.add(" R.RT_REQ_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("sDate"));
				bindVal.add(condition.get("eDate"));
			}
		}
		query = prop.getProperty("selectRentalStd");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더해주기
			for(int i=0; i<queryArr.size(); i++) {
				if(i==queryArr.size()-1) {
					query += queryArr.get(i) ;
				} else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			//전체조회를 위한 쿼리 더해주기
			query += queryArr.get(0);
		}
		//대여주문번호 내림차순
		query += "ORDER BY R.RT_NO DESC";
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			
			//받아온 값으로 바인드값 보냄
			for(int i=0; i<bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}
			
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("CTG_NAME"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				list.add(hmap);
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
	






	/* 발송관리 리스트 조회  */
	public ArrayList<HashMap<String, Object>> selectShpMngList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectShpMngList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rno", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("rtReqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("address", rset.getString("DL_ADDRESS"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);	
		}
	
		
		
		System.out.println(list);
		return list;
	}

	//대여번호로 배송조회
	public ArrayList<HashMap<String, Object>> selectShpNum(Connection con, String[] status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		
		String query = prop.getProperty("selectShpNum");
		try {
			list = new ArrayList<HashMap<String,Object>>();
			for(int i = 0; i < status.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(status[i]));
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					
					hmap.put("rno", rset.getInt("RT_NO"));
					hmap.put("pno", rset.getInt("PNO"));
					hmap.put("model", rset.getString("CTG_NAME"));
					hmap.put("userId", rset.getString("USER_ID"));
					hmap.put("userName", rset.getString("USER_NAME"));
					hmap.put("rtStatus", rset.getString("STATUS"));
					
					list.add(hmap);
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
	
	

	public int updateProductStatus(Connection con,HashMap<String, Object> hmap) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePdStatus");
		
		String[] pno = (String[]) hmap.get("pno");
		try {
			for(int i=0; i < pno.length; i++) {
				pstmt = con.prepareStatement(query);
				//물품상태
				pstmt.setObject(1, hmap.get("pStatus"));
				//물품번호
				pstmt.setInt(2, Integer.parseInt(pno[i]));			
				
				result += pstmt.executeUpdate();

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		// 결과값과 맞지 않을때 0을 리턴
		if(pno.length != result) {
			result = 0;
		}
		return result;
	}

	// 송장번호 입력  
	public int insertInvcNum(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertInvcNum");
		String[] rtNo = (String[]) invoiceVal.get("rtNo");
		try {
			pstmt = con.prepareStatement(query);
			//송장번호
			pstmt.setObject(1, invoiceVal.get("invoiceNum"));
			pstmt.setObject(2, invoiceVal.get("dCom"));
			pstmt.setObject(3, rtNo[0]);
			pstmt.setObject(4, invoiceVal.get("userId"));
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/* 대여상태  바꾸기*/
	public int updateRentalStatus(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateRentalStatus");
		
		String[] rtNo = (String[])invoiceVal.get("rtNo");
		
		try {
			for(int i=0; i < rtNo.length; i++) {
				pstmt = con.prepareStatement(query);
				System.out.println(invoiceVal.get("rtStatus"));
				//대여상태 코드
				pstmt.setObject(1, invoiceVal.get("rtStatus"));	
				//물품번호
				pstmt.setObject(2, rtNo[i]);			
				
				result += pstmt.executeUpdate();
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		// 결과값과 맞지 않을때 0을 리턴
		if(rtNo.length != result) {
			result = 0;
		}
		return result;
	}
	/* 물품 상태  변경*/
	public int updatePdStatus(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePdStatus");
		
		String[] pno = (String[]) invoiceVal.get("pno");
		try {
			for(int i=0; i < pno.length; i++) {
				pstmt = con.prepareStatement(query);
				//물품 상태 코드
				pstmt.setObject(1, invoiceVal.get("pStatus"));	
				//물품번호
				pstmt.setObject(2, pno[i]);			
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		// 결과값과 맞지 않을때 0을 리턴
		if(pno.length != result) {
			result = 0;
		}
		return result;
	}

	/* 송장번호 삭제  */
	public int deleteInvcNum(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteInvcNum");
		String[] rtNo = (String[]) invoiceVal.get("rtNo");
		System.out.println(rtNo.length);
		try {
			for(int i=0; i < rtNo.length; i++) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setObject(1, rtNo[i]);
				
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		// 결과값과 맞지 않을때 0을 리턴
		if(rtNo.length != result) {
			result = 0;
		}
		
		return result;
	}

	/* 대여 취소사유 입력 */
	public int updateRentalRemark(Connection con, HashMap<String, Object> hmap) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateRentalRemark");
		String[] rtNo = (String[]) hmap.get("rtNo");
		try {
			for(int i=0; i < rtNo.length; i++) {
				pstmt = con.prepareStatement(query);
				
				//취소사유 , 대여번호 순서
				pstmt.setObject(1, hmap.get("textResult"));
				pstmt.setInt(2, Integer.parseInt(rtNo[i]));			
				
				result = pstmt.executeUpdate();
				
				//한개라도 값이 잘못 됐을때 리턴
				if(result == 0) {
					break;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		// 결과값과 맞지 않을때 0을 리턴
		if(rtNo.length != result) {
			result = 0;
		}
		return result;
	}

	//배송조회 리스트
	public ArrayList<HashMap<String, Object>> selectSendList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectSendList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("rtNo", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("dCom", rset.getString("delivery_company"));
				hmap.put("invc", rset.getString("invoice"));
				hmap.put("spDate", rset.getDate("SHIPPING_DATE"));
				hmap.put("reqDate", rset.getDate("RT_REQ_DATE"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("address", rset.getString("DL_ADDRESS"));
				hmap.put("inOut", rset.getString("INOUT"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);	
		}
	
		
		
		System.out.println(list);
		return list;
	}

	//수거 조회
	public ArrayList<HashMap<String, Object>> selectReturnPdMngList(Connection con) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReturnPdMngList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
		        Calendar sysDate = new GregorianCalendar(Locale.KOREA);
		        java.util.Date sDate = sysDate.getTime();
		        Date endDate = rset.getDate("RT_END_DATE");
		         
		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		        long diff = endDate.getTime() - sDate.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);
		        
		        System.out.println(diffDays);
				
				hmap.put("rtNo", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("rtStDate", rset.getDate("RT_ST_DATE"));
				hmap.put("rtEndDate", rset.getDate("RT_END_DATE"));
				hmap.put("endDay", diffDays);
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);	
		}
	
		
		
		System.out.println(list);
		return list;
	}

	//반품 송장 입력
	public int insertReturnInvcNum(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReturnInvcNum");
		String[] rtNo = (String[]) invoiceVal.get("rtNo");
		try {
			pstmt = con.prepareStatement(query);
			//송장번호
			pstmt.setObject(1, invoiceVal.get("invoiceNum"));
			pstmt.setObject(2, invoiceVal.get("dCom"));
			pstmt.setObject(3, rtNo[0]);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//반품 송장 취소 상태 
	public int deleteReturnInvcNum(Connection con, HashMap<String, Object> invoiceVal) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReturnInvcNum");
		String[] rtNo = (String[]) invoiceVal.get("rtNo");
		System.out.println(rtNo.length);
		try {
			for(int i=0; i < rtNo.length; i++) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setObject(1, rtNo[i]);
				
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		// 결과값과 맞지 않을때 0을 리턴
		if(rtNo.length != result) {
			result = 0;
		}
		
		return result;
	}
	//수거관리페이지 조회 필터
	public ArrayList<HashMap<String, Object>> selectRtPdFilter(Connection con, HashMap<String, Object> condition) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		//상세조건에 따라 query문 가져오기
		HashMap<String,Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		//전체조회
		if(condition.get("rentalStatus").equals("0") && detailsContent.get("details").equals("0")) {
			//조건없이 전체 조회
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
		}else {
			//상태조건이 전체가 아닐때
			
			if(!(condition.get("rentalStatus").equals("0"))) {
				//STATUS 컬럼을 조회하게 문자열 합치기
				queryArr.add(" R.RT_SID = ? ");
				bindVal.add(condition.get("rentalStatus"));
				System.out.println(condition.get("rentalStatus"));
			}
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				//상세조건 선택하여 컬럼명 입력
				if(detailsContent.get("details").equals("rtNo")) {
					queryArr.add(" R.RT_NO "+ " = ? ");
				} else if(detailsContent.get("details").equals("rtUserName")) {
					queryArr.add(" M.USER_NAME " + " = ? ");
				} else if(detailsContent.get("details").equals("pno")) {
					queryArr.add(" P.PNO "+ " = ? ");
				}
				bindVal.add(detailsContent.get("filterContent"));
			}
		}
		query = prop.getProperty("selectRtPdFilterStd");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더해주기
			for(int i=0; i<queryArr.size(); i++) {
				if(i==queryArr.size()-1) {
					query += queryArr.get(i) ;
				} else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			//전체조회를 위한 쿼리 더해주기
			query += queryArr.get(0);
		}
		//대여주문번호 내림차순 + 조건
		query += "AND RS.RT_SID IN ('RTS5','RTS6','RTS7') ORDER BY R.RT_NO DESC";
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			
			//받아온 값으로 바인드값 보냄
			for(int i=0; i<bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}
			
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
		        Date stDate = rset.getDate("RT_ST_DATE");
		        Date endDate = rset.getDate("RT_END_DATE");
		         
		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		        long diff = endDate.getTime() - stDate.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);
		        
		        System.out.println(diffDays);
				
				hmap.put("rtNo", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("rtStDate", rset.getDate("RT_ST_DATE"));
				hmap.put("rtEndDate", rset.getDate("RT_END_DATE"));
				hmap.put("endDay", diffDays);
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				list.add(hmap);
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
	
	public ArrayList<HashMap<String, Object>> selectRtPdDayFilter(Connection con, int selectDay) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = null;
		
		query = prop.getProperty("selectRtPdDayFilter");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//받아온 값으로 바인드값 보냄
			pstmt.setInt(1, selectDay);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
		        Date stDate = rset.getDate("RT_ST_DATE");
		        Calendar sysDate = new GregorianCalendar(Locale.KOREA);
		        java.util.Date sDate = sysDate.getTime();
		        Date endDate = rset.getDate("RT_END_DATE");
		         
		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		        long diff = endDate.getTime() - sDate.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);
				
				hmap.put("rtNo", rset.getInt("RT_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("rtStDate", rset.getDate("RT_ST_DATE"));
				hmap.put("rtEndDate", rset.getDate("RT_END_DATE"));
				hmap.put("endDay", diffDays);
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("rtStatus", rset.getString("STATUS"));
				
				list.add(hmap);
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
	public int selectApprovalSize(Connection con, ArrayList<String> rentalStatus , int index) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int approvalSize = 0;
		
		String query = null;
		
		query = prop.getProperty("selectApprovalSize");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//받아온 값으로 바인드값 보냄
			pstmt.setString(1, rentalStatus.get(index));
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				approvalSize = rset.getInt("COUNT(*)");
			}
			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);	
		}
		System.out.println(approvalSize);
		return approvalSize;
	}
 
	//민지
	   public int insertCart(Connection con, Cart newCart) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("insertCart");
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, newCart.getPno());
	         pstmt.setDate(2, newCart.getRtStartDate());
	         pstmt.setDate(3, newCart.getRtEndDate());
	         pstmt.setInt(4, newCart.getUno());
	         
	         result = pstmt.executeUpdate();
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return result;
	   }

	   //렌탈 신청 메소드
	public int reqRental(Connection con, Cart pno, int uno) {
	    PreparedStatement pstmt = null;
	    int result = 0;
	    String query = prop.getProperty("reqRental");
	    
	    try {
	    	pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno.getPno());
			pstmt.setInt(2, uno);
			pstmt.setDate(3, pno.getRtStartDate());
			pstmt.setDate(4, pno.getRtEndDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
	    
		return result;
	}
	   
	
	
	
	
	
}