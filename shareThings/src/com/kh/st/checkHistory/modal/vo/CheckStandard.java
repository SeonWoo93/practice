package com.kh.st.checkHistory.modal.vo;

import java.io.Serializable;

public class CheckStandard implements Serializable{
	private int num;	//번호
	private String standard;	//기준
	
	public CheckStandard() {}
	
	public CheckStandard(int num, String standard) {
		super();
		this.num = num;
		this.standard = standard;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public void setStandard(String standard) {
		this.standard = standard;
	}
	
	public int getNum() {
		return num;
	}
	
	public String getStandard() {
		return standard;
	}

	@Override
	public String toString() {
		return "CheckStandard [num=" + num + ", standard=" + standard + "]";
	}
}
