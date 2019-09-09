package com.kh.st.stat.model.dao;

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
import static com.kh.st.common.JDBCTemplate.*;

public class StatDao {

	private Properties prop = new Properties();

	//properties 연결
	public StatDao() {
		String fileName = StatDao.class
				.getResource("/sql/stat/stat-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<HashMap<String, Object>> selectStatList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		
		String query = prop.getProperty("selectStatList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				if(rset.getInt("PARENT_CTGID") == 1) {
					hmap.put("type", "전자기기");
				}else if(rset.getInt("PARENT_CTGID") == 2) {
					hmap.put("type", "취미/레저");
				}else if(rset.getInt("PARENT_CTGID") == 3) {
					hmap.put("type", "패션뷰티");
				}else if(rset.getInt("PARENT_CTGID") == 4) {
					hmap.put("type", "유아동");
				}else {
					hmap.put("type", "반려동물");
				}
				
				hmap.put("count", rset.getInt("RT_COUNT"));
				
				hmap.put("price", rset.getInt("PRICE"));
				
				hmap.put("netProfit", (int)(rset.getInt("PRICE") * 0.4));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		System.out.println(list);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectFilter(Connection con, String startD, String endD) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		
		String query = prop.getProperty("selectFilter");
		
		try {
			pstmt = con.prepareStatement(query);
			if(startD.equals("")) {
				pstmt.setString(1, "2019-01-01");
				pstmt.setString(2, "2020-01-01");
			}else {
				pstmt.setString(1, startD);
				pstmt.setString(2, endD);
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				if(rset.getInt("PARENT_CTGID") == 1) {
					hmap.put("type", "전자기기");
				}else if(rset.getInt("PARENT_CTGID") == 2) {
					hmap.put("type", "취미/레저");
				}else if(rset.getInt("PARENT_CTGID") == 3) {
					hmap.put("type", "패션뷰티");
				}else if(rset.getInt("PARENT_CTGID") == 4) {
					hmap.put("type", "유아동");
				}else {
					hmap.put("type", "반려동물");
				}
				
				hmap.put("count", rset.getInt("RT_COUNT"));
				
				hmap.put("price", rset.getInt("PRICE"));
				
				hmap.put("netProfit", (int)(rset.getInt("PRICE") * 0.4));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}

































