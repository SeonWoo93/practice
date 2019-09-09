package com.kh.st.customerService.model.dao;

import static com.kh.st.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.st.attachment.model.vo.Attachment;
import com.kh.st.customerService.model.vo.Cs;

public class CsDao {
	private Properties prop = new Properties();
	
	public CsDao() {
		String fileName = CsDao.class.getResource("/sql/cs/cs-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Cs> selectList(Connection con, int uno) {
		ArrayList<Cs> list = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCs");
		
		try {
			stmt = con.prepareStatement(query);
			stmt.setInt(1, uno);
			
			rset = stmt.executeQuery();
			
			list = new ArrayList<Cs>();
			
			
			//---------------------------------------------------------- 여기부터
			while(rset.next()) {
				Cs c = new Cs();
				c.setCno(rset.getInt("CS_NO"));
				c.setPno(rset.getInt("PARENT_NO"));
				c.setcDate(rset.getDate("CS_DATE"));
				c.setcContent(rset.getString("CS_CONTENT"));
				c.setcCategory(rset.getString("CS_CATEGORY"));
				c.setcReply(rset.getString("CS_REPLY"));
				c.setUno(rset.getInt("UNO"));
				c.setcType(rset.getString("CS_TYPE"));
				c.setcCount(rset.getInt("CS_COUNT"));
				
				
				
				
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertCs(Connection con, Cs c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCs");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, c.getCno());
			pstmt.setInt(2, c.getPno());
			pstmt.setDate(3, (Date) c.getcDate());
			pstmt.setString(4, c.getcContent());
			pstmt.setString(5, c.getcCategory());
			pstmt.setString(6, c.getcReply());
			pstmt.setInt(7, c.getUno());
			pstmt.setString(8, c.getcType());
			pstmt.setInt(9, c.getcCount());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Cs selectOne(Connection con, int num) {
		Cs c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cs();
				c.setCno(rset.getInt("CS_NO"));
				c.setPno(rset.getInt("PARENT_NO"));
				c.setcDate(rset.getDate("CS_DATE"));
				c.setcContent(rset.getString("CS_CONTENT"));
				c.setcCategory(rset.getString("CS_CATEGORY"));
				c.setcReply(rset.getString("CS_REPLY"));
				c.setUno(rset.getInt("UNO"));
				c.setcType(rset.getString("CS_TYPE"));
				c.setcCount(rset.getInt("CS_COUNT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		return c;
	}

	/*public int updateCs(Connection con, int i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			pstmt.setInt(2, i);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}*/

	
	public int deleteCs(Connection con, int nno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deleteCs");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertThumnailContent(Connection con, Cs c) {
		
		 PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertCs");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, c.getcContent());
	         pstmt.setString(2, c.getcCategory());
	         pstmt.setInt(3, c.getUno());
	         pstmt.setString(4, "문의");
	         
	         
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e1) {
	         // TODO Auto-generated catch block
	         e1.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }

	public int selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		int cno = 0;
		String query = prop.getProperty("selectCnoCurrval");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				cno = rset.getInt("NEXTVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return cno;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertAttachment");
	      
	         try {
	            
	            for(int i = 0; i < fileList.size(); i++) {
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, fileList.get(i).getOriginName());
	            pstmt.setString(2, fileList.get(i).getChangeName());
	            pstmt.setString(3, fileList.get(i).getFilePath());
	            pstmt.setInt(4, fileList.get(i).getCsNo());
	            System.out.println(fileList.get(i).getCsNo());
	            result += pstmt.executeUpdate();
	            }
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	         }
	         
	      
	      
	      
	      return result;
	   }

	//병욱
	   public ArrayList<HashMap<String,Object>> selectAdminList(Connection con) {
	      HashMap<String,Object> hmap = null;
	      ArrayList<HashMap<String,Object>> list = null;
	      Statement stmt = null;
	      ResultSet rset = null;
	      
	      String query = prop.getProperty("selectAdminCs");
	      
	      try {
	         stmt = con.createStatement();
	         
	         rset = stmt.executeQuery(query);
	         list = new ArrayList<>();
	         
	         while(rset.next()) {
	            hmap = new HashMap<>();
	            hmap.put("cno",rset.getInt("CS_NO"));
	            hmap.put("parentNo",rset.getInt("PARENT_NO"));
	            hmap.put("csDate",rset.getDate("CS_DATE"));
	            hmap.put("csContent",rset.getString("CS_CONTENT"));
	            hmap.put("csCategory",rset.getString("CS_CATEGORY"));
	            hmap.put("csReply",rset.getString("CS_REPLY"));
	            hmap.put("userId",rset.getString("USER_ID"));
	            hmap.put("csType",rset.getString("CS_TYPE"));
	            hmap.put("csCount",rset.getInt("CS_COUNT"));
	            
	            list.add(hmap);
	            
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(stmt);
	      }
	      
	      return list;
	   }
	   public int selectListSize(Connection con) {
	      Statement stmt = null;
	      ResultSet rset = null;
	      int listSize = 0;
	      
	      String query = null;
	      
	      query = prop.getProperty("selectListSize");
	      
	      try {
	         stmt = con.createStatement();
	         
	         rset = stmt.executeQuery(query);
	         
	         while(rset.next()) {
	            listSize = rset.getInt("COUNT(*)");
	         }
	         
	            
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(stmt);
	         close(rset);   
	      }
	      System.out.println(listSize);
	      return listSize;
	   }

}





