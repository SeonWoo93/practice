package com.kh.st.adProduct.model.vo;

import java.io.Serializable;

public class EndProduct implements Serializable{
	private int pno;	//물품 번호
	private String model;	//모델명
	private String pName;	//물품명
	private String userName;	//등록자
	private	long dDay;	//남은날짜
	private String status;	//물품 상태
	private String dLocation;	//배송지
	
	public EndProduct() {}

	public EndProduct(int pno, String model, String pName, String userName, long dDay, String status,
			String dLocation) {
		super();
		this.pno = pno;
		this.model = model;
		this.pName = pName;
		this.userName = userName;
		this.dDay = dDay;
		this.status = status;
		this.dLocation = dLocation;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getdDay() {
		return dDay;
	}

	public void setdDay(long dDay) {
		this.dDay = dDay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getdLocation() {
		return dLocation;
	}

	public void setdLocation(String dLocation) {
		this.dLocation = dLocation;
	}

	@Override
	public String toString() {
		return "EndProduct [pno=" + pno + ", model=" + model + ", pName=" + pName + ", userName=" + userName + ", dDay="
				+ dDay + ", status=" + status + ", dLocation=" + dLocation + "]";
	}
}
