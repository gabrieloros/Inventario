package com.brujula.locpic.core.dto;

public class SendPushMethodResultDTO {

	private Boolean pushSuccess;
	private Boolean httpSuccess;
	private String info;
	
	public Boolean getPushSuccess() {
		return pushSuccess;
	}
	public void setPushSuccess(Boolean pushSuccess) {
		this.pushSuccess = pushSuccess;
	}
	public Boolean getHttpSuccess() {
		return httpSuccess;
	}
	public void setHttpSuccess(Boolean httpSuccess) {
		this.httpSuccess = httpSuccess;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	
	
}
