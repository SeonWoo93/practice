package com.kh.st.member.model.vo;

public class Rreason implements java.io.Serializable{

	private String reportCode;
	private String reportName;
	private int penalty;
	
	public Rreason() {}
	
	public Rreason(String reportCode, String reportName, int penalty) {
		super();
		this.reportCode = reportCode;
		this.reportName = reportName;
		this.penalty = penalty;
	}
	/**
	 * @return the reportCode
	 */
	public String getReportCode() {
		return reportCode;
	}
	/**
	 * @return the reportName
	 */
	public String getReportName() {
		return reportName;
	}
	/**
	 * @return the penalty
	 */
	public int getPenalty() {
		return penalty;
	}
	/**
	 * @param reportCode the reportCode to set
	 */
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	/**
	 * @param reportName the reportName to set
	 */
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	/**
	 * @param penalty the penalty to set
	 */
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Rreason [reportCode=" + reportCode + ", reportName=" + reportName + ", penalty=" + penalty + "]";
	}
	
	
}
