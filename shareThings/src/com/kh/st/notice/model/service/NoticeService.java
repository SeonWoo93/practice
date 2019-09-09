/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.service;

import static com.kh.st.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.common.PageInfo;
import com.kh.st.notice.model.dao.NoticeDao;
import com.kh.st.notice.model.vo.Notice;

/**
 * @author uukk
 *
 */
public class NoticeService {
	
	public ArrayList<Notice> selectAdminNoticeList() {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAdminNoticeList(con);
		
		close(con);
		return list;
	}
	
	public int insertNotice(Notice reqNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con,reqNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Notice selectAdminOne(int num) {
		Connection con = getConnection();
		
		Notice reqNotice = new NoticeDao().selectAdminOne(con, num);
		
		close(con);
		
		return reqNotice;
	}

	public int updateNotice(Notice reqNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con,reqNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteNotice(String[] nno) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con,nno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	
	
	
	//민지
	   public ArrayList<Notice> selectNoticeList(PageInfo pi) {
	      Connection con = getConnection();
	      ArrayList<Notice> nList = new NoticeDao().selectNoticeList(con, pi);
	      close(con);
	      return nList;
	   }

	public int getnListCount() {
		Connection con = getConnection();
		int nlistCnt = new NoticeDao().getnListCount(con);
		close(con);
		return nlistCnt;
	}

	public HashMap<String, Object> selectOneNotice(int nno) {
		Connection con = getConnection();
		HashMap<String, Object> nMap = new HashMap<String, Object>();
		int result = new NoticeDao().updatenCount(con, nno);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		Notice notice = new NoticeDao().selectOneNotice(con, nno);
		if (notice != null) {
			nMap.put("notice", notice);
			ArrayList<Attachment> nAttList = new NoticeDao().selectnAttList(con, nno);
			nMap.put("nAttList", nAttList);
		}
		close(con);
		return nMap;
	}

	public Attachment selectOneAttachment(int ano) {
		Connection con = getConnection();
		Attachment at = new NoticeDao().selectOneAttachment(con, ano);
		close(con);
		return at;
	}

	public ArrayList<Notice> searchNotice(String input) {
		Connection con = getConnection();
		ArrayList<Notice> nList = new NoticeDao().searchNotice(con, input);
		close(con);
		return nList;
	}

	public ArrayList<Notice> getNotice5List() {
		Connection con = getConnection();
		ArrayList<Notice> notice5List = new NoticeDao().getNotice5List(con);
		close(con);
		return notice5List;
	}

}
