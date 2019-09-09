/**
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.common.PageInfo;
import com.kh.st.notice.model.vo.Notice;
import com.kh.st.rental.model.dao.RentalDao;

/**
 * @author uukk
 *
 */
public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = RentalDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectAdminNoticeList(Connection con) {
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAdminList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Notice reqNotice = new Notice();
				System.out.println(rset.getInt("NNO"));
				System.out.println(rset.getString("NTITLE"));
				System.out.println(rset.getString("NCONTENT"));
				System.out.println(rset.getInt("NCOUNT"));
				System.out.println(rset.getDate("NDATE"));
				System.out.println(rset.getDate("MODIFY_DATE"));
				System.out.println(rset.getNString("USER_ID"));
				
				
				
				reqNotice.setNno(rset.getInt("NNO"));
				reqNotice.setnTitle(rset.getString("NTITLE"));
				reqNotice.setnContent(rset.getString("NCONTENT"));
				reqNotice.setnCount(rset.getInt("NCOUNT"));
				reqNotice.setnDate(rset.getDate("NDATE"));
				reqNotice.setModify_Date(rset.getDate("MODIFY_DATE"));
				reqNotice.setnWriter(rset.getNString("USER_ID"));
				
				list.add(reqNotice);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}


	public int insertNotice(Connection con, Notice reqNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqNotice.getnTitle());
			pstmt.setString(2, reqNotice.getnContent());
			pstmt.setInt(3, Integer.parseInt(reqNotice.getnWriter()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public Notice selectAdminOne(Connection con, int num) {
		Notice repNotice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAdminOne");
	
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				repNotice = new Notice();
				
				repNotice.setNno(rset.getInt("NNO"));
				repNotice.setnTitle(rset.getString("NTITLE"));
				repNotice.setnContent(rset.getString("NCONTENT"));
				repNotice.setnDate(rset.getDate("NDATE"));
				repNotice.setnWriter(rset.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return repNotice;
	}


	public int updateNotice(Connection con, Notice reqNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqNotice.getnTitle());
			pstmt.setString(2, reqNotice.getnContent());
			pstmt.setInt(3, reqNotice.getNno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}
	
	public int deleteNotice(Connection con,String[] nno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		try {
			for(int i=0; i < nno.length; i++) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setObject(1, nno[i]);
				
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		// 결과값과 맞지 않을때 0을 리턴
		if(nno.length != result) {
			result = 0;
		}
		
		return result;
	}
	
	
	
	
	
	
	
	//민지
	   public ArrayList<Notice> selectNoticeList(Connection con, PageInfo pi) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Notice> nList = null;
	      String query = prop.getProperty("selectNoticeList");
	      
	      int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
	      int endRow = startRow + pi.getLimit() - 1;
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);
	         rset = pstmt.executeQuery();
	         nList = new ArrayList<Notice>();
	         while(rset.next()) {
	            Notice n = new Notice();
	            n.setNno(rset.getInt("NNO"));
	            n.setnTitle(rset.getString("NTITLE"));
	            n.setnContent(rset.getString("NCONTENT"));
	            n.setnCount(rset.getInt("NCOUNT"));
	            n.setnDate(rset.getDate("NDATE"));
	            n.setModify_Date(rset.getDate("MODIFY_DATE"));
	            n.setStatus(rset.getString("STATUS"));
	            n.setnWriter(rset.getString("USER_NAME"));
	            nList.add(n);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rset);
	      }
	      return nList;
	   }


	public int getnListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int nlistCnt = 0;
		String query = prop.getProperty("selectnListCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				nlistCnt = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return nlistCnt;
	}

	
	public int updatenCount(Connection con, int nno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatenCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			pstmt.setInt(2, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectOneNotice(Connection con, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		String query = prop.getProperty("selectOneNotice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice();
				n.setNno(rset.getInt("NNO"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnCount(rset.getInt("NCOUNT"));
				n.setnDate(rset.getDate("NDATE"));
				n.setModify_Date(rset.getDate("MODIFY_DATE"));
				n.setStatus(rset.getString("STATUS"));
				n.setnWriter(rset.getString("USER_NAME"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}


	public ArrayList<Attachment> selectnAttList(Connection con, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> nAttList = null;
		String query = prop.getProperty("selectnAttList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			nAttList = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAno(rset.getInt("ANO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				at.setNno(rset.getInt("NNO"));
				nAttList.add(at);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return nAttList;
	}


	public Attachment selectOneAttachment(Connection con, int ano) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		String query = prop.getProperty("selectOneAttachment");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ano);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setAno(rset.getInt("ANO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return at;
	}


	public ArrayList<Notice> searchNotice(Connection con, String input) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> nList = null;
		String query = prop.getProperty("searchNotice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + input + "%");
			pstmt.setString(2, "%" + input + "%");
			rset = pstmt.executeQuery();
			nList = new ArrayList<Notice>();
			while(rset.next()) {
				Notice n = new Notice();
				n.setNno(rset.getInt("NNO"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnCount(rset.getInt("NCOUNT"));
				n.setnDate(rset.getDate("NDATE"));
				n.setModify_Date(rset.getDate("MODIFY_DATE"));
				n.setStatus(rset.getString("STATUS"));
				n.setnWriter(rset.getString("USER_NAME"));
				nList.add(n);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return nList;
	}


	public ArrayList<Notice> getNotice5List(Connection con ) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> notice5List = null;
		String query = prop.getProperty("getNotice5List");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			notice5List = new ArrayList<Notice>();
			while(rset.next()) {
				Notice n = new Notice();
				n.setNno(rset.getInt("NNO"));
				n.setnTitle(rset.getString("NTITLE"));
				n.setnContent(rset.getString("NCONTENT"));
				n.setnCount(rset.getInt("NCOUNT"));
				n.setnDate(rset.getDate("NDATE"));
				n.setModify_Date(rset.getDate("MODIFY_DATE"));
				n.setStatus(rset.getString("STATUS"));
				n.setnWriter(rset.getString("USER_NAME"));
				notice5List.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return notice5List;
	}


	

}










