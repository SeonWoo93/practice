/**
* Comment  : ㅁㄴㅇ
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 19.
*/
package com.kh.st.test.service;

import static com.kh.st.common.JDBCTemplate.getConnection;
import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.util.HashMap;

import org.junit.jupiter.api.Test;

import com.kh.st.rental.model.dao.RentalDao;
import com.kh.st.rental.model.service.RentalService;

/**
 * @author uukk
 *
 */
class TestRentalService {

	/*@Test
	void deleteInvcNum() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 20;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 String pStatus = "S10";
		 String rtStatus = "SW";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);
		 invoiceVal.put("pStatus",pStatus);
		 invoiceVal.put("rtStatus",rtStatus);
		assertEquals(new RentalService().deleteInvcNum(invoiceVal),1);
		
	}*/
	@Test
	void insertInvcNum() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 20;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 String pStatus = "S10";
		 String rtStatus = "SW";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);
		 invoiceVal.put("pStatus",pStatus);
		 invoiceVal.put("rtStatus",rtStatus);
		assertEquals(new RentalService().deleteInvcNum(invoiceVal),1);
		
	}

}
