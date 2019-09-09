package com.kh.st.attachment.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{

	private int ano;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String aType;
	private int bno;
	private int nno;
	private int chkNo;
	private int csNo;
	
	public Attachment() {}

	public Attachment(int ano, String originName, String changeName, String filePath, Date uploadDate, int fileLevel,
			String aType, int bno, int nno, int chkNo, int csNo) {
		super();
		this.ano = ano;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.aType = aType;
		this.bno = bno;
		this.nno = nno;
		this.chkNo = chkNo;
		this.csNo = csNo;
	}

	/**
	 * @return the ano
	 */
	public int getAno() {
		return ano;
	}

	/**
	 * @return the originName
	 */
	public String getOriginName() {
		return originName;
	}

	/**
	 * @return the changeName
	 */
	public String getChangeName() {
		return changeName;
	}

	/**
	 * @return the filePath
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * @return the uploadDate
	 */
	public Date getUploadDate() {
		return uploadDate;
	}

	/**
	 * @return the fileLevel
	 */
	public int getFileLevel() {
		return fileLevel;
	}

	/**
	 * @return the aType
	 */
	public String getaType() {
		return aType;
	}

	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}

	/**
	 * @return the nno
	 */
	public int getNno() {
		return nno;
	}

	/**
	 * @return the chkNo
	 */
	public int getChkNo() {
		return chkNo;
	}

	/**
	 * @return the csNo
	 */
	public int getCsNo() {
		return csNo;
	}

	/**
	 * @param ano the ano to set
	 */
	public void setAno(int ano) {
		this.ano = ano;
	}

	/**
	 * @param originName the originName to set
	 */
	public void setOriginName(String originName) {
		this.originName = originName;
	}

	/**
	 * @param changeName the changeName to set
	 */
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	/**
	 * @param filePath the filePath to set
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**
	 * @param uploadDate the uploadDate to set
	 */
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	/**
	 * @param fileLevel the fileLevel to set
	 */
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	/**
	 * @param aType the aType to set
	 */
	public void setaType(String aType) {
		this.aType = aType;
	}

	/**
	 * @param bno the bno to set
	 */
	public void setBno(int bno) {
		this.bno = bno;
	}

	/**
	 * @param nno the nno to set
	 */
	public void setNno(int nno) {
		this.nno = nno;
	}

	/**
	 * @param chkNo the chkNo to set
	 */
	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}

	/**
	 * @param csNo the csNo to set
	 */
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Attachment [ano=" + ano + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", aType=" + aType + ", bno="
				+ bno + ", nno=" + nno + ", chkNo=" + chkNo + ", csNo=" + csNo + "]";
	}
	
	
	
}
