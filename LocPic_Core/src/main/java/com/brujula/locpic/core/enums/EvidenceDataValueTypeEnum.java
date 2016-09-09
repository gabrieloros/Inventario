package com.brujula.locpic.core.enums;

/**
 * @author adolfo.lopez
 * @version 1.0
 * @created 29-may-2016 12:30:26
 */

public enum EvidenceDataValueTypeEnum {

	TITLE(1), COMMENT(2);

	private final int code;

	private EvidenceDataValueTypeEnum(final int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

}
