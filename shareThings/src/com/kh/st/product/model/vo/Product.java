package com.kh.st.product.model.vo;

import java.sql.Date;

public class Product {

   private int pno;
   private int uno;
   private Date pStartDate;
   private Date pEndDate;
   private int price;
   private int deposite;
   private int dlFreeAmount;
   private String model;
   private int ctgId;
   private Date purchaseDate;
   private int purchasePrice;
   private String asHistory;
   private String condition;
   private String sid;
  
   public Product() {}
   
   
   
   public Product(int pno, int uno, Date pStartDate, Date pEndDate, int price, int deposite, int dlFreeAmount,
		String model, int ctgId, Date purchaseDate, int purchasePrice, String asHistory, String condition, String sid) {
	   super();
	   this.pno = pno;
	   this.uno = uno;
	   this.pStartDate = pStartDate;
	   this.pEndDate = pEndDate;
	   this.price = price;
	   this.deposite = deposite;
	   this.dlFreeAmount = dlFreeAmount;
	   this.model = model;
	   this.ctgId = ctgId;
	   this.purchaseDate = purchaseDate;
	   this.purchasePrice = purchasePrice;
	   this.asHistory = asHistory;
	   this.condition = condition;
	   this.sid = sid;
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
	 * @return the pStartDate
	 */
	public Date getpStartDate() {
		return pStartDate;
	}
	
	
	
	/**
	 * @return the pEndDate
	 */
	public Date getpEndDate() {
		return pEndDate;
	}
	
	
	
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	
	
	
	/**
	 * @return the deposite
	 */
	public int getDeposite() {
		return deposite;
	}
	
	
	
	/**
	 * @return the dlFreeAmount
	 */
	public int getDlFreeAmount() {
		return dlFreeAmount;
	}
	
	
	
	/**
	 * @return the model
	 */
	public String getModel() {
		return model;
	}
	
	
	
	/**
	 * @return the ctgId
	 */
	public int getCtgId() {
		return ctgId;
	}
	
	
	
	/**
	 * @return the purchaseDate
	 */
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	
	
	
	/**
	 * @return the purchasePrice
	 */
	public int getPurchasePrice() {
		return purchasePrice;
	}
	
	
	
	/**
	 * @return the asHistory
	 */
	public String getAsHistory() {
		return asHistory;
	}
	
	
	
	/**
	 * @return the condition
	 */
	public String getCondition() {
		return condition;
	}
	
	
	
	/**
	 * @return the sid
	 */
	public String getSid() {
		return sid;
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
	 * @param pStartDate the pStartDate to set
	 */
	public void setpStartDate(Date pStartDate) {
		this.pStartDate = pStartDate;
	}
	
	
	
	/**
	 * @param pEndDate the pEndDate to set
	 */
	public void setpEndDate(Date pEndDate) {
		this.pEndDate = pEndDate;
	}
	
	
	
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	/**
	 * @param deposite the deposite to set
	 */
	public void setDeposite(int deposite) {
		this.deposite = deposite;
	}
	
	
	
	/**
	 * @param dlFreeAmount the dlFreeAmount to set
	 */
	public void setDlFreeAmount(int dlFreeAmount) {
		this.dlFreeAmount = dlFreeAmount;
	}
	
	
	
	/**
	 * @param model the model to set
	 */
	public void setModel(String model) {
		this.model = model;
	}
	
	
	
	/**
	 * @param ctgId the ctgId to set
	 */
	public void setCtgId(int ctgId) {
		this.ctgId = ctgId;
	}
	
	
	
	/**
	 * @param purchaseDate the purchaseDate to set
	 */
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	
	
	
	/**
	 * @param purchasePrice the purchasePrice to set
	 */
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	
	
	
	/**
	 * @param asHistory the asHistory to set
	 */
	public void setAsHistory(String asHistory) {
		this.asHistory = asHistory;
	}
	
	
	
	/**
	 * @param condition the condition to set
	 */
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
	
	/**
	 * @param sid the sid to set
	 */
	public void setSid(String sid) {
		this.sid = sid;
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Product [pno=" + pno + ", uno=" + uno + ", pStartDate=" + pStartDate + ", pEndDate=" + pEndDate
				+ ", price=" + price + ", deposite=" + deposite + ", dlFreeAmount=" + dlFreeAmount + ", model=" + model
				+ ", ctgId=" + ctgId + ", purchaseDate=" + purchaseDate + ", purchasePrice=" + purchasePrice
				+ ", asHistory=" + asHistory + ", condition=" + condition + ", sid=" + sid + "]";
	}
	
	
   

   

}
