package com.kh.st.checkHistory.modal.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.commit;
import static com.kh.st.common.JDBCTemplate.getConnection;
import static com.kh.st.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.checkHistory.modal.dao.CheckHistoryDao;
import com.kh.st.checkHistory.modal.vo.CheckHistory;
import com.kh.st.checkHistory.modal.vo.CheckStandard;
import com.kh.st.common.PageInfo;
import com.kh.st.rental.model.dao.RentalDao;

public class CheckHistoryService {

	//검수 거절 이미지 등록 메소드
	public int insertRejectImg(CheckHistory ch, ArrayList<Attachment> fileList, String multiDelivery, String multiDno) {
		Connection con = getConnection();
		int result = 0;
		
		//검수 내용,검수자 인서트
		int result1 = new CheckHistoryDao().insertCheckContent(con, ch, fileList);
		if(result1 > 0) {
			System.out.println("검수내용, 검수자 성공");
			//물품 상태 업데이트(검수 불통과)
			int result2 = new CheckHistoryDao().updateRejectSid(con, ch);
			if(result2 > 0) {
				System.out.println("상태 업데이트 성공");
				int chkNo = new CheckHistoryDao().selectCurrval(con);
				for(int i = 0; i <fileList.size(); i++) {
					fileList.get(i).setChkNo(chkNo);
					System.out.println(fileList.get(i).getChkNo());
				}
				//검수거절 배송 인서트
				int result3 = new CheckHistoryDao().updateRejectDelivery(con, ch, multiDelivery, multiDno);
				if(result3 > 0) {
					System.out.println("검수거절 배송 성공");
					//사진 인서트
					int result4 = new CheckHistoryDao().insertChkImg(con, fileList);
					if(result4 == fileList.size()) {
						System.out.println("사진 성공");
						commit(con);
						result = 1;
					} else {
						System.out.println("사진 실패");
						rollback(con);
						result = 0;
					}
				} else {
					System.out.println("검수거절 배송 실패");
					rollback(con);
				}
			} else {
				System.out.println("상태 업데이트 실패");
				rollback(con);
			}
		} else {
			System.out.println("검수 내용, 검수자 인서트 실패");
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertConfirmImg(CheckHistory ch, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		//검수내용, 검수자
		int result1 = new CheckHistoryDao().insertCheckContent(con, ch, fileList);
		if(result1 > 0) {
			System.out.println("검수내용, 검수자 성공");
			//물품 상태 업데이트(검수 통과, 물품 상태)
			int result2 = new CheckHistoryDao().updateConfirmSid(con, ch);
			if(result2 > 0) {
				System.out.println("상태 업데이트 성공");
				int chkNo = new CheckHistoryDao().selectCurrval(con);
				for(int i = 0; i <fileList.size(); i++) {
					fileList.get(i).setChkNo(chkNo);
					System.out.println(fileList.get(i).getChkNo());
				}
				//사진 인서트
				int result3 = new CheckHistoryDao().insertChkImg(con, fileList);
				if(result3 == fileList.size()) {
					System.out.println("사진 성공");
					commit(con);
					result = 1;
				} else {
					System.out.println("사진 실패");
					rollback(con);
					result = 0;
				}
			} else {
				rollback(con);
				System.out.println("상태 업데이트 실패");
			}
		} else {
			rollback(con);
			System.out.println("검수내용, 검수자 실패");
		}
		close(con);
		return result;
	}
	
	//검수 물품 자세히 보기
	public HashMap<String, Object> confirmProductDetail(int reqNum) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new CheckHistoryDao().confirmProductDetail(con, reqNum);
		close(con);
		return hmap;
	}

	//필터 조회 게시글 수
	public int getConfirmFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		int listCount = new CheckHistoryDao().getConfirmFilterCount(con, condition);
		
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectConfirmFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new CheckHistoryDao().selectConfirmFilter(con, condition, pi);
		
		close(con);
		return list;
	}

	public int insertExamineImg(CheckHistory ch, ArrayList<Attachment> fileList, HashMap<String, Object> hmap) {
		Connection con = getConnection();
		int result = 0;
		
		//검수 내용,검수자 인서트
		int ccResult = new CheckHistoryDao().insertCheckContent(con, ch, fileList);
		if(ccResult > 0) {
			System.out.println("검수내용, 검수자 성공");
			//물품 상태 업데이트(검수 통과)
			int udResult = new RentalDao().updatePdStatus(con, hmap);
			
			if(udResult > 0) {
				System.out.println("물품 상태 업데이틍 ㅘㄴ료");
				//
				int rtResult = new RentalDao().updateRentalStatus(con, hmap);
				if(rtResult > 0) {
					System.out.println("대여상태 업데이트 성공");
					int chkNo = new CheckHistoryDao().selectCurrval(con);
					
					for(int i = 0; i <fileList.size(); i++) {
						fileList.get(i).setChkNo(chkNo);
						System.out.println(fileList.get(i).getChkNo());
					}
					int result3 = new CheckHistoryDao().insertChkImg(con, fileList);
					if(result3 == fileList.size()) {
						System.out.println("사진 성공");
						result = 1;
					} else {
						System.out.println("사진 실패");
						result = 0;
					}
				}else {
					System.out.println("대여상태 업데이트 실패");
				}
				
			}else {
				System.out.println("물품 상태 업데이트 실패");
			}
			
		} else {
			System.out.println("검수 내용, 검수자 인서트 실패");
			
		}
		
		if(result > 0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	//검수이력 전체 숫자
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new CheckHistoryDao().getListCount(con);
		
		close(con);
		return listCount;
	}
	
	//검수이력 전체조회
	public ArrayList<CheckHistory> checkHistoryList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<CheckHistory> list = new CheckHistoryDao().checkHistoryList(con, pi);
		
		close(con);
		return list;
	}

	//검수처리된 물품 상세 보기
	public HashMap<String, Object> checkHistoryDetail(int chkNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new CheckHistoryDao().checkHistoryDetail(con, chkNo);
		
		close(con);
		return hmap;
	}

	//해당 물품 검수 사진 보기
	public HashMap<String, Object> checkDetailImg(int chkNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new CheckHistoryDao().checkDetailImg(con, chkNo);
		close(con);
		return hmap;
	}

	//검수 기준 조회
	public ArrayList<CheckStandard> checkStandard(String result) {
		Connection con = getConnection();
		
		ArrayList<CheckStandard> list = new CheckHistoryDao().checkStandard(con, result);
		
		close(con);
		return list;
	}

}
