package com.kh.st.customerService.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.customerService.model.service.*;
import com.kh.st.customerService.model.dao.CsDao;
import com.kh.st.customerService.model.vo.Cs;

import static com.kh.st.common.JDBCTemplate.*;

public class CsService {

	public ArrayList<Cs> selectList(int uno) {
		Connection con = getConnection();
		
		ArrayList<Cs> list = new CsDao().selectList(con, uno);
		
		close(con);

		return list;
	}

	public int insertCs(Cs c) {
		Connection con = getConnection();
		
		int result = new CsDao().insertCs(con, c);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Cs selectOne(int num) {
		Connection con = getConnection();
		
		Cs c = new CsDao().selectOne(con, num);
		
		/*if(c != null) {
			int result = new CsDao().updateCs(con, c.getCno());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}*/
		
		close(con);
		
		return c;
	}

	/*public int updateCs(int c) {
		Connection con = getConnection();
		
		int result = new CsDao().updateCs(con, c);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}*/

	public int deleteCs(int cno) {
		Connection con = getConnection();
		
		int result = new CsDao().deleteCs(con, cno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertCsBoard(Cs c, ArrayList<Attachment> fileList) {
		 Connection con = getConnection();
	      int result = 0;
	      
	      int result1 = new CsDao().insertThumnailContent(con, c);
	      
	      if(result1 > 0) {
	         int cno = new CsDao().selectCurrval(con);
	         for(int i = 0; i < fileList.size(); i++) {
	            fileList.get(i).setCsNo(cno - 1);
	         }
	         
	      }
	      
	      int result2 = new CsDao().insertAttachment(con, fileList);
	      
	      if(result1 > 0 && result2 == fileList.size()) {
	         commit(con);
	         result = 1;
	      }else {
	         rollback(con);
	         result = 0;
	      }
	      
	      close(con);
	      
	      return result;
	}

	  //병욱
	   public ArrayList<HashMap<String,Object>> selectAdminList() {
	      Connection con = getConnection();
	      ArrayList<HashMap<String,Object>> list = new CsDao().selectAdminList(con);
	      
	      close(con);
	      return list;
	   }

	   public int selectListSize() {
	      Connection con = getConnection();
	      int listSize = new CsDao().selectListSize(con);
	      
	      close(con);
	      return listSize;
	   }

}


