package com.kh.st.customerService.model.vo;

import java.util.Date;

public class Cs implements java.io.Serializable{

	private int cno;
	private int pno;
	private Date cDate;
	private String cContent;
	private String cCategory;
	private String cReply;
	private int uno;
	private String cType;
	private int cCount;
	
	public Cs() {}

	public Cs(int cno, int pno, Date cDate, String cContent, String cCategory, String cReply, int uno, String cType,
			int cCount) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.cDate = cDate;
		this.cContent = cContent;
		this.cCategory = cCategory;
		this.cReply = cReply;
		this.uno = uno;
		this.cType = cType;
		this.cCount = cCount;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcCategory() {
		return cCategory;
	}

	public void setcCategory(String cCategory) {
		this.cCategory = cCategory;
	}

	public String getcReply() {
		return cReply;
	}

	public void setcReply(String cReply) {
		this.cReply = cReply;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getcType() {
		return cType;
	}

	public void setcType(String cType) {
		this.cType = cType;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	@Override
	public String toString() {
		return "Cs [cno=" + cno + ", pno=" + pno + ", cDate=" + cDate + ", cContent=" + cContent + ", cCategory="
				+ cCategory + ", cReply=" + cReply + ", uno=" + uno + ", cType=" + cType + ", cCount=" + cCount + "]";
	}
	
	
}
