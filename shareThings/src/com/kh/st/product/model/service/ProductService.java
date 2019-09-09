package com.kh.st.product.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.st.product.model.dao.ProductDao;
import com.kh.st.product.model.vo.Product;
import com.kh.st.rental.model.vo.Cart;

public class ProductService {

	public int productInsert(Product p) {
		Connection con = getConnection();
		
		int result = new ProductDao().productInsert(con, p);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getProductNo() {
		Connection con = getConnection();
		int pno = new ProductDao().getProductNo(con);
		
		close(con);

		return pno;
	}

	public int regreqProduct(int pno) {
		
		Connection con = getConnection();
		int rqresult = new ProductDao().regreqProduct(con, pno);
		
		if(rqresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return rqresult;
	}

	
	/*---------------- 내 등록 내역 조회---------------*/
	public ArrayList<Product> selectList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList(con, uno);
		
		close(con);
		
		return list;
	}

	/*---------------- 내 대여 내역 조회---------------*/
	public ArrayList<Product> rtselectList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().rtselectList(con, uno);
		
		close(con);
		
		return list;
	}

	/*---------------- 내 장바구니 내역 조회---------------*/

	public ArrayList<Product> getCartList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().getCartList(con, uno);
		
		close(con);
		return list;
	}

	public ArrayList<Product> zzimList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().zzimList(con, uno);
		
		close(con);
		return list;
	}

	/*------------------ 장바구니 삭제 ------------------ */
	public int DeleteCart(String[] statusarr) {
		Connection con = getConnection();
		
		int result = new ProductDao().DeleteCart(con, statusarr);
		
		close(con);

		return result;
	}

	public Cart getProductNoinCart(int parseInt) {
		Connection con = getConnection();
		Cart pno = new ProductDao().getProductNoinCart(con, parseInt);
		/*int result = new ProductDao().DeleteCart2(con, parseInt);*/
		close(con);

		return pno;
	}
	public int getProductNoinCart2(int parseInt) {
		Connection con = getConnection();
		int result = new ProductDao().DeleteCart2(con, parseInt);
		close(con);

		return result;
	}

}
