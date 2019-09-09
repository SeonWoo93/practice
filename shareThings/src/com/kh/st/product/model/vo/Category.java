package com.kh.st.product.model.vo;

public class Category implements java.io.Serializable{

	private int ctId;
	private int ctLevel;
	private String ctName;
	private int prtctId;
	
	public Category() {}

	public Category(int ctId, int ctLevel, String ctName, int prtctId) {
		super();
		this.ctId = ctId;
		this.ctLevel = ctLevel;
		this.ctName = ctName;
		this.prtctId = prtctId;
	}

	public int getCtId() {
		return ctId;
	}

	public int getCtLevel() {
		return ctLevel;
	}

	public String getCtName() {
		return ctName;
	}

	public int getPrtctId() {
		return prtctId;
	}

	public void setCtId(int ctId) {
		this.ctId = ctId;
	}

	public void setCtLevel(int ctLevel) {
		this.ctLevel = ctLevel;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public void setPrtctId(int prtctId) {
		this.prtctId = prtctId;
	}

	@Override
	public String toString() {
		return "Category [ctId=" + ctId + ", ctLevel=" + ctLevel + ", ctName=" + ctName + ", prtctId=" + prtctId + "]";
	}
	
	
	
	
	
}
