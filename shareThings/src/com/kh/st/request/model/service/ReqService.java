package com.kh.st.request.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.common.PageInfo;
import com.kh.st.request.model.dao.ReqDao;
import com.kh.st.request.model.vo.ReqProduct;

public class ReqService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ReqDao().getListCount(con);
		
		close(con);
		return listCount;
	}

	public ArrayList<ReqProduct> reqList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<ReqProduct> list = new ReqDao().reqList(con, pi);
		
		close(con);
		return list;
	}

	public ArrayList<ReqProduct> reqNoSelect(String[] status) {
		Connection con = getConnection();
		
		ArrayList<ReqProduct> list = new ReqDao().reqNoSelect(con, status);
		
		close(con);
		return list;
	}

	public int reqNo(String[] num, String textResult) {
		Connection con = getConnection();
		
		int result = new ReqDao().reqNo(con, num);
		
		if(result == num.length) {
			int result1 = new ReqDao().reqNoResult(con, num, textResult);
			
			if(result1 == num.length) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		return result;
	}

	public ReqProduct reqOkSelect(String status) {
		Connection con = getConnection();
		
		ReqProduct rp = new ReqDao().reqOkSelect(con, status);
		
		close(con);
		return rp;
	}

	public int reqOk(int num, String delivery, String dNo) {
		Connection con = getConnection();
		
		int result = new ReqDao().reqOk(con, num);
		
		if(result > 0) {
			int result1 = new ReqDao().reqOkResult(con, num);
			
			if(result1 > 0) {
				int result2 = new ReqDao().delWait(con, num, delivery, dNo);
				
				if(result2 > 0) {
					result = 1;
					commit(con);
				} else {
					result = 0;
					rollback(con);
				}
			}
		}
		close(con);
		return result;
	}

	//요청 물품 상세 보기
	public HashMap<String, Object> reqProductDetail(int reqNum) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new ReqDao().reqProductDetail(con, reqNum);
		
		close(con);
		return hmap;
	}

	//요청 리스트 조건 검색
	public ArrayList<HashMap<String, Object>> selectReqFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ReqDao().selectReqFilter(con, condition, pi);
		close(con);
		return list;
	}


	//요청 승인 페이징처리 게시글 숫자
	public int getListOkCount() {
		Connection con = getConnection();
		int listOkCount = new ReqDao().getListOkCount(con);
		
		close(con);
		return listOkCount;
	}
	
	//페이징처리 요청승인 전체 물품
	public ArrayList<ReqProduct> reqOkList(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<ReqProduct> list = new ReqDao().reqOkList(con, pi);
		
		close(con);
		return list;
	}

	//선택 검수 거절
	public ReqProduct reqRejectSelect(String status) {
		Connection con = getConnection();
		
		ReqProduct rp = new ReqDao().reqRejectSelect(con, status);
		
		close(con);
		return rp;
	}
	
	//선택 검수 승인
	public ReqProduct reqConfirmSelect(String status) {
		Connection con = getConnection();
		
		ReqProduct rp = new ReqDao().reqConfirmSelect(con, status);
		
		close(con);
		return rp;
	}

	//조건 검색 페이징 처리
	public int getReqFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		
		int listCount = new ReqDao().getReqFilterCount(con, condition);
		
		close(con);
		return listCount;
	}

	//금임 업무량
	public HashMap<String, Object> reqProductList() {
		Connection con = getConnection();
		HashMap<String, Object> result = new HashMap<String,Object>();
		
		int reqList = new ReqDao().reqProductSize(con);
		int confirmList = new ReqDao().confirmSize(con);
		int adProduct = new ReqDao().adProductSize(con);
		
		result.put("reqList", reqList);
		result.put("confirmList", confirmList);
		result.put("adProduct", adProduct);
		
		return result;
	}
	
	
}
