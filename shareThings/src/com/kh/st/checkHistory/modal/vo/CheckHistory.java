package com.kh.st.checkHistory.modal.vo;

import java.io.Serializable;
import java.sql.Date;

public class CheckHistory implements Serializable{
	private int chkNo;	//검수번호
	private int pno;	//물품 번호
	private Date chkDate;	//검수 일자
	private String chkContent;	//검수내용
	private String chkAttach;	//검수 이미지 경로
	private String checker;	//검수자
	private String userName;	//등록자
	private int checkCode;	//검수 코드
	private String Status;	//물품 상태
	
	public CheckHistory() {}

	public CheckHistory(int chkNo, int pno, Date chkDate, String chkContent, String chkAttach, String checker,
			String userName, int checkCode, String status) {
		super();
		this.chkNo = chkNo;
		this.pno = pno;
		this.chkDate = chkDate;
		this.chkContent = chkContent;
		this.chkAttach = chkAttach;
		this.checker = checker;
		this.userName = userName;
		this.checkCode = checkCode;
		Status = status;
	}

	public int getChkNo() {
		return chkNo;
	}

	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public Date getChkDate() {
		return chkDate;
	}

	public void setChkDate(Date chkDate) {
		this.chkDate = chkDate;
	}

	public String getChkContent() {
		return chkContent;
	}

	public void setChkContent(String chkContent) {
		this.chkContent = chkContent;
	}

	public String getChkAttach() {
		return chkAttach;
	}

	public void setChkAttach(String chkAttach) {
		this.chkAttach = chkAttach;
	}

	public String getChecker() {
		return checker;
	}

	public void setChecker(String checker) {
		this.checker = checker;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(int checkCode) {
		this.checkCode = checkCode;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "CheckHistory [chkNo=" + chkNo + ", pno=" + pno + ", chkDate=" + chkDate + ", chkContent=" + chkContent
				+ ", chkAttach=" + chkAttach + ", checker=" + checker + ", userName=" + userName + ", checkCode="
				+ checkCode + ", Status=" + Status + "]";
	}
}
