package com.kh.st.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private int bno;
	private int pno;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private Date bDate;
	private Date modifyDate;
	private String bType;
	private int parentBno;
	private int bLevel;
	private int reviewStar;
	private String status;
	
	public Board() {}
	
	public Board(int bno, int pno, String bTitle, String bContent, String bWriter, int bCount, Date bDate,
			Date modifyDate, String bType, int parentBno, int bLevel, int reviewStar, String status) {
		super();
		this.bno = bno;
		this.pno = pno;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.bDate = bDate;
		this.modifyDate = modifyDate;
		this.bType = bType;
		this.parentBno = parentBno;
		this.bLevel = bLevel;
		this.reviewStar = reviewStar;
		this.status = status;
	}
	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}
	/**
	 * @return the pno
	 */
	public int getPno() {
		return pno;
	}
	/**
	 * @return the bTitle
	 */
	public String getbTitle() {
		return bTitle;
	}
	/**
	 * @return the bContent
	 */
	public String getbContent() {
		return bContent;
	}
	/**
	 * @return the bWriter
	 */
	public String getbWriter() {
		return bWriter;
	}
	/**
	 * @return the bCount
	 */
	public int getbCount() {
		return bCount;
	}
	/**
	 * @return the bDate
	 */
	public Date getbDate() {
		return bDate;
	}
	/**
	 * @return the modifyDate
	 */
	public Date getModifyDate() {
		return modifyDate;
	}
	/**
	 * @return the bType
	 */
	public String getbType() {
		return bType;
	}
	/**
	 * @return the parentBno
	 */
	public int getParentBno() {
		return parentBno;
	}
	/**
	 * @return the bLevel
	 */
	public int getbLevel() {
		return bLevel;
	}
	/**
	 * @return the reviewStar
	 */
	public int getReviewStar() {
		return reviewStar;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param bno the bno to set
	 */
	public void setBno(int bno) {
		this.bno = bno;
	}
	/**
	 * @param pno the pno to set
	 */
	public void setPno(int pno) {
		this.pno = pno;
	}
	/**
	 * @param bTitle the bTitle to set
	 */
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	/**
	 * @param bContent the bContent to set
	 */
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	/**
	 * @param bWriter the bWriter to set
	 */
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	/**
	 * @param bCount the bCount to set
	 */
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	/**
	 * @param bDate the bDate to set
	 */
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	/**
	 * @param modifyDate the modifyDate to set
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	/**
	 * @param bType the bType to set
	 */
	public void setbType(String bType) {
		this.bType = bType;
	}
	/**
	 * @param parentBno the parentBno to set
	 */
	public void setParentBno(int parentBno) {
		this.parentBno = parentBno;
	}
	/**
	 * @param bLevel the bLevel to set
	 */
	public void setbLevel(int bLevel) {
		this.bLevel = bLevel;
	}
	/**
	 * @param reviewStar the reviewStar to set
	 */
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
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
		return "Board [bno=" + bno + ", pno=" + pno + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter="
				+ bWriter + ", bCount=" + bCount + ", bDate=" + bDate + ", modifyDate=" + modifyDate + ", bType="
				+ bType + ", parentBno=" + parentBno + ", bLevel=" + bLevel + ", reviewStar=" + reviewStar + ", status="
				+ status + "]";
	}
	
	
	
}
