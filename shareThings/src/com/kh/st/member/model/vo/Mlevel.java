package com.kh.st.member.model.vo;

import java.io.Serializable;

public class Mlevel implements Serializable{
	private String levelCode;
	private String levelName;
	private int perPoint;
	private int levelStd;
	
	public Mlevel() {}

	public Mlevel(String levelCode, String levelName, int perPoint, int levelStd) {
		super();
		this.levelCode = levelCode;
		this.levelName = levelName;
		this.perPoint = perPoint;
		this.levelStd = levelStd;
	}

	public String getLevelCode() {
		return levelCode;
	}

	public String getLevelName() {
		return levelName;
	}

	public int getPerPoint() {
		return perPoint;
	}

	public int getLevelStd() {
		return levelStd;
	}

	public void setLevelCode(String levelCode) {
		this.levelCode = levelCode;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public void setPerPoint(int perPoint) {
		this.perPoint = perPoint;
	}

	public void setLevelStd(int levelStd) {
		this.levelStd = levelStd;
	}

	@Override
	public String toString() {
		return "Mlevel [levelCode=" + levelCode + ", levelName=" + levelName + ", perPoint=" + perPoint + ", levelStd="
				+ levelStd + "]";
	}

	
	
	
}
