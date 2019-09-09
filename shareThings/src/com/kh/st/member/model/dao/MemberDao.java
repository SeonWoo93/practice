package com.kh.st.member.model.dao;

import static com.kh.st.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.Mlevel;
import com.kh.st.member.model.vo.Payback;
import com.kh.st.member.model.vo.Refund;
import com.kh.st.member.model.vo.Report;
import com.kh.st.common.PageInfo;

public class MemberDao {
	private Properties prop = new Properties();

	//properties 연결
	public MemberDao() {
		String fileName = MemberDao.class
				.getResource("/sql/member/member-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//---------------------------------------------- 도연 ----------------------------------------------
	//전체 회원 수 리턴
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
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

	//전체회원 조회용
	public ArrayList<Member> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;

		String query = prop.getProperty("selectList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setUno(rset.getInt("UNO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setProfits(rset.getInt("PROFITS"));
				m.setTotalPoint(rset.getInt("TOTAL_POINT"));
				m.setPenaltyPoint(rset.getInt("PENALTY_POINT"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				System.out.println(rset.getString("STATUS"));
				if(rset.getString("STATUS").equals("Y")) {
					m.setStatus("가입");
				}else {
					m.setStatus("탈퇴");
				}

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	//전체 회원등급 리턴용
	public ArrayList<Mlevel> selectMlevelList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Mlevel> list = null;

		String query = prop.getProperty("selectMlevelList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Mlevel>();

			while(rset.next()) {
				Mlevel ml = new Mlevel();

				ml.setLevelCode(rset.getString("LEVEL_CODE"));
				ml.setLevelName(rset.getString("LEVEL_NAME"));
				ml.setPerPoint(rset.getInt("PER_POINT"));
				ml.setLevelStd(rset.getInt("LEVEL_STD"));

				list.add(ml);				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}

		return list;
	}

	//회원등급 수정용
	public int updateMlevel(Connection con, ArrayList<Mlevel> list) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMlevel");

		try {
			for(int i = 0; i < list.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, list.get(i).getLevelName()) ;
				pstmt.setInt(2, list.get(i).getLevelStd());
				pstmt.setInt(3, list.get(i).getPerPoint());
				pstmt.setString(4, list.get(i).getLevelCode());

				result += pstmt.executeUpdate();
			}

			if(result == list.size()) {
				result = 1;
			}else{
				result = 0;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//신고이력 전체 카운트용
	public int getReportListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("reportListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
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

	//신고이력 전체 조회용
	public ArrayList<Report> selectReportList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Report> list = null;

		String query = prop.getProperty("selectReportList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Report>();

			while(rset.next()) {
				Report r = new Report();

				r.setReportNo(rset.getInt("REPORT_NO"));
				r.setTargetUser(rset.getString("USER1"));
				r.setReportName(rset.getString("REPORT_NAME"));
				r.setReportContent(rset.getString("REPORT_CONTENT"));
				r.setReportUser(rset.getString("USER2"));
				r.setReportDate(rset.getDate("REPORT_DATE"));
				r.setComplateDate(rset.getDate("COMPLETE_DATE"));
				r.setSumPenalty(rset.getInt("PENALTY_POINT"));
				r.setReject(rset.getString("REJECT"));
				r.setPenalty(rset.getInt("PENALTY"));


				if(rset.getString("REPORT_RESULT") == null) {
					r.setReportResult(rset.getString("REPORT_RESULT"));
				}else if(rset.getString("REPORT_RESULT").equals("Y")) {
					r.setReportResult("적합");
				}else {
					r.setReportResult("부적합");
				}



				if(rset.getString("REPORT_RESULT") != null) {
					r.setStatus("처리완료");
				}else{
					r.setStatus("처리대기");
				}

				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	//수익금 환급이력 전체 카운트용
	public int getPaybackListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("paybackListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
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

	//수익금 환급 전체 조회용
	public ArrayList<Payback> selectPaybackList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payback> list = null;

		String query = prop.getProperty("selectPaybackList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Payback>();

			while(rset.next()) {
				Payback p = new Payback();

				p.setPbNo(rset.getInt("PB_NO"));
				p.setUserId(rset.getString("USER_ID"));
				p.setUserName(rset.getString("USER_NAME"));
				p.setBank(rset.getString("BANK"));
				p.setAccount(rset.getString("ACCOUNT"));
				p.setAccName(rset.getString("ACCNAME"));
				p.setReqDate(rset.getDate("REQ_DATE"));
				p.setPbAmount(rset.getInt("PB_AMOUNT"));
				p.setPbDate(rset.getDate("PB_DATE"));

				if(rset.getString("PB_STATUS").equals("N")) {
					p.setPbStatus("환급대기");
				}else {
					p.setPbStatus("환급완료");
				}

				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	//회원환불 전체 카운트용
	public int getRefundListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("refundListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
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

	//회원환불 전체 리스트 조회용
	public ArrayList<Refund> selectRefundList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Refund> list = null;

		String query = prop.getProperty("selectRefundList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Refund>();
			
			
			while(rset.next()) {
				Refund r = new Refund();
				
				int total = rset.getInt("TOTAL_DATE");
				int left = total - rset.getInt("LEFT_DATE");
				int price = rset.getInt("PRICE") - rset.getInt("DEPOSIT");
				
				r.setRfNo(rset.getInt("RF_NO"));
				r.setUserId(rset.getString("USER_ID"));
				r.setVerifyCode(rset.getString("VERIFY_CODE"));
				r.setRfReason(rset.getString("RF_REASON"));
				
				if(rset.getString("RT_SID").equals("RTS8")) {
					r.setRfType("보증급 환급");
				}else if(rset.getString("RT_SID").equals("RTS10")) {
					r.setRfType("예약취소");
				}else {
					r.setRfType("중간반납");
				}
				
				
				if(rset.getString("RT_SID").equals("RTS12")) {
					r.setPrice((int)(Math.floor((price/total * left) * 0.1)) * 10 + rset.getInt("DEPOSIT"));
				}else {
					if(rset.getString("RT_SID").equals("RTS10")) {
						r.setPrice(rset.getInt("PRICE"));
					}else {
						r.setPrice(rset.getInt("DEPOSIT"));
					}
				}
				
				r.setReqDate(rset.getDate("REQ_DATE"));
				
				r.setRfDate(rset.getDate("RF_DATE"));
				
				if(rset.getString("RF_STATUS").equals("N")) {
					r.setRfStatus("처리대기");
				}else {
					r.setRfStatus("처리완료");
				}

				list.add(r);
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

	//신고 적합 처리용
	public int reportOk(Connection con, String[] reportsNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("reportOk");

		try {
			for(int i = 0; i < reportsNo.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(reportsNo[i]));

				result += pstmt.executeUpdate();
			}

			if(result == reportsNo.length) {
				result = 1;
			}else {
				result = 0;
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;

	}

	//신고이력 상세보기용
	public ArrayList<HashMap<String, Object>> selectOneReport(Connection con, int reportNo) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectOneReport");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String,Object>>();

			if(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("reportNo", rset.getInt("REPORT_NO"));
				hmap.put("targetId", rset.getString("USER_ID1"));
				hmap.put("targetName", rset.getString("USER_NAME1"));
				hmap.put("repId", rset.getString("USER_ID2"));
				hmap.put("repName", rset.getString("USER_NAME2"));
				hmap.put("reportName", rset.getString("REPORT_NAME"));
				hmap.put("reportContent", rset.getString("REPORT_CONTENT"));
				hmap.put("reportDate", rset.getDate("REPORT_DATE"));
				hmap.put("completeDate", rset.getDate("COMPLETE_DATE"));
				hmap.put("reject", rset.getString("REJECT"));
				hmap.put("penalty", rset.getInt("PENALTY"));
				hmap.put("totalPenalty", rset.getInt("PENALTY_POINT"));

				if(rset.getString("REPORT_RESULT") == null) {
					hmap.put("reportResult", rset.getString("REPORT_RESULT"));
				}else if(rset.getString("REPORT_RESULT").equals("Y")) {
					hmap.put("reportResult", "적합");
				}else {
					hmap.put("reportResult", "부적합");
				}


				if(rset.getString("REPORT_RESULT") != null) {
					hmap.put("status", "처리완료");
				}else{
					hmap.put("status", "처리대기");
				}

				list.add(hmap);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//신고 부적합 처리용
	public int updateReportNo(Connection con, String[] num, String inputReject) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("reportNo");

		try {
			for(int i = 0; i < num.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, inputReject);
				pstmt.setInt(2, Integer.parseInt(num[i]));

				result += pstmt.executeUpdate();
			}

			if(result == num.length) {
				result = 1;
			}else {
				result = 0;
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//회원 상세보기용
	public HashMap<String, Object> selectOneMember(Connection con, int no) {
		PreparedStatement pstmt = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectOneMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			pstmt.setInt(2, no);
			pstmt.setInt(3, no);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("userNo", rset.getInt("UNO"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				if(rset.getString("STATUS").equals("Y")) {
					hmap.put("status","가입");
				}else {
					hmap.put("status","탈퇴");
				}
				hmap.put("level", rset.getString("LEVEL_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("subPhone", rset.getString("SUB_PHONE"));
				hmap.put("birth", rset.getDate("BIRTH_DATE"));
				hmap.put("gender", rset.getString("GENDER"));
				hmap.put("address", rset.getString("ADDRESS"));
				hmap.put("email", rset.getString("EMAIL"));
				hmap.put("enrollDate", rset.getDate("ENROLL_DATE"));
				hmap.put("modifyDate", rset.getDate("MODIFY_DATE"));
				hmap.put("totalPoint", rset.getInt("TOTAL_POINT"));
				hmap.put("penaltyPoint", rset.getInt("PENALTY_POINT"));
				hmap.put("profits", rset.getInt("PROFITS"));
				hmap.put("option", rset.getString("OPTION_CHECK"));
				hmap.put("social", rset.getString("SOCIAL_LINK"));
				hmap.put("verif", rset.getString("EMAIL_VERIF"));
				if(rset.getString("SOCIAL_LINK") == null) {
					hmap.put("social", "ST");
				}else if(rset.getString("SOCIAL_LINK").equals("K")) {
					hmap.put("social", "카카오");
				}else if(rset.getString("SOCIAL_LINK").equals("G")) {
					hmap.put("social", "구글");
				}else {
					hmap.put("social", "네이버");
				}
				hmap.put("input", rset.getInt("INPUT"));
				hmap.put("output", rset.getInt("OUTPUT"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return hmap;
	}

	//수익금 환급 처리완료용
	public int updatePaybackOk(Connection con, String[] nums) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("paybackOk");

		try {
			for(int i = 0; i < nums.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(nums[i]));

				result += pstmt.executeUpdate();
			}

			if(result == nums.length) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//수익금 환급 후 유저 수익금 수정용
	public int updateMemberPofits(Connection con, String[] nums) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProfits");
		
		try {
			for(int i = 0; i < nums.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(nums[i]));
				pstmt.setInt(2, Integer.parseInt(nums[i]));
				pstmt.setInt(3, Integer.parseInt(nums[i]));

				result += pstmt.executeUpdate();
			}

			if(result == nums.length) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//환불 처리완료용
	public int updateRefundOk(Connection con, String[] nums) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("refundOk");

		try {
			for(int i = 0; i < nums.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(nums[i]));

				result += pstmt.executeUpdate();
			}

			if(result == nums.length) {
				result = 1;
			}else {
				result = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//회원 필터링 카운트
	public int getMemberFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		int listCount = 0;
		
		if(condition.get("status").equals("0") && condition.get("startDate").equals("")
				&& condition.get("userId").equals("") && condition.get("userName").equals("")
				&& condition.get("userLv").equals("0")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
		}else {

			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}

			if(!(condition.get("userName").equals(""))) {
				queryArr.add(" USER_NAME LIKE ? ");
				bindVal.add("%" + condition.get("userName") + "%");
			}

			if(!(condition.get("userLv").equals("0"))) {
				queryArr.add(" MEMBER_LEVEL = ? ");
				bindVal.add(condition.get("userLv"));
			}

			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" STATUS = ? ");
				bindVal.add(condition.get("status"));
			}

			if(!(condition.get("startDate").equals(""))) {
				queryArr.add(" ENROLL_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startDate"));
				bindVal.add(condition.get("endDate"));
			}

		}

		query = prop.getProperty("memberFilterCount");

		if(allViewsChk ==false) {
			for(int i = 0; i < queryArr.size(); i++) {
				if(i == queryArr.size()-1) {
					query += queryArr.get(i);
				}else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			query += queryArr.get(0);
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

	//회원정보 필터링 처리용
	public ArrayList<HashMap<String, Object>> selectMemberFilter(Connection con, HashMap<String, Object> condition, PageInfo pi) {

		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;

		if(condition.get("status").equals("0") && condition.get("startDate").equals("")
				&& condition.get("userId").equals("") && condition.get("userName").equals("")
				&& condition.get("userLv").equals("0")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
		}else {

			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}

			if(!(condition.get("userName").equals(""))) {
				queryArr.add(" USER_NAME LIKE ? ");
				bindVal.add("%" + condition.get("userName") + "%");
			}

			if(!(condition.get("userLv").equals("0"))) {
				queryArr.add(" MEMBER_LEVEL = ? ");
				bindVal.add(condition.get("userLv"));
			}

			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" STATUS = ? ");
				bindVal.add(condition.get("status"));
			}

			if(!(condition.get("startDate").equals(""))) {
				queryArr.add(" ENROLL_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startDate"));
				bindVal.add(condition.get("endDate"));
			}

			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
		}

		query = prop.getProperty("memberFilter");

			for(int i = 0; i < queryArr.size(); i++) {
				if(i == queryArr.size()-1) {
					query += queryArr.get(i);
				}else {
					query += queryArr.get(i) + " AND ";
				}
			}

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}

			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("uno", rset.getInt("UNO"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("address", rset.getString("ADDRESS"));
				hmap.put("profits", rset.getInt("PROFITS"));
				hmap.put("totalPoint", rset.getInt("TOTAL_POINT"));
				hmap.put("penaltyPoint", rset.getInt("PENALTY_POINT"));
				hmap.put("enrollDate", rset.getDate("ENROLL_DATE"));
				if(rset.getString("STATUS").equals("Y")) {
					hmap.put("status", "가입");
				}else {
					hmap.put("status", "탈퇴");
				}

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
	
	//신고 조회 필터링 카운트용
	public int getReportFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		if(condition.get("userId").equals("") && condition.get("reportName").equals("0") 
				&& condition.get("reportResult").equals("0") && condition.get("status").equals("0")
				&& condition.get("startReD").equals("") && condition.get("startRsD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회");
		}else {

			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER1 LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}

			if(!(condition.get("reportName").equals("0"))) {
				queryArr.add(" REPORT_NAME = ? ");
				bindVal.add(condition.get("reportName"));
			}

			if(!(condition.get("reportResult").equals("0"))) {
				queryArr.add(" REPORT_RESULT = ? ");
				bindVal.add(condition.get("reportResult"));
			}

			if(!(condition.get("status").equals("0"))) {
				if(condition.get("status").equals("Y")) {
					queryArr.add(" REPORT_RESULT IS NOT NULL ");
				}else{
					queryArr.add(" REPORT_RESULT IS NULL ");
				}
			}

			if(!(condition.get("startReD").equals(""))) {
				queryArr.add(" REPORT_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReD"));
				bindVal.add(condition.get("endReD"));
			}

			if(!(condition.get("startRsD").equals(""))) {
				queryArr.add(" COMPLETE_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startRsD"));
				bindVal.add(condition.get("endRsD"));
			}

		}
		
		query = prop.getProperty("reportFilterCount");

		if(allViewsChk ==false) {
			for(int i = 0; i < queryArr.size(); i++) {
				if(i == queryArr.size()-1) {
					query += queryArr.get(i);
				}else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			query += queryArr.get(0);
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

	//신고 조회 필터링용
	public ArrayList<HashMap<String, Object>> selectReportFilter(Connection con, HashMap<String, Object> condition, PageInfo pi) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;

		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		if(condition.get("userId").equals("") && condition.get("reportName").equals("0") 
				&& condition.get("reportResult").equals("0") && condition.get("status").equals("0")
				&& condition.get("startReD").equals("") && condition.get("startRsD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
		}else {

			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER1 LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}

			if(!(condition.get("reportName").equals("0"))) {
				queryArr.add(" REPORT_NAME = ? ");
				bindVal.add(condition.get("reportName"));
			}

			if(!(condition.get("reportResult").equals("0"))) {
				queryArr.add(" REPORT_RESULT = ? ");
				bindVal.add(condition.get("reportResult"));
			}

			if(!(condition.get("status").equals("0"))) {
				if(condition.get("status").equals("Y")) {
					queryArr.add(" REPORT_RESULT IS NOT NULL ");
				}else{
					queryArr.add(" REPORT_RESULT IS NULL ");
				}
			}

			if(!(condition.get("startReD").equals(""))) {
				queryArr.add(" REPORT_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReD"));
				bindVal.add(condition.get("endReD"));
			}

			if(!(condition.get("startRsD").equals(""))) {
				queryArr.add(" COMPLETE_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startRsD"));
				bindVal.add(condition.get("endRsD"));
			}
			
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);

		}
		
		query = prop.getProperty("reportFilter");

		
		for(int i = 0; i < queryArr.size(); i++) {
			if(i == queryArr.size()-1) {
				query += queryArr.get(i);
			}else {
				query += queryArr.get(i) + " AND ";
			}
		}

		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}

			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();

				hmap.put("reportNo", rset.getInt("REPORT_NO"));
				hmap.put("user1", rset.getString("USER1"));
				hmap.put("reportName", rset.getString("REPORT_NAME"));
				hmap.put("reportContent", rset.getString("REPORT_CONTENT"));
				hmap.put("user2", rset.getString("USER2"));
				hmap.put("reportDate", rset.getDate("REPORT_DATE"));
				hmap.put("completeDate", rset.getDate("COMPLETE_DATE"));
				hmap.put("penalty", rset.getInt("PENALTY"));

				if(rset.getString("REPORT_RESULT") == null) {
					hmap.put("reportResult", rset.getString("REPORT_RESULT"));
				}else if(rset.getString("REPORT_RESULT").equals("Y")) {
					hmap.put("reportResult", "적합");
				}else {
					hmap.put("reportResult", "부적합");
				}

				if(rset.getString("REPORT_RESULT") != null) {
					hmap.put("status", "처리완료");
				}else{
					hmap.put("status", "처리대기");
				}

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
	
	//수익금 환급 필터링 카운트용
	public int getPaybackFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		if(condition.get("userId").equals("") && condition.get("status").equals("0")
				&& condition.get("startM").equals("") && condition.get("startReq").equals("")
				&& condition.get("startPb").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회");
		}else {
			
			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}
			
			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" PB_STATUS = ? ");
				bindVal.add(condition.get("status"));
			}
			
			if(!(condition.get("startM").equals(""))) {
				queryArr.add(" PB_AMOUNT BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startM"));
				bindVal.add(condition.get("endM"));
			}
			
			if(!(condition.get("startReq").equals(""))) {
				queryArr.add(" REQ_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReq"));
				bindVal.add(condition.get("endReq"));
			}
			
			if(!(condition.get("startPb").equals(""))) {
				queryArr.add(" PB_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startPb"));
				bindVal.add(condition.get("endPb"));
			}
			
		}
		
		query = prop.getProperty("paybackFilterCount");

		if(allViewsChk ==false) {
			for(int i = 0; i < queryArr.size(); i++) {
				if(i == queryArr.size()-1) {
					query += queryArr.get(i);
				}else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			query += queryArr.get(0);
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
	
	//수익금 환급 조회 필터링용
	public ArrayList<HashMap<String, Object>> selectPaybackFilter(Connection con, HashMap<String, Object> condition, PageInfo pi) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		if(condition.get("userId").equals("") && condition.get("status").equals("0")
				&& condition.get("startM").equals("") && condition.get("startReq").equals("")
				&& condition.get("startPb").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
		}else {
			
			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}
			
			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" PB_STATUS = ? ");
				bindVal.add(condition.get("status"));
			}
			
			if(!(condition.get("startM").equals(""))) {
				queryArr.add(" PB_AMOUNT BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startM"));
				bindVal.add(condition.get("endM"));
			}
			
			if(!(condition.get("startReq").equals(""))) {
				queryArr.add(" REQ_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReq"));
				bindVal.add(condition.get("endReq"));
			}
			
			if(!(condition.get("startPb").equals(""))) {
				queryArr.add(" PB_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startPb"));
				bindVal.add(condition.get("endPb"));
			}
			
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
			
		}
		
		query = prop.getProperty("paybackFilter");

		for(int i = 0; i < queryArr.size(); i++) {
			if(i == queryArr.size()-1) {
				query += queryArr.get(i);
			}else {
				query += queryArr.get(i) + " AND ";
			}
		}
		
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}

			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();

			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("pbNo", rset.getInt("PB_NO"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("account", rset.getString("ACCOUNT"));
				hmap.put("bank", rset.getString("BANK"));
				hmap.put("accName", rset.getString("ACCNAME"));
				hmap.put("reqDate", rset.getDate("REQ_DATE"));
				hmap.put("pbAmount", rset.getInt("PB_AMOUNT"));
				hmap.put("pbDate", rset.getDate("PB_DATE"));

				if(rset.getString("PB_STATUS").equals("N")) {
					hmap.put("status", "환급대기");
				}else {
					hmap.put("status", "환급완료");
				}

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
	
	public int getRefundFilterCount(Connection con, HashMap<String, Object> condition) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		if(condition.get("userId").equals("") && condition.get("type").equals("0")
				&& condition.get("status").equals("0") && condition.get("startReqD").equals("")
				&& condition.get("startRfD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회  ");
		}else {
			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}
			
			if(!(condition.get("type").equals("0"))) {
				queryArr.add(" RF_TYPE = ? ");
				bindVal.add(condition.get("status"));
			}
			
			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" RF_STATUS = ? ");
				bindVal.add(condition.get("status"));
			}
			
			if(!(condition.get("startReqD").equals(""))) {
				queryArr.add(" REQ_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReqD"));
				bindVal.add(condition.get("endReqD"));
			}
			
			if(!(condition.get("startRfD").equals(""))) {
				queryArr.add(" RF_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startRfD"));
				bindVal.add(condition.get("endRfD"));
			}
			
		}
		
		query = prop.getProperty("refundFilterCount");

		if(allViewsChk ==false) {
			for(int i = 0; i < queryArr.size(); i++) {
				if(i == queryArr.size()-1) {
					query += queryArr.get(i);
				}else {
					query += queryArr.get(i) + " AND ";
				}
			}
		}else {
			query += queryArr.get(0);
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
	
	public ArrayList<HashMap<String, Object>> selectRefundFilter(Connection con, HashMap<String, Object> condition, PageInfo pi) {
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<String> queryArr = new ArrayList<String>();
		ArrayList<Object> bindVal = new ArrayList<Object>();
		String query = null;
		boolean allViewsChk = false;
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		if(condition.get("userId").equals("") && condition.get("type").equals("0")
				&& condition.get("status").equals("0") && condition.get("startReqD").equals("")
				&& condition.get("startRfD").equals("")) {
			allViewsChk = true;
			queryArr.add(" 1 = ? ");
			bindVal.add("1");
			System.out.println("전체조회  ");
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
			
		}else {
			if(!(condition.get("userId").equals(""))) {
				queryArr.add(" USER_ID LIKE ? ");
				bindVal.add("%" + condition.get("userId") + "%");
			}
			
			if(!(condition.get("type").equals("0"))) {
				queryArr.add(" RF_TYPE = ? ");
				bindVal.add(condition.get("type"));
			}
			
			if(!(condition.get("status").equals("0"))) {
				queryArr.add(" RF_STATUS = ? ");
				bindVal.add(condition.get("status"));
			}
			
			if(!(condition.get("startReqD").equals(""))) {
				queryArr.add(" REQ_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startReqD"));
				bindVal.add(condition.get("endReqD"));
			}
			
			if(!(condition.get("startRfD").equals(""))) {
				queryArr.add(" RF_DATE BETWEEN ? ");
				queryArr.add(" ? ");
				bindVal.add(condition.get("startRfD"));
				bindVal.add(condition.get("endRfD"));
			}
			
			queryArr.add(" RNUM BETWEEN ? ");
			queryArr.add(" ? ");
			bindVal.add(startRow);
			bindVal.add(endRow);
		}
		
		query = prop.getProperty("refundFilter");

		
		for(int i = 0; i < queryArr.size(); i++) {
			if(i == queryArr.size()-1) {
				query += queryArr.get(i);
			}else {
				query += queryArr.get(i) + " AND ";
			}
		}
		
		
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < bindVal.size(); i++) {
				pstmt.setObject(i+1, bindVal.get(i));
			}

			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				int total = rset.getInt("TOTAL_DATE");
				int left = total - rset.getInt("LEFT_DATE");
				int price = rset.getInt("PRICE") - rset.getInt("DEPOSIT");
				
				hmap.put("rfNo", rset.getInt("RF_NO"));
				hmap.put("userId", rset.getString("USER_ID"));
				hmap.put("verifyCode", rset.getString("VERIFY_CODE"));
				hmap.put("rfReason", rset.getString("RF_REASON"));
				
				if(rset.getString("RF_TYPE").equals("RF3")) {
					hmap.put("type", "보증급 환급");
				}else if(rset.getString("RF_TYPE").equals("RF1")) {
					hmap.put("type", "예약취소");
				}else {
					hmap.put("type", "중간반납");
				}
				
				if(rset.getString("RT_SID").equals("RTS12")) {
					hmap.put("price",(int)(Math.floor((price/total * left) * 0.1)) * 10 + rset.getInt("DEPOSIT"));
				}else {
					if(rset.getString("RT_SID").equals("RTS10")) {
						hmap.put("price",rset.getInt("PRICE"));
					}else {
						hmap.put("price",rset.getInt("DEPOSIT"));
					}
				}
				
				
				hmap.put("reqDate", rset.getDate("REQ_DATE"));
				
				hmap.put("rfDate", rset.getDate("RF_DATE"));
				
				if(rset.getString("RF_STATUS").equals("N")) {
					hmap.put("status", "처리대기");
				}else {
					hmap.put("status", "처리완료");
				}

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
	
	public ArrayList<Payback> getDownloadList(Connection con, String[] nums) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Payback> list = new ArrayList<Payback>();
		
		String query = prop.getProperty("downloadList");
		
		try {
			for(int i = 0; i < nums.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(nums[i]));
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Payback p = new Payback();
					
					p.setPbNo(rset.getInt("PB_NO"));
					p.setAccName(rset.getString("ACCNAME"));
					p.setBank(rset.getString("BANK"));
					p.setAccount(rset.getString("ACCOUNT"));
					p.setPbAmount(rset.getInt("PB_AMOUNT"));
					
					list.add(p);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	public int updateMemberPenalty(Connection con, String[] reportsNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMemberPenalty");
		
		try {
			for(int i = 0; i < reportsNo.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(reportsNo[i]));
				pstmt.setInt(2, Integer.parseInt(reportsNo[i]));
				pstmt.setInt(3, Integer.parseInt(reportsNo[i]));
				
				result += pstmt.executeUpdate();
			}
			
			if(result == reportsNo.length) {
				result = 1;
			}else {
				result = 0;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
	public int selectPaybackSize(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pb = 0;
		
		String query = prop.getProperty("selectPaybackSize");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				pb = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return pb;
	}
	
	public int selectRefundSize(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int rf = 0;
		
		String query = prop.getProperty("selectRefundSize");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				rf = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return rf;
	}
		
	

	//---------------------------------------------- 민지 ----------------------------------------------
	public Member login(Connection con, String userId, String userPwd) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		String query = prop.getProperty("loginSelect");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setUno(rset.getInt("UNO"));
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setBirthDate(rset.getDate("BIRTH_DATE"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setSubPhone(rset.getString("SUB_PHONE"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setModifyDate(rset.getDate("MODIFY_DATE"));
				loginUser.setmLevel(rset.getString("MEMBER_LEVEL"));
				loginUser.setTotalPoint(rset.getInt("TOTAL_POINT"));
				loginUser.setProfits(rset.getInt("PROFITS"));
				loginUser.setPenaltyPoint(rset.getInt("PENALTY_POINT"));
				loginUser.setOptionCheck(rset.getString("OPTION_CHECK"));
				loginUser.setSocialLink(rset.getString("SOCIAL_LINK"));
				loginUser.setEmailVerif(rset.getString("EMAIL_VERIF"));
				loginUser.setStatus(rset.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return loginUser;
	}

	public int idCheck(Connection con, String userId) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("idCheck");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public int emailCheck(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("emailCheck");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public int insertMember(Connection con, Member newMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newMember.getUserId());
			pstmt.setString(2, newMember.getUserPwd());
			pstmt.setString(3, newMember.getUserName());
			pstmt.setString(4, newMember.getGender());
			pstmt.setDate(5, newMember.getBirthDate());
			pstmt.setString(6, newMember.getPhone());
			pstmt.setString(7, newMember.getEmail());
			pstmt.setString(8, newMember.getAddress());
			pstmt.setString(9, newMember.getSubPhone());
			pstmt.setString(10, newMember.getOptionCheck());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int setEmailChecked(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("setEmailChecked");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertPlusPoint(Connection con, Member newMember, int pointPrice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertPoint");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newMember.getUserId());
			pstmt.setString(2, "적립");
			pstmt.setInt(3, pointPrice);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertReport(Connection con, Report newReport) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReport");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, newReport.getReportUno());
			pstmt.setInt(2, newReport.getTargetUno());
			pstmt.setString(3, newReport.getReportCode());
			pstmt.setString(4, newReport.getReportContent());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public String getBwriterPhone(Connection con, int parentBno) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String phone = "";
	      String query = prop.getProperty("getBwriterPhone");
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, parentBno);
	         
	         rset = pstmt.executeQuery();
	         if(rset.next()) {
	            phone = rset.getString(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rset);
	      }
	      return phone;

	}

	
	public String findIdwithPhone(Connection con, String userName, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = "";
		String query = prop.getProperty("findIdwithPhone");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, "%" + phone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				userId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return userId;
	}

	public String findIdwithEmail(Connection con, String userName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = "";
		String query = prop.getProperty("findIdwithEmail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				userId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return userId;
	}


	
	
	
	
	



	/*------------------------------준혁 -------------------------------------*/
	public int updateUserInfo(Connection con, Member loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateUser");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginUser.getUserName());
			pstmt.setString(2, loginUser.getEmail());
			pstmt.setString(3, loginUser.getPhone());
			pstmt.setString(4, loginUser.getSubPhone());
			pstmt.setInt(5, loginUser.getUno());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}




	

	

	
	

	

	

	

	

	

	

	





























}






























