package com.kh.st.member.model.service;

import static com.kh.st.common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import com.kh.st.member.model.dao.MemberDao;
import com.kh.st.member.model.vo.Member;
import com.kh.st.member.model.vo.Mlevel;
import com.kh.st.member.model.vo.Payback;
import com.kh.st.member.model.vo.Refund;
import com.kh.st.member.model.vo.Report;
import com.kh.st.common.PageInfo;

public class MemberService {

	
	//---------------------------------------------- 도연 ----------------------------------------------
	//전체 회원수 리턴
	public int getListCount() {
		Connection con = getConnection();

		int listCount = new MemberDao().getListCount(con);

		close(con);

		return listCount;
	}

	//전체 회원 리스트 리턴
	public ArrayList<Member> selectList(PageInfo pi) {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().selectList(con, pi);

		close(con);

		return list;
	}

	//전체 회원등급 리턴
	public ArrayList<Mlevel> selectMlevelList() {
		Connection con = getConnection();

		ArrayList<Mlevel> list = new MemberDao().selectMlevelList(con);

		close(con);

		return list;
	}

	//회원등급 수정 
	public int updateMlevel(ArrayList<Mlevel> list) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMlevel(con, list);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//신고이력 카운트용
	public int getReportListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getReportListCount(con);

		close(con);

