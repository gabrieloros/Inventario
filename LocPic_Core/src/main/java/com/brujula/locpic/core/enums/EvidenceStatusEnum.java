package com.brujula.locpic.core.enums;

/**
 * @author adolfo.lopez
 * @version 1.0
 * @created 29-may-2016 12:30:26
 */

public enum EvidenceStatusEnum {

	OK(1, "Ok"), ROTA(2, "Rota"), FALTA(3, "Falta"), PODA(4, "Poda");
	
	private final int code;
	private String description;

	private EvidenceStatusEnum(final int code, final String description) {
		this.code = code;
		this.description = description;
	}

	public static EvidenceStatusEnum statusByDescription(String typeName) {
		EvidenceStatusEnum response = null;

		if (typeName != null) {
			EvidenceStatusEnum[] types = EvidenceStatusEnum.values();
			for (EvidenceStatusEnum evidenceStatusEnum : types) {
				if (typeName.trim().equals(evidenceStatusEnum.getDescription())) {
					response = evidenceStatusEnum;
					break;
				}
			}
		}

		return response;
	}

	public int getCode() {
		return code;
	}

	public void setDescription(String message) {
		this.description = message;
	}

	public String getDescription() {
		return this.description;
	}

}
