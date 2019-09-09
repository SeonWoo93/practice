/**
* Comment  : 
* @version : 1.0
* @author  : 최병욱
* @date    : 2019. 5. 14.
*/
package com.kh.st.test.dao;

import static com.kh.st.common.JDBCTemplate.getConnection;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.util.HashMap;

import org.junit.Before;
import org.junit.jupiter.api.Test;

import com.kh.st.rental.model.dao.RentalDao;
import com.kh.st.rental.model.service.RentalService;

/**
 * @author uukk
 *
 */
class TestRentalDao {

	
	/*@Test
	void testSelectRentalFilter() {
		assertNotNull(new RentalDao().selectRentalFilter());
	}*/
	
	@Before
    public void beforeInputMemberTest() {
    	
    }
/*	@Test
	void testUpdateCancel() {
		Connection con = null;
		String[] rtNo = null;
		String textResult = null;
		con = getConnection();
    	rtNo = new String[3];
    	rtNo[0] = "10";
    	rtNo[1] = "50";
    	rtNo[2] = "100";
    	textResult = "test";
		assertEquals(new RentalDao().updateCancel(con,rtNo,textResult),0);
	}*/
/*	@Test
	void updateProductStatus() {
		Connection con = null;
		String[] pno = null;
		con = getConnection();
		pno = new String[2];
		pno[0] = "17";
		pno[1] = "1555";
		assertEquals(new RentalDao().updateProductStatus(con,pno),2);
	}*/
	
/*	@Test
	void updateProductStatus() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 10;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);

		 System.out.println(userId);
		
		assertEquals(new RentalDao().insertInvcNum(con,invoiceVal),1);
		
	}*/
	
	/*@Test
	void updateRentalStatusS() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 10;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);
		assertEquals(new RentalDao().updateRentalStatusSw(con,invoiceVal),1);
		
		
	}*/
/*	@Test
	void updatePdStatusS() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 10;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);
		assertEquals(new RentalDao().updatePdStatusS(con,invoiceVal),1);
		
		
	}*/
	/*@Test
	void deleteInvcNum() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 20;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "d1";
		 String userId = "user15";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		 invoiceVal.put("userId",userId);
		assertEquals(new RentalDao().deleteInvcNum(con,invoiceVal),1);
		
		
	}*/
	/*@Test
	void updateRentalStatus() {
		Connection con = null;
		con = getConnection();
		String textResult = "asdasd";
		String rtNos = "10,20,30,40";
		String[] rtNo = rtNos.split(",");
		String pnos = "10,20,30,40";
		String[] pno = rtNos.split(",");
		String pStatus = "S10";
		String rtStatus = "C";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("pStatus",pStatus);
		 invoiceVal.put("rtStatus",rtStatus);
		assertEquals(new RentalDao().updateRentalStatus(con,invoiceVal),4);
		
	}*/
	
	/*@Test
	void selectReturnPdMngList() {
		Connection con = null;
		con = getConnection();
		String textResult = "asdasd";
		String rtNos = "10,20,30,40";
		String[] rtNo = rtNos.split(",");
		String pnos = "10,20,30,40";
		String[] pno = rtNos.split(",");
		String pStatus = "S10";
		String rtStatus = "C";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("pStatus",pStatus);
		 invoiceVal.put("rtStatus",rtStatus);
		assertNotNull(new RentalDao().selectReturnPdMngList(con));
		
	}*/
	@Test
	void insertReturnInvcNum() {
		Connection con = null;
		con = getConnection();
		 int rtNo = 20;
		 int invoiceNum = 153453534;
		 int pno = 11;
		 String dCom = "04";
		 
		 HashMap<String,Object> invoiceVal = new HashMap<String,Object>();
		 
		 invoiceVal.put("rtNo", rtNo);
		 invoiceVal.put("invoiceNum",invoiceNum);
		 invoiceVal.put("pno",pno);
		 invoiceVal.put("dCom",dCom);
		assertEquals(new RentalDao().insertReturnInvcNum(con,invoiceVal),1);
		
		
	}
}
