package com.kh.st.rental.model.vo;

import java.sql.Date;

/**
 * @author uukk
 *
 */
public class Rental implements java.io.Serializable {

	private int rtno;
	private int pno;
	private int uno;
	private int dlId;
	private Date rtStartDate;
	private Date rtEndDate;
	private Date rtReqDate;
	private Date rtAccDate;
	private String rtSid;
	private String rtReason;
	
	public Rental() {}

	public Rental(int rtno, int pno, int uno, int dlId, Date rtStartDate, Date rtEndDate, Date rtReqDate,
			Date rtAccDate, String rtSid, String rtReason) {
		super();
		this.rtno = rtno;
		this.pno = pno;
		this.uno = uno;
		this.dlId = dlId;
		this.rtStartDate = rtStartDate;
		this.rtEndDate = rtEndDate;
		this.rtReqDate = rtReqDate;
		this.rtAccDate = rtAccDate;
		this.rtSid = rtSid;
		this.rtReason = rtReason;
	}

	/**
	 * @return the rtno
	 */
	public int getRtno() {
		return rtno;
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
	 * @return the dlId
	 */
	public int getDlId() {
		return dlId;
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
	 * @return the rtReqDate
	 */
	public Date getRtReqDate() {
		return rtReqDate;
	}

	/**
	 * @return the rtAccDate
	 */
	public Date getRtAccDate() {
		return rtAccDate;
	}

	/**
	 * @return the rtSid
	 */
	public String getRtSid() {
		return rtSid;
	}

	/**
	 * @return the rtReason
	 */
	public String getRtReason() {
		return rtReason;
	}

	/**
	 * @param rtno the rtno to set
	 */
	public void setRtno(int rtno) {
		this.rtno = rtno;
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
	 * @param dlId the dlId to set
	 */
	public void setDlId(int dlId) {
		this.dlId = dlId;
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
	 * @param rtReqDate the rtReqDate to set
	 */
	public void setRtReqDate(Date rtReqDate) {
		this.rtReqDate = rtReqDate;
	}

	/**
	 * @param rtAccDate the rtAccDate to set
	 */
	public void setRtAccDate(Date rtAccDate) {
		this.rtAccDate = rtAccDate;
	}

	/**
	 * @param rtSid the rtSid to set
	 */
	public void setRtSid(String rtSid) {
		this.rtSid = rtSid;
	}

	/**
	 * @param rtReason the rtReason to set
	 */
	public void setRtReason(String rtReason) {
		this.rtReason = rtReason;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Rental [rtno=" + rtno + ", pno=" + pno + ", uno=" + uno + ", dlId=" + dlId + ", rtStartDate="
				+ rtStartDate + ", rtEndDate=" + rtEndDate + ", rtReqDate=" + rtReqDate + ", rtAccDate=" + rtAccDate
				+ ", rtSid=" + rtSid + ", rtReason=" + rtReason + "]";
	}

	
	
	
}
