package com.kh.st.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payback implements Serializable{
	private int pbNo;
	private String userId;
	private String userName;
	private String bank;
	private String account;
	private String accName;
	private Date reqDate;
	private int pbAmount;
	private Date pbDate;
	private String pbStatus;
	
	public Payback() {}

	public Payback(int pbNo, String userId, String userName, String bank, String account, String accName, Date reqDate,
			int pbAmount, Date pbDate, String pbStatus) {
		super();
		this.pbNo = pbNo;
		this.userId = userId;
		this.userName = userName;
		this.bank = bank;
		this.account = account;
		this.accName = accName;
		this.reqDate = reqDate;
		this.pbAmount = pbAmount;
		this.pbDate = pbDate;
		this.pbStatus = pbStatus;
	}

	public int getPbNo() {
		return pbNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getBank() {
		return bank;
	}

	public String getAccount() {
		return account;
	}

	public String getAccName() {
		return accName;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public int getPbAmount() {
		return pbAmount;
	}

	public Date getPbDate() {
		return pbDate;
	}

	public String getPbStatus() {
		return pbStatus;
	}

	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public void setPbAmount(int pbAmount) {
		this.pbAmount = pbAmount;
	}

	public void setPbDate(Date pbDate) {
		this.pbDate = pbDate;
	}

	public void setPbStatus(String pbStatus) {
		this.pbStatus = pbStatus;
	}

	@Override
	public String toString() {
		return "Payback [pbNo=" + pbNo + ", userId=" + userId + ", userName=" + userName + ", bank=" + bank
				+ ", account=" + account + ", accName=" + accName + ", reqDate=" + reqDate + ", pbAmount=" + pbAmount
				+ ", pbDate=" + pbDate + ", pbStatus=" + pbStatus + "]";
	}
	
	
	
}
