package com.kh.st.rental.model.vo;

import java.sql.Date;

public class Cart implements java.io.Serializable{

	private int cno;
	private int pno;
	private int uno;
	private Date rtStartDate;
	private Date rtEndDate;
	private String status;
	
	public Cart() {}

	public Cart(int cno, int pno, int uno, Date rtStartDate, Date rtEndDate, String status) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.uno = uno;
		this.rtStartDate = rtStartDate;
		this.rtEndDate = rtEndDate;
		this.status = status;
	}

	
	
	
	/**
	 * @return the cno
	 */
	public int getCno() {
		return cno;
	}

	/**
	 * @return the pno
	 */
	public int getPno() {
		return pno;
	}

	/**
	 * @return the uno
	 */
	public int getUno() {
		return uno;
	}

	/**
	 * @return the rtStartDate
	 */
	public Date getRtStartDate() {
		return rtStartDate;
	}

	/**
	 * @return the rtEndDate
	 */
	public Date getRtEndDate() {
		return rtEndDate;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param cno the cno to set
	 */
	public void setCno(int cno) {
		this.cno = cno;
	}

	/**
	 * @param pno the pno to set
	 */
	public void setPno(int pno) {
		this.pno = pno;
	}

	/**
	 * @param uno the uno to set
	 */
	public void setUno(int uno) {
		this.uno = uno;
	}

	/**
	 * @param rtStartDate the rtStartDate to set
	 */
	public void setRtStartDate(Date rtStartDate) {
		this.rtStartDate = rtStartDate;
	}

	/**
	 * @param rtEndDate the rtEndDate to set
	 */
	public void setRtEndDate(Date rtEndDate) {
		this.rtEndDate = rtEndDate;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Cart [cno=" + cno + ", pno=" + pno + ", uno=" + uno + ", rtStartDate=" + rtStartDate + ", rtEndDate="
				+ rtEndDate + ", status=" + status + "]";
	}
	
	
}
