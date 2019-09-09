package com.kh.st.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	private int reportNo;
	private String reject;
	private Date reportDate;
	private int reportUno;
	private int targetUno;
	private String reportCode;
	private String reportUser;
	private String targetUser;
	private String reportResult;
	private Date complateDate;
	private String reportName;
	private String reportContent;
	private int penalty;
	private int sumPenalty;
	private String status;
	
	public Report() {}

	public Report(int reportNo, String reject, Date reportDate, int reportUno, int targetUno, String reportCode,
			String reportUser, String targetUser, String reportResult, Date complateDate, String reportName,
			String reportContent, int penalty, int sumPenalty, String status) {
		super();
		this.reportNo = reportNo;
		this.reject = reject;
		this.reportDate = reportDate;
		this.reportUno = reportUno;
		this.targetUno = targetUno;
		this.reportCode = reportCode;
		this.reportUser = reportUser;
		this.targetUser = targetUser;
		this.reportResult = reportResult;
		this.complateDate = complateDate;
		this.reportName = reportName;
		this.reportContent = reportContent;
		this.penalty = penalty;
		this.sumPenalty = sumPenalty;
		this.status = status;
	}

	/**
	 * @return the reportNo
	 */
	public int getReportNo() {
		return reportNo;
	}

	/**
	 * @return the reject
	 */
	public String getReject() {
		return reject;
	}

	/**
	 * @return the reportDate
	 */
	public Date getReportDate() {
		return reportDate;
	}

	/**
	 * @return the reportUno
	 */
	public int getReportUno() {
		return reportUno;
	}

	/**
	 * @return the targetUno
	 */
	public int getTargetUno() {
		return targetUno;
	}

	/**
	 * @return the reportCode
	 */
	public String getReportCode() {
		return reportCode;
	}

	/**
	 * @return the reportUser
	 */
	public String getReportUser() {
		return reportUser;
	}

	/**
	 * @return the targetUser
	 */
	public String getTargetUser() {
		return targetUser;
	}

	/**
	 * @return the reportResult
	 */
	public String getReportResult() {
		return reportResult;
	}

	/**
	 * @return the complateDate
	 */
	public Date getComplateDate() {
		return complateDate;
	}

	/**
	 * @return the reportName
	 */
	public String getReportName() {
		return reportName;
	}

	/**
	 * @return the reportContent
	 */
	public String getReportContent() {
		return reportContent;
	}

	/**
	 * @return the penalty
	 */
	public int getPenalty() {
		return penalty;
	}

	/**
	 * @return the sumPenalty
	 */
	public int getSumPenalty() {
		return sumPenalty;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param reportNo the reportNo to set
	 */
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	/**
	 * @param reject the reject to set
	 */
	public void setReject(String reject) {
		this.reject = reject;
	}

	/**
	 * @param reportDate the reportDate to set
	 */
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	/**
	 * @param reportUno the reportUno to set
	 */
	public void setReportUno(int reportUno) {
		this.reportUno = reportUno;
	}

	/**
	 * @param targetUno the targetUno to set
	 */
	public void setTargetUno(int targetUno) {
		this.targetUno = targetUno;
	}

	/**
	 * @param reportCode the reportCode to set
	 */
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}

	/**
	 * @param reportUser the reportUser to set
	 */
	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}

	/**
	 * @param targetUser the targetUser to set
	 */
	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}

	/**
	 * @param reportResult the reportResult to set
	 */
	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}

	/**
	 * @param complateDate the complateDate to set
	 */
	public void setComplateDate(Date complateDate) {
		this.complateDate = complateDate;
	}

	/**
	 * @param reportName the reportName to set
	 */
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	/**
	 * @param reportContent the reportContent to set
	 */
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	/**
	 * @param penalty the penalty to set
	 */
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	/**
	 * @param sumPenalty the sumPenalty to set
	 */
	public void setSumPenalty(int sumPenalty) {
		this.sumPenalty = sumPenalty;
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
		return "Report [reportNo=" + reportNo + ", reject=" + reject + ", reportDate=" + reportDate + ", reportUno="
				+ reportUno + ", targetUno=" + targetUno + ", reportCode=" + reportCode + ", reportUser=" + reportUser
				+ ", targetUser=" + targetUser + ", reportResult=" + reportResult + ", complateDate=" + complateDate
				+ ", reportName=" + reportName + ", reportContent=" + reportContent + ", penalty=" + penalty
				+ ", sumPenalty=" + sumPenalty + ", status=" + status + "]";
	}

	
	
	
	
	
	
}
