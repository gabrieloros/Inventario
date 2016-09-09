package com.brujula.locpic.core.enums;

/**
 * @author adolfo.lopez
 * @version 1.0
 * @created 29-may-2012 12:30:26
 */

public enum ResponseCode {

	KO(0), OK(1);

	private final int idResponseCode;
	private String description;

	private ResponseCode(final int idResponseCode) {
		this.idResponseCode = idResponseCode;

	}

	public int getidResponseCode() {
		return idResponseCode;
	}

	public void setDescription(String message) {
		this.description = message;
	}

	public String getDescription() {
		return this.description;
	}

}// end ResponseCode

