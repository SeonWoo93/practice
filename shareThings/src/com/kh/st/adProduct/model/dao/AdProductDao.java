package com.kh.st.adProduct.model.dao;

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
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.adProduct.model.vo.AdProduct;
import com.kh.st.adProduct.model.vo.EndProduct;
import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.common.PageInfo;
import com.kh.st.member.model.vo.Member;
import com.kh.st.product.model.vo.Product;
import com.kh.st.request.model.dao.ReqDao;

public class AdProductDao {
	private Properties prop = new Properties();

	public AdProductDao() {
		String fileName = ReqDao
							.class
							.getResource("/sql/product/product-query.properties")
							.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//물품 등록 처리
	public int adProductOk(Connection con, String[] num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adProductOk");
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
	
	//페이징 처리 물품 조회
	public ArrayList<AdProduct> adProductList(Connection con, PageInfo pi) {
		//등록번호, 등록자, 물품명, 등록기간, 상태
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdProduct ap = null;
		ArrayList<AdProduct> list = null;
		
		String query = prop.getProperty("adProductList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AdProduct>();
			
			while(rset.next()) {
				ap = new AdProduct();
				//등록번호, 등록자, 모델명, 카테고리, 등록기간, 상태(렌탈중/창고적재)
				ap.setPno(rset.getInt("PNO"));
				ap.setpWriter(rset.getString("USER_NAME"));
				ap.setModel(rset.getString("MODEL"));
				ap.setCtgName(rset.getString("CTG_NAME"));
				ap.setPstartDate(rset.getDate("PSTART_DATE"));
				ap.setPendDate(rset.getDate("PEND_DATE"));
				ap.setStatus(rset.getString("STATUS"));
				
				list.add(ap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//최종 등록 물품 상세 보기
	public HashMap<String, Object> adProductDetail(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Member m = null;
		Product reqProduct = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("adProductDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
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
				reqProduct.setPno(rset.getInt("PNO"));
				
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
				hmap.put("status", rset.getString("STATUS"));
				
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
	
	//최종 등록 물품 초기 검수사진, 내용
	public HashMap<String, Object> adProductDetailImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("adProductImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			hmap = new HashMap<String, Object>();
			
			while(rset.next()) {
				at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				
				hmap.put("condition", rset.getString("CONDITION"));
				hmap.put("chkContent", rset.getString("CHK_CONTENT"));
				
				list.add(at);
			}
			hmap.put("confirmList", list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}
	
	//배송 조회
	public ArrayList<HashMap<String, Object>> shipList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("shipList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
		
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("apNo", rset.getInt("REQP_NO"));
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("deliveryCompany", rset.getString("DELIVERY_COMPANY"));
				hmap.put("invoice", rset.getString("INVOICE"));
				hmap.put("shippingD", rset.getDate("SHIPPING_DATE"));
				hmap.put("reqD", rset.getDate("REQP_DATE"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("dAddress", rset.getString("DL_ADDRESS"));
				hmap.put("dType", rset.getString("INOUT"));
				
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
	
	//만료 물품 조회
	public ArrayList<EndProduct> endProductList(Connection con, PageInfo pi) {
		//물품번호, 모델명, 물품명, 등록자, 만료일, 물품 상태
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		EndProduct ep = null;
		ArrayList<EndProduct> list = null;
		
		String query = prop.getProperty("endProductList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<EndProduct>();
			
			while(rset.next()) {
				//물품번호, 모델명, 물품명, 등록자, 만료일, 물품 상태
				ep = new EndProduct();
				Date sDate = rset.getDate("PEND_DATE");
				Date sysDate = rset.getDate("SYSDATE");
				
				//시간차이를 하루단위로
				long diff = sDate.getTime() - sysDate.getTime();
				long dDay = diff/ (24 * 60 * 60 * 1000);
				
				ep.setPno(rset.getInt("PNO"));	//물풀번호
				ep.setModel(rset.getString("MODEL"));	//모델명
				ep.setpName(rset.getString("CTG_NAME"));	//물풀명
				ep.setUserName(rset.getString("USER_NAME"));	//유저명
				ep.setdDay(dDay);	//만료일 
				ep.setStatus(rset.getString("STATUS"));	//물품상태
			
				list.add(ep);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//선택한 반환 물품 조회
	public EndProduct endProductSelect(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		EndProduct ep = null;
		
		String query = prop.getProperty("endProductSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				ep = new EndProduct();
				
				ep = new EndProduct();
				Date sDate = rset.getDate("PEND_DATE");
				Date sysDate = rset.getDate("SYSDATE");
				
				//시간차이를 하루단위로
				long diff = sDate.getTime() - sysDate.getTime();
				long dDay = diff/ (24 * 60 * 60 * 1000);
				
				ep.setPno(rset.getInt("PNO"));	//물풀번호
				ep.setdDay(dDay);	//만료일 
				ep.setUserName(rset.getString("USER_NAME"));	//유저명
				ep.setdLocation(rset.getString("DL_ADDRESS"));	//배송지
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return ep;
	}
	
	//등록 만료 물품 반환
	public int endProductDelivery(Connection con, int pno, String dlocation, String delivery, String dNo) {
		PreparedStatement pstmt = null;
		String dType = "등록";
		String out = "출고";
		int result = 0;
		
		String query = prop.getProperty("endProductDelivery");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dNo);
			pstmt.setString(2, delivery);
			pstmt.setString(3, dType);
			pstmt.setInt(4, pno);
			pstmt.setString(5, out);
			pstmt.setInt(6, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//물품상태 업데이트(등록 반환)
	public int endProductSid(Connection con, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("endProductSid");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//ajax페이징 처리 개수
	public int getAdProductFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		//조건에 따른 query문 가져오기
		if(condition.get("category").equals("소분류") &&
				condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회");
		} else {
			//조건검색
			//카테고리 선택시
			if(!condition.get("category").equals("소분류")) {
				queryArr.add(" PC.CTG_NAME = ? ");
				bindVal.add(condition.get("category"));
			}
			//날짜값 있을경우
			if(!(condition).get("startD").equals("")) {
				//날짜 2개 비교 인덱스 맞추기
				queryArr.add(" P.PSTART_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startD"));
				bindVal.add(condition.get("endD"));
				System.out.println(condition.get("startD"));
			}
		}
		query = prop.getProperty("AdProductFilterCount");
		
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
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
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
	
	//물품 조건 검색
	public ArrayList<HashMap<String, Object>> selectAdProductFilter(Connection con, HashMap<String, Object> condition,
			PageInfo pi) {
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
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		//전체조회
		if(condition.get("category").equals("소분류") &&
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
			//조건검색
			//물품별 검색
			if(!condition.get("category").equals("소분류")) {
				queryArr.add(" PC.CTG_NAME = ? ");
				bindVal.add(condition.get("category"));
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
		
		query = prop.getProperty("selectAdProductFilter");
		
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
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}
			for(int i = 0; i < rnumVal.size(); i++) {
				pstmt.setObject(bindVal.size() + (i + 1), rnumVal.get(i));
			}
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				//물품번호, 등록자, 모델명, 물품명, 등록기간, 상태
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("pName", rset.getString("CTG_NAME"));
				hmap.put("pstartD", rset.getDate("PSTART_DATE"));
				hmap.put("pendD", rset.getDate("PEND_DATE"));
				hmap.put("status", rset.getString("STATUS"));
				
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
	
	//반환 물품 갯수
	public int endProductFilterList(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		//조건에 따른 query문 가져오기
		HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		if(detailsContent.get("details").equals("0") &&
						condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회");
		} else {
			//조건 검색
			//상세조건이 전체가 아닐때
			if(!(detailsContent.get("details").equals("0"))) {
				
				//상세조건 별 쿼리문
				if(detailsContent.get("details").equals("pno")) {
					queryArr.add(" P.PNO = ? ");
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
		
		query = prop.getProperty("endProductFilterCount");
		
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
		query += " ORDER BY STATUS, PNO";
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(listCount);
		return listCount;
	}
	
	//조건검색 반환 물품
	public ArrayList<HashMap<String, Object>> selectEndProductFilter(Connection con, HashMap<String, Object> condition,
			PageInfo pi) {
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
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		//조건에 따른 query문 가져오기
		HashMap<String, Object> detailsContent = (HashMap<String, Object>) condition.get("detailsContent");
		
		//전체조회
		if(detailsContent.get("details").equals("0") &&
				condition.get("startD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			rnumArr.add(" WHERE RNUM BETWEEN ? ");
			rnumArr.add(" AND ? ");
			rnumVal.add(startRow);
			rnumVal.add(endRow);
			System.out.println("전체조회");
		} else {
			//조건 검색
			if(!(detailsContent.get("details").equals("0"))) {
				//상세조건 별 쿼리문
				//상세조건 별 쿼리문
				if(detailsContent.get("details").equals("reqNo")) {
					queryArr.add(" P.PNO = ? ");
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
		
		query = prop.getProperty("selectEndProductFilter");
		
		if(allViewsChk == false) {
			//추가된 쿼리만큼 더하기
			for(int i = 0; i < queryArr.size(); i++) {
				if(i==queryArr.size() - 1) {
					query += queryArr.get(i);
					query += "ORDER BY PEND_DATE, PNO))";
					
				} else {
					query += queryArr.get(i) + "AND ";
				}
			}
		} else {
			//전제조회 쿼리
			query += queryArr.get(0);
			query += "ORDER BY PEND_DATE, PNO))";
		}
		for(int i = 0; i < rnumArr.size(); i++) {
			query += rnumArr.get(i);
		}
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}
			for(int i = 0; i < rnumVal.size(); i++) {
				pstmt.setObject(bindVal.size() + (i + 1), rnumVal.get(i));
			}
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				Date sDate = rset.getDate("PEND_DATE");
				Date sysDate = rset.getDate("SYSDATE");
				
				//시간차이를 하루단위로
				long diff = sDate.getTime() - sysDate.getTime();
				long dDay = diff/ (24 * 60 * 60 * 1000);
				
				//물품번호, 모델명, 물품명, 등록자, 만료날짜, 물품상태
				hmap.put("pno", rset.getInt("PNO"));
				hmap.put("model", rset.getString("MODEL"));
				hmap.put("pName", rset.getString("CTG_NAME"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("dDay", dDay);
				hmap.put("status", rset.getString("STATUS"));
				
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
}
