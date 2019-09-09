package com.kh.st.member.model.vo;

public class Point {

	private int pointCode;
	private int uno;
	private int rtNo;
	private String type;
	private int pointPrice;
	public Point(int pointCode, int uno, int rtNo, String type, int pointPrice) {
		super();
		this.pointCode = pointCode;
		this.uno = uno;
		this.rtNo = rtNo;
		this.type = type;
		this.pointPrice = pointPrice;
	}
	/**
	 * @return the pointCode
	 */
	public int getPointCode() {
		return pointCode;
	}
	/**
	 * @return the uno
	 */
	public int getUno() {
		return uno;
	}
	/**
	 * @return the rtNo
	 */
	public int getRtNo() {
		return rtNo;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @return the pointPrice
	 */
	public int getPointPrice() {
		return pointPrice;
	}
	/**
	 * @param pointCode the pointCode to set
	 */
	public void setPointCode(int pointCode) {
		this.pointCode = pointCode;
	}
	/**
	 * @param uno the uno to set
	 */
	public void setUno(int uno) {
		this.uno = uno;
	}
	/**
	 * @param rtNo the rtNo to set
	 */
	public void setRtNo(int rtNo) {
		this.rtNo = rtNo;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @param pointPrice the pointPrice to set
	 */
	public void setPointPrice(int pointPrice) {
		this.pointPrice = pointPrice;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Point [pointCode=" + pointCode + ", uno=" + uno + ", rtNo=" + rtNo + ", type=" + type + ", pointPrice="
				+ pointPrice + "]";
	}
	
	
	
	
}