		return listCount;
	}
	
	//신고이력 전체 조회용
	public ArrayList<Report> selectReportList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Report> list = new MemberDao().selectReportList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//수익금 환급이력 전체 카운트용
	public int getPaybackListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getPaybackListCount(con);


		close(con);

		return listCount;
	}
	
	//수익금 환급 이력 전체 조회용
	public ArrayList<Payback> selectPaybackList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Payback> list = new MemberDao().selectPaybackList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//회원환불 전체 카운트용
	public int getRefundListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getRefundListCount(con);

		close(con);

		return listCount;
	}
	
	//회원환불 전체 리스트 조회
	public ArrayList<Refund> selectRefundList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Refund> list = new MemberDao().selectRefundList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//신고 적합판정용
	public int reportOk(String[] reportsNo) {
		Connection con = getConnection();
		
		int result1 = new MemberDao().reportOk(con, reportsNo);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = new MemberDao().updateMemberPenalty(con, reportsNo);
			
			if(result2 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result2;
	}
	
	//신고이력 상세보기용
	public ArrayList<HashMap<String, Object>> selectOneReport(int reportNo) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectOneReport(con, reportNo);
		
		close(con);
		
		return list;
	}
	
	//신고 부적합 처리용
	public int updateReportNo(String[] num, String inputReject) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateReportNo(con, num, inputReject);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//회원 상세보기용
	public HashMap<String, Object> selectOneMember(int no) {
		Connection con = getConnection();
		
		HashMap<String,Object> hmap = new MemberDao().selectOneMember(con,no);
		
		close(con);
		
		return hmap;
	}

	//수익금 환급완료 처리용
	public int updatePaybackOk(String[] nums) {
		Connection con = getConnection();
		
		int result = new MemberDao().updatePaybackOk(con,nums);
		int result2 = 0;
		if(result > 0) {
			result2 = new MemberDao().updateMemberPofits(con, nums);
			if(result2 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result2;
	}
	
	//회원 환불완료 처리용
	public int updateRefundOk(String[] nums) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateRefundOk(con, nums);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//회원 조회 필터링 목록 카운트
	public int getMemberFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
			
		int listCount = new MemberDao().getMemberFilterCount(con, condition);
		
		close(con);
		
		return listCount;
	}
	
	//회원 조회 필터링 처리용
	public ArrayList<HashMap<String, Object>> selectMemberFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectMemberFilter(con, condition, pi);
		
		close(con);
		return list;
	}
	
	//신고 조회 필터링 카운트용
	public int getReportFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getReportFilterCount(con, condition);
		
		close(con);
		
		return listCount;
	}

	//신고 조회 필터링 처리용
	public ArrayList<HashMap<String, Object>> selectReportFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectReportFilter(con, condition, pi);
		
		close(con);
		
		return list;
	}
	
	//수익금 환급 필터링
	public ArrayList<HashMap<String, Object>> selectPaybackFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectPaybackFilter(con, condition, pi);
		
		close(con);
		
		return list;
	}
	
	//수익금 환급 필터링 카운트
	public int getPaybackFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getPaybackFilterCount(con, condition);
		
		close(con);
		
		return listCount;
	}
	
	//환불 필터링 카운트
	public int getRefundFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getRefundFilterCount(con, condition);
		
		close(con);
		return listCount;
	}
	
	//환불 필터링
	public ArrayList<HashMap<String, Object>> selectRefundFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new MemberDao().selectRefundFilter(con, condition, pi);
		
		close(con);
		
		return list;
	}
	
	//다운로드용
	public ArrayList<Payback> getDownloadList(String[] nums) {
		Connection con = getConnection();
		
		ArrayList<Payback> list = new MemberDao().getDownloadList(con, nums);
		
		close(con);
		
		return list;
	}
	
	//어드민 메인용
	public HashMap<String, Object> selectMoneySize() {
		Connection con = getConnection();
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		int pb = new MemberDao().selectPaybackSize(con);
		int rf = new MemberDao().selectRefundSize(con);
		
		result.put("pb", pb);
		result.put("rf", rf);
		
		return result;
	}
	
	
	//---------------------------------------------- 민지 ----------------------------------------------
	public Member login(String userId, String userPwd) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().login(con, userId, userPwd);
		close(con);
		return loginUser;
	}

	public int idCheck(String userId) {

		Connection con = getConnection();
		int result = new MemberDao().idCheck(con, userId);
		close(con);
		return result;
	}

	public int emailCheck(String email) {
		Connection con = getConnection();
		int result = new MemberDao().emailCheck(con, email);
		close(con);
		return result;
	}

	public int insertMember(Member newMember) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new MemberDao().insertMember(con, newMember);
		if(result1 > 0) {
			int result2 = new MemberDao().insertPlusPoint(con, newMember, 3000);
			if(result2 > 0) {
				result = 1;
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			result = 0;
			rollback(con);
		}
		close(con);
		return result;
	}

	public Member setEmailChecked(Member loginUser) {
		Connection con = getConnection();
		int result = new MemberDao().setEmailChecked(con, loginUser.getUserId());
		Member updateUser = null;
		if(result > 0) {
			commit(con);
			updateUser = new MemberDao().login(con, loginUser.getUserId(), loginUser.getUserPwd());
		}else {
			rollback(con);
		}
		close(con);
		return updateUser;
	}
	
	
	public int insertReport(Report newReport) {
		Connection con = getConnection();
		int result = new MemberDao().insertReport(con, newReport);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	
	public String getBwriterPhone(int parentBno) {
	      Connection con = getConnection();
	      String phone = new MemberDao().getBwriterPhone(con, parentBno);
	      close(con);
	      return phone;
	   }
	

	public String findIdwithPhone(String userName, String phone) {
		Connection con = getConnection();
		String userId = new MemberDao().findIdwithPhone(con, userName, phone);
		close(con);
		return userId;
	}

	public String findIdwithEmail(String userName, String email) {
		Connection con = getConnection();
		String userId = new MemberDao().findIdwithEmail(con, userName, email);
		close(con);
		return userId;
	}



	


	
	
	
	
	
	
	

	/*-----------------------------------------준혁--------------------------------------------------------*/

	   public int updateUserInfo(Member loginUser) {
	      
	      Connection con = getConnection();
	      int result = new MemberDao().updateUserInfo(con, loginUser);
	      
	      if(result > 0) {
	         commit(con);
	      }else {
	         rollback(con);
	      }
	      close(con);
	      
	      return result;
	   }

	

	

	

	

	

	

	
	

	

	

	

	

	
	

	

	

	

	

	

}
