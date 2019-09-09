package com.kh.st.stat.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.st.stat.model.dao.StatDao;

import static com.kh.st.common.JDBCTemplate.*;


public class StatService {

	public ArrayList<HashMap<String, Object>> selectStatList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new StatDao().selectStatList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectFilter(String startD, String endD) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new StatDao().selectFilter(con, startD, endD);
		
		close(con);
		
		return list;
	}

}
