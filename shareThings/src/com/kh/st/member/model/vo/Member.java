package com.kh.st.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int uno;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private Date birthDate;
	private String phone;
	private String email;
	private String address;
	private String subPhone;
	private Date enrollDate;
	private Date modifyDate;
	private String mLevel;
	private int totalPoint;
	private int profits;
	private int penaltyPoint;
	private String optionCheck;
	private String socialLink;
	private String emailVerif;
	private String status;
	
	public Member() {}

	public Member(int uno, String userId, String userPwd, String userName, String gender, Date birthDate, String phone,
			String email, String address, String subPhone, Date enrollDate, Date modifyDate, String mLevel,
			int totalPoint, int profits, int penaltyPoint, String optionCheck, String socialLink, String emailVerif,
			String status) {
		super();
		this.uno = uno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.subPhone = subPhone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.mLevel = mLevel;
		this.totalPoint = totalPoint;
		this.profits = profits;
		this.penaltyPoint = penaltyPoint;
		this.optionCheck = optionCheck;
		this.socialLink = socialLink;
		this.emailVerif = emailVerif;
		this.status = status;
	}

	/**
	 * @return the uno
	 */
	public int getUno() {
		return uno;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @return the userPwd
	 */
	public String getUserPwd() {
		return userPwd;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @return the birthDate
	 */
	public Date getBirthDate() {
		return birthDate;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @return the subPhone
	 */
	public String getSubPhone() {
		return subPhone;
	}

	/**
	 * @return the enrollDate
	 */
	public Date getEnrollDate() {
		return enrollDate;
	}

	/**
	 * @return the modifyDate
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * @return the mLevel
	 */
	public String getmLevel() {
		return mLevel;
	}

	/**
	 * @return the totalPoint
	 */
	public int getTotalPoint() {
		return totalPoint;
	}

	/**
	 * @return the profits
	 */
	public int getProfits() {
		return profits;
	}

	/**
	 * @return the penaltyPoint
	 */
	public int getPenaltyPoint() {
		return penaltyPoint;
	}

	/**
	 * @return the optionCheck
	 */
	public String getOptionCheck() {
		return optionCheck;
	}

	/**
	 * @return the socialLink
	 */
	public String getSocialLink() {
		return socialLink;
	}

	/**
	 * @return the emailVerif
	 */
	public String getEmailVerif() {
		return emailVerif;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param uno the uno to set
	 */
	public void setUno(int uno) {
		this.uno = uno;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @param userPwd the userPwd to set
	 */
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @param birthDate the birthDate to set
	 */
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @param subPhone the subPhone to set
	 */
	public void setSubPhone(String subPhone) {
		this.subPhone = subPhone;
	}

	/**
	 * @param enrollDate the enrollDate to set
	 */
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	/**
	 * @param modifyDate the modifyDate to set
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * @param mLevel the mLevel to set
	 */
	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	/**
	 * @param totalPoint the totalPoint to set
	 */
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	/**
	 * @param profits the profits to set
	 */
	public void setProfits(int profits) {
		this.profits = profits;
	}

	/**
	 * @param penaltyPoint the penaltyPoint to set
	 */
	public void setPenaltyPoint(int penaltyPoint) {
		this.penaltyPoint = penaltyPoint;
	}

	/**
	 * @param optionCheck the optionCheck to set
	 */
	public void setOptionCheck(String optionCheck) {
		this.optionCheck = optionCheck;
	}

	/**
	 * @param socialLink the socialLink to set
	 */
	public void setSocialLink(String socialLink) {
		this.socialLink = socialLink;
	}

	/**
	 * @param emailVerif the emailVerif to set
	 */
	public void setEmailVerif(String emailVerif) {
		this.emailVerif = emailVerif;
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
		return "Member [uno=" + uno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", gender=" + gender + ", birthDate=" + birthDate + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", subPhone=" + subPhone + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", mLevel=" + mLevel + ", totalPoint=" + totalPoint + ", profits=" + profits
				+ ", penaltyPoint=" + penaltyPoint + ", optionCheck=" + optionCheck + ", socialLink=" + socialLink
				+ ", emailVerif=" + emailVerif + ", status=" + status + "]";
	}
	
	
	

}