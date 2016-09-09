package com.brujula.locpic.core.dto;

public class LoginDTO {
	private long systemuserid;
	private int stateid;
	private int planId;
	private String identiKey;
	private String userpassword;
	private String userlogin;
	private String status;
	private long positionUpdate;
	private String urlPortal;
	private String userName;
	private String latCenter;
	private String longCenter;
	
	public long getSystemuserid() {
		return systemuserid;
	}
	public void setSystemuserid(long systemuserid) {
		this.systemuserid = systemuserid;
	}
	public int getStateid() {
		return stateid;
	}
	public void setStateid(int stateid) {
		this.stateid = stateid;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public String getIdentiKey() {
		return identiKey;
	}
	public void setIdentiKey(String identiKey) {
		this.identiKey = identiKey;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUserlogin() {
		return userlogin;
	}
	public void setUserlogin(String userlogin) {
		this.userlogin = userlogin;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getPositionUpdate() {
		return positionUpdate;
	}
	public void setPositionUpdate(long positionUpdate) {
		this.positionUpdate = positionUpdate;
	}
	public String getUrlPortal() {
		return urlPortal;
	}
	public void setUrlPortal(String urlPortal) {
		this.urlPortal = urlPortal;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLatCenter() {
		return latCenter;
	}
	public void setLatCenter(String latCenter) {
		this.latCenter = latCenter;
	}
	public String getLongCenter() {
		return longCenter;
	}
	public void setLongCenter(String longCenter) {
		this.longCenter = longCenter;
	}

}
