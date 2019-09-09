package com.kh.st.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Refund implements Serializable{
	private int rfNo;
	private String userId;
	private String verifyCode;
	private String rfReason;
	private int price;
	private String rfType;
	private Date reqDate;
	private String rfResult;
	private Date rfDate;
	private String rfStatus;
	
	public Refund() {}

	public Refund(int rfNo, String userId, String verifyCode, String rfReason, int price, String rfType, Date reqDate,
			String rfResult, Date rfDate, String rfStatus) {
		super();
		this.rfNo = rfNo;
		this.userId = userId;
		this.verifyCode = verifyCode;
		this.rfReason = rfReason;
		this.price = price;
		this.rfType = rfType;
		this.reqDate = reqDate;
		this.rfResult = rfResult;
		this.rfDate = rfDate;
		this.rfStatus = rfStatus;
	}

	public int getRfNo() {
		return rfNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public String getRfReason() {
		return rfReason;
	}

	public int getPrice() {
		return price;
	}

	public String getRfType() {
		return rfType;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public String getRfResult() {
		return rfResult;
	}

	public Date getRfDate() {
		return rfDate;
	}

	public String getRfStatus() {
		return rfStatus;
	}

	public void setRfNo(int rfNo) {
		this.rfNo = rfNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public void setRfReason(String rfReason) {
		this.rfReason = rfReason;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setRfType(String rfType) {
		this.rfType = rfType;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public void setRfResult(String rfResult) {
		this.rfResult = rfResult;
	}

	public void setRfDate(Date rfDate) {
		this.rfDate = rfDate;
	}

	public void setRfStatus(String rfStatus) {
		this.rfStatus = rfStatus;
	}

	@Override
	public String toString() {
		return "Refund [rfNo=" + rfNo + ", userId=" + userId + ", verifyCode=" + verifyCode + ", rfReason=" + rfReason
				+ ", price=" + price + ", rfType=" + rfType + ", reqDate=" + reqDate + ", rfResult=" + rfResult
				+ ", rfDate=" + rfDate + ", rfStatus=" + rfStatus + "]";
	}

	
	
	
	
}
