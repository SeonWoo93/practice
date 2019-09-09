package com.kh.st.adProduct.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdProduct implements Serializable{
	private int pno;	//물품번호
	private int uno;	//회원번호
	private String pWriter;	//등록자
	private Date pstartDate;	//등록 시작일
	private Date pendDate;	//등록 종료일
	private int price; //가격
	private int deposit; //보증금
	private int dlFreeAmout;	//배송비 무료
	private String model;	//모델명
	private int ctgId;	//물품 코드
	private String ctgName;	//물품명
	private Date purchaseDate;	//구입시기
	private int purchasePrice;	//구입가격
	private String asHistory;	//최근 AS이력
	private String condition;	//물품상태
	private String sid;	//물품 상태코드
	private String status;	//상태코드 명(렌탈중, 창고적재 ...)
	
	public AdProduct() {}

	public AdProduct(int pno, int uno, String pWriter, Date pstartDate, Date pendDate, int price, int deposit,
			int dlFreeAmout, String model, int ctgId, String ctgName, Date purchaseDate, int purchasePrice,
			String asHistory, String condition, String sid, String status) {
		super();
		this.pno = pno;
		this.uno = uno;
		this.pWriter = pWriter;
		this.pstartDate = pstartDate;
		this.pendDate = pendDate;
		this.price = price;
		this.deposit = deposit;
		this.dlFreeAmout = dlFreeAmout;
		this.model = model;
		this.ctgId = ctgId;
		this.ctgName = ctgName;
		this.purchaseDate = purchaseDate;
		this.purchasePrice = purchasePrice;
		this.asHistory = asHistory;
		this.condition = condition;
		this.sid = sid;
		this.status = status;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getpWriter() {
		return pWriter;
	}

	public void setpWriter(String pWriter) {
		this.pWriter = pWriter;
	}

	public Date getPstartDate() {
		return pstartDate;
	}

	public void setPstartDate(Date pstartDate) {
		this.pstartDate = pstartDate;
	}

	public Date getPendDate() {
		return pendDate;
	}

	public void setPendDate(Date pendDate) {
		this.pendDate = pendDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getDlFreeAmout() {
		return dlFreeAmout;
	}

	public void setDlFreeAmout(int dlFreeAmout) {
		this.dlFreeAmout = dlFreeAmout;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getCtgId() {
		return ctgId;
	}

	public void setCtgId(int ctgId) {
		this.ctgId = ctgId;
	}

	public String getCtgName() {
		return ctgName;
	}

	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public String getAsHistory() {
		return asHistory;
	}

	public void setAsHistory(String asHistory) {
		this.asHistory = asHistory;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdProduct [pno=" + pno + ", uno=" + uno + ", pWriter=" + pWriter + ", pstartDate=" + pstartDate
				+ ", pendDate=" + pendDate + ", price=" + price + ", deposit=" + deposit + ", dlFreeAmout="
				+ dlFreeAmout + ", model=" + model + ", ctgId=" + ctgId + ", ctgName=" + ctgName + ", purchaseDate="
				+ purchaseDate + ", purchasePrice=" + purchasePrice + ", asHistory=" + asHistory + ", condition="
				+ condition + ", sid=" + sid + ", status=" + status + "]";
	}
}
