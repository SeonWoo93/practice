package com.kh.st.product.model.vo;

public class PCategory implements java.io.Serializable {

	private int ctgId;
	private int ctgLevel;
	private String ctgName;
	private int parentCtgId;
	
	public PCategory() {}
	
	public PCategory(int ctgId, int ctgLevel, String ctgName, int parentCtgId) {
		super();
		this.ctgId = ctgId;
		this.ctgLevel = ctgLevel;
		this.ctgName = ctgName;
		this.parentCtgId = parentCtgId;
	}
	/**
	 * @return the ctgId
	 */
	public int getCtgId() {
		return ctgId;
	}
	/**
	 * @return the ctgLevel
	 */
	public int getCtgLevel() {
		return ctgLevel;
	}
	/**
	 * @return the ctgName
	 */
	public String getCtgName() {
		return ctgName;
	}
	/**
	 * @return the parentCtgId
	 */
	public int getParentCtgId() {
		return parentCtgId;
	}
	/**
	 * @param ctgId the ctgId to set
	 */
	public void setCtgId(int ctgId) {
		this.ctgId = ctgId;
	}
	/**
	 * @param ctgLevel the ctgLevel to set
	 */
	public void setCtgLevel(int ctgLevel) {
		this.ctgLevel = ctgLevel;
	}
	/**
	 * @param ctgName the ctgName to set
	 */
	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}
	/**
	 * @param parentCtgId the parentCtgId to set
	 */
	public void setParentCtgId(int parentCtgId) {
		this.parentCtgId = parentCtgId;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PCategory [ctgId=" + ctgId + ", ctgLevel=" + ctgLevel + ", ctgName=" + ctgName + ", parentCtgId="
				+ parentCtgId + "]";
	}
	
	
}
