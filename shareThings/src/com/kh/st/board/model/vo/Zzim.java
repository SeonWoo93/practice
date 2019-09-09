package com.kh.st.board.model.vo;

public class Zzim implements java.io.Serializable {

	private int zno;
	private int pno;
	private int uno;
	
	public Zzim() {}

	public Zzim(int zno, int pno, int uno) {
		super();
		this.zno = zno;
		this.pno = pno;
		this.uno = uno;
	}

	/**
	 * @return the zno
	 */
	public int getZno() {
		return zno;
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
	 * @param zno the zno to set
	 */
	public void setZno(int zno) {
		this.zno = zno;
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Zzim [zno=" + zno + ", pno=" + pno + ", uno=" + uno + "]";
	}
	
	
}
