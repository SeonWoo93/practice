package com.kh.st.rental.model.service;

import static com.kh.st.common.JDBCTemplate.close;
import static com.kh.st.common.JDBCTemplate.commit;
import static com.kh.st.common.JDBCTemplate.getConnection;
import static com.kh.st.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.rental.model.dao.RentalDao;
import com.kh.st.rental.model.vo.Cart;

public class RentalService {
	/* 대여리스트 전체 조회 */
	public ArrayList<HashMap<String, Object>> selectRentalList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalList(con);
		
		close(con);
		return list;
	}
	/* 대여리스트 상세조회 */
	public ArrayList<HashMap<String, Object>> selectRentalFilter(HashMap<String, Object> condition) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectRentalFilter(con,condition);
		
		close(con);
		return list;
	}

	/* 발송관리(대여대기) 리스트 전체 조회 */
	public ArrayList<HashMap<String, Object>> selectShpMngList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectShpMngList(con);
		
		close(con);
		return list;
	}
	
	/* 대여취소 모달  ajax 출력용*/
	public ArrayList<HashMap<String, Object>> selectShpNum(String[] status) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new RentalDao().selectShpNum(con,status);
		
		close(con);
		return list;
	}
	/* 취소시 업데이트 */
	public int updateCancel(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		int result = 0;
		//대여상태 변경
		int rtResult = new RentalDao().updateRentalStatus(con,hmap);
		
		//db에 대여상태 업데이트가 정상적으로 됐을떄
		if(rtResult>0) {
			//취소사유 업데이트
			int rt1Result = new RentalDao().updateRentalRemark(con,hmap);
			//취소사유가 정상 업데이트 됐을때
			if(rt1Result > 0) {
				//물품상태 업데이트
				int pdResult = new RentalDao().updateProductStatus(con,hmap);
				//db에 물품상태 업데이트가 정상적으로 됐을떄
				if(pdResult >0) {
					result = 1;
				}
			}
		}
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
		
	}

	// 송장번호 입력 
	public int insertInvcNum(HashMap<String, Object> invoiceVal) {
		Connection con = getConnection();
		int result = 0;
		// delivery insert
		int dvResult = new RentalDao().insertInvcNum(con,invoiceVal);
		
		// delivery 데이터 정상 삽입시
		if(dvResult > 0) {
			//대여상태 데이터  대여중으로 업데이트
			int rtResult = new RentalDao().updateRentalStatus(con,invoiceVal);
			
			// 대여상태 데이터 정상 업데이트시에
			if(rtResult > 0) {
				result = 1;
			}
		}
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	/* 송장 삭제  */
	public int deleteInvcNum(HashMap<String, Object> invoiceVal) {
		Connection con = getConnection();
		int result = 0;
		// delivery delete
		int dvResult = new RentalDao().deleteInvcNum(con,invoiceVal);
		System.out.println("dvResult : " + dvResult);
		// delivery 데이터 정상 삭제시
		if(dvResult > 0) {
			//대여상태 데이터  대여대기로 업데이트
			int rtResult = new RentalDao().updateRentalStatus(con,invoiceVal);
			System.out.println("rtResult : " + rtResult);
			//대여상태 데이터 정상 변경시
			if(rtResult>0) {
				int pdResult = new RentalDao().updatePdStatus(con,invoiceVal);
				//물품상태 데이터 정상 업데이트시에
				if(pdResult>0) {
					result = 1;
				}
			}
		}
		
		System.out.println(result);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	
	// 물품 발송 처리
		public int updateForwarding(HashMap<String, Object> hmap) {
			Connection con = getConnection();
			int result = 0;
			//대여상태 변경
			int rtResult = new RentalDao().updateRentalStatus(con,hmap);
			System.out.println("rtResult : " + rtResult);
			//db에 대여상태 업데이트가 정상적으로 됐을떄
			if(rtResult>0) {
				//물품상태 업데이트
				int pdResult = new RentalDao().updateProductStatus(con,hmap);
				System.out.println("pdResult : " + pdResult);
				//db에 물품상태 업데이트가 정상적으로 됐을떄
				if(pdResult >0) {
					result = 1;
				}
			}
			
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			return result;
		}
		//배송리스트조회
		public ArrayList<HashMap<String, Object>> selectSendList() {
			Connection con = getConnection();
			ArrayList<HashMap<String, Object>> list = new RentalDao().selectSendList(con);
			
			close(con);
			return list;
		}
		//수거현황 리스트 조회
		public ArrayList<HashMap<String, Object>> selectReturnPdMngList() {
			Connection con = getConnection();
			ArrayList<HashMap<String, Object>> list = new RentalDao().selectReturnPdMngList(con);
			
			close(con);
			return list;
		}
		
		//반환받는 송장 입력 처리
		public int insertReturnInvcNum(HashMap<String, Object> invoiceVal) {

			Connection con = getConnection();
			int result = 0;
			// delivery insert
			int dvResult = new RentalDao().insertReturnInvcNum(con,invoiceVal);
			
			// delivery 데이터 정상 삽입시
			if(dvResult > 0) {
				//대여상태 반품송장입력으로 업데이트
				int rtResult = new RentalDao().updateRentalStatus(con,invoiceVal);
				
				// 대여상태 데이터 정상 업데이트시에
				if(rtResult > 0) {
					int pdResult = new RentalDao().updatePdStatus(con,invoiceVal);
					
					//물품상태 데이터 정상 업데이트시에
					if(pdResult>0) {
						result = 1;
					}
					
				}
			}
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			return result;
		}
		
		//반품 송장 취소
		public int deleteReturnInvcNum(HashMap<String, Object> invoiceVal) {
			Connection con = getConnection();
			int result = 0;
			// delivery delete
			int dvResult = new RentalDao().deleteReturnInvcNum(con,invoiceVal);
			System.out.println("dvResult : " + dvResult);
			// delivery 데이터 정상 삭제시
			if(dvResult > 0) {
				//대여상태 데이터  업데이트
				int rtResult = new RentalDao().updateRentalStatus(con,invoiceVal);
				System.out.println("rtResult : " + rtResult);
				//대여상태 데이터 정상 변경시
				if(rtResult>0) {
					//물품상태 수정
					int pdResult = new RentalDao().updatePdStatus(con,invoiceVal);
					//물품상태 데이터 정상 업데이트시에
					if(pdResult>0) {
						result = 1;
					}
				}
			}
			
			System.out.println(result);
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			return result;
		}
		//수거요청 처리
		public int updateReturnPd(HashMap<String, Object> hmap) {
			Connection con = getConnection();
			int result = 0;
			//대여상태 변경
			int rtResult = new RentalDao().updateRentalStatus(con,hmap);
			System.out.println("rtResult : " + rtResult);
			//db에 대여상태 업데이트가 정상적으로 됐을떄
			if(rtResult>0) {
				//물품상태 업데이트
				int pdResult = new RentalDao().updateProductStatus(con,hmap);
				System.out.println("pdResult : " + pdResult);
				//db에 물품상태 업데이트가 정상적으로 됐을떄
				if(pdResult >0) {
					result = 1;
				}
			}
			
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			return result;
		}
		
		// 수거물품 조회 필터
		public ArrayList<HashMap<String, Object>> selectRtPdFilter(HashMap<String, Object> condition) {
			Connection con = getConnection();
			ArrayList<HashMap<String, Object>> list = new RentalDao().selectRtPdFilter(con,condition);
			
			close(con);
			return list;
		}
		//날짜로 조회
		public ArrayList<HashMap<String, Object>> selectRtPdDayFilter(int selectDay) {
			Connection con = getConnection();
			ArrayList<HashMap<String, Object>> list = new RentalDao().selectRtPdDayFilter(con,selectDay);
			
			close(con);
			return list;
		}
		//대여 승인 사이즈
		public HashMap<String,Object> selectListSize(ArrayList<String> rentalStatus) {
			Connection con = getConnection();
			HashMap<String,Object> hmap = new HashMap<>(); 
			int approvalSize = new RentalDao().selectApprovalSize(con,rentalStatus,0);
			int cancelSize = new RentalDao().selectApprovalSize(con,rentalStatus,1);
			int returnSize = new RentalDao().selectApprovalSize(con,rentalStatus,2);
			
			System.out.println("approvalSize :" + approvalSize);
			System.out.println("cancelSize :" +cancelSize);
			System.out.println("returnSize :" +returnSize);
			
			hmap.put("approvalSize", approvalSize);
			hmap.put("cancelSize", cancelSize);
			hmap.put("returnSize", returnSize);
			
			
			close(con);
			return hmap;
		}
	      
		
		
		//민지
		   public int insertCart(Cart newCart) {
		      Connection con = getConnection();
		      int result = new RentalDao().insertCart(con, newCart);
		      if(result > 0) {
		         commit(con);
		      }else {
		         rollback(con);
		      }
		      return result;
		   }
		   
		   
		   
		   
		/*   ------------------ 렌탈신청--------*/
		public int reqRental(Cart pno, int uno) {
			Connection con = getConnection();
			int result = new RentalDao().reqRental(con, pno, uno);
			
			if(result > 0) {
				commit(con);
				
			}else {
				rollback(con);
			}
			
			close(con);
			return result;
		}
		
		

		
		   
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
