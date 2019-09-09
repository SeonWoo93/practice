/**
* Comment  : ㅁㄴㅇ
* @version : 1.0.0
* @author  : 최병욱
* @date    : 2019. 5. 20.
*/
package com.kh.st.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nno;
	private String nTitle;
	private String nContent;
	private int nCount;
	private Date nDate;
	private Date modify_Date;
	private String status;
	private String nWriter;
	
	public Notice() {}


	public Notice(int nno, String nTitle, String nContent, int nCount, Date nDate, Date modify_Date, String status,
			String nWriter) {
		super();
		this.nno = nno;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nDate = nDate;
		this.modify_Date = modify_Date;
		this.status = status;
		this.nWriter = nWriter;
	}


	/**
	 * @return the nno
	 */
	public int getNno() {
		return nno;
	}


	/**
	 * @param nno the nno to set
	 */
	public void setNno(int nno) {
		this.nno = nno;
	}


	/**
	 * @return the nTitle
	 */
	public String getnTitle() {
		return nTitle;
	}


	/**
	 * @param nTitle the nTitle to set
	 */
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}


	/**
	 * @return the nContent
	 */
	public String getnContent() {
		return nContent;
	}


	/**
	 * @param nContent the nContent to set
	 */
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}


	/**
	 * @return the nCount
	 */
	public int getnCount() {
		return nCount;
	}


	/**
	 * @param nCount the nCount to set
	 */
	public void setnCount(int nCount) {
		this.nCount = nCount;
	}


	/**
	 * @return the nDate
	 */
	public Date getnDate() {
		return nDate;
	}


	/**
	 * @param nDate the nDate to set
	 */
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}


	/**
	 * @return the modify_Date
	 */
	public Date getModify_Date() {
		return modify_Date;
	}


	/**
	 * @param modify_Date the modify_Date to set
	 */
	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}


	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}


	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * @return the nWriter
	 */
	public String getnWriter() {
		return nWriter;
	}


	/**
	 * @param nWriter the nWriter to set
	 */
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nCount=" + nCount
				+ ", nDate=" + nDate + ", modify_Date=" + modify_Date + ", status=" + status + ", nWriter=" + nWriter
				+ "]";
	}
	
	
	
	
}
