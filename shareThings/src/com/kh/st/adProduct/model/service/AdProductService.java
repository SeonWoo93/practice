package com.kh.st.adProduct.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.adProduct.model.dao.AdProductDao;
import com.kh.st.adProduct.model.vo.AdProduct;
import com.kh.st.adProduct.model.vo.EndProduct;
import com.kh.st.checkHistory.modal.dao.CheckHistoryDao;
import com.kh.st.common.PageInfo;
import com.kh.st.request.model.dao.ReqDao;

public class AdProductService {

	//등록 물품 처리
	public int adProductOk(String[] num) {
		Connection con = getConnection();
		int result = new AdProductDao().adProductOk(con, num);
		
		if(result == num.length) {
			System.out.println("물품 등록 성공");
			commit(con);
		} else {
			System.out.println("물품 등록 실패");
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	//등록 물품 갯수
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new AdProductDao().getListCount(con);
		
		close(con);
		return listCount;
	}
	//등록 물품 조회
	public ArrayList<AdProduct> adProductList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<AdProduct> list = new AdProductDao().adProductList(con, pi);
		
		close(con);
		return list;
	}

	//최종 등록물품 상세 보기
	public HashMap<String, Object> adProductDetail(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new AdProductDao().adProductDetail(con, num);
		
		close(con);
		return hmap;
	}
	
	//최종 등록물품 초기 검수사진, 내용
	public HashMap<String, Object> adProductDetailImg(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap =
				new AdProductDao().adProductDetailImg(con, num);
		close(con);
		return hmap;
	}

	//물품 배송 상태
	public ArrayList<HashMap<String, Object>> shipList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new AdProductDao().shipList(con);
		
		close(con);
		return list;
	}

	//등록 만료 조회
	public ArrayList<EndProduct> endProductList(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<EndProduct> list = new AdProductDao().endProductList(con, pi);
		
		close(con);
		return list;
	}

	//선택한 반환 물품 조회
	public EndProduct endProductSelect(int num) {
		Connection con = getConnection();
		EndProduct ep = new AdProductDao().endProductSelect(con, num);
		
		close(con);
		return ep;
	}

	//등록 만료 물품 반환
	public int endProductDelivery(int pno, String dlocation, String delivery, String dNo) {
		Connection con = getConnection();
		int result = new AdProductDao().endProductDelivery(con, pno, dlocation, delivery, dNo);
		
		if(result > 0) {
			//물품상태 업데이트
			System.out.println("배송 인서트 성공");
			int result1 = new AdProductDao().endProductSid(con, pno);
			
			if(result1 > 0) {
				System.out.println("물품상태 업데이트 성공");
				commit(con);
			} else {
				System.out.println("물품상태 업데이트 실패");
				rollback(con);
			}
		} else {
			System.out.println("배송 인서트 실패");
			rollback(con);
		}
		
		close(con);
		return result;
	}

	//조건 검색 페이징 처리
	public int getAdProductFilterCount(HashMap<String, Object> condition) {
		Connection con = getConnection();
		
		int listCount = new AdProductDao().getAdProductFilterCount(con, condition);
		
		close(con);
		return listCount;
	}

	//물품 조건 검색
	public ArrayList<HashMap<String, Object>> selectAdProductFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = 
				new AdProductDao().selectAdProductFilter(con, condition, pi);
		close(con);
		return list;
	}

	//조건검색 페이징 처리
	public int endProductFilterList(HashMap<String, Object> condition) {
		Connection con = getConnection();
		int listCount = new AdProductDao().endProductFilterList(con, condition);
		
		close(con);
		return listCount;
	}

	//조건 검색 처리
	public ArrayList<HashMap<String, Object>> selectEndProductFilter(HashMap<String, Object> condition, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new AdProductDao().selectEndProductFilter(con, condition, pi);
		
		close(con);
		return list;
	}
}
