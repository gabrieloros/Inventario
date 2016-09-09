package com.brujula.locpic.core.impl;

import java.sql.Timestamp;
import java.util.List;

import com.brujula.locpic.core.boEntities.BOInventario;
import com.brujula.locpic.core.boEntities.BOUser;

public class Filter
{
	private BOUser user;
	private Timestamp dTimefrom;
	private Timestamp dTimeto;
	private List<Long> evidenceIds;
	private String evidenceStatus;
	private String evidenceType;
	private boolean isDeleted;
	private long idInventario;
	

	/**
	 * @return the user
	 */
	public BOUser getUser()
	{
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(BOUser user)
	{
		this.user = user;
	}

	/**
	 * @return the dTimefrom
	 */
	public Timestamp getdTimefrom()
	{
		return dTimefrom;
	}

	/**
	 * @param dTimefrom
	 *            the dTimefrom to set
	 */
	public void setdTimefrom(Timestamp dTimefrom)
	{
		this.dTimefrom = dTimefrom;
	}

	/**
	 * @return the dTimeto
	 */
	public Timestamp getdTimeto()
	{
		return dTimeto;
	}

	/**
	 * @param dTimeto
	 *            the dTimeto to set
	 */
	public void setdTimeto(Timestamp dTimeto)
	{
		this.dTimeto = dTimeto;
	}

	/**
	 * @return the evidenceId
	 */
	public List<Long> getEvidenceIds() {
		return evidenceIds;
	}

	/**
	 * @param evidenceId the evidenceId to set
	 */
	public void setEvidenceIds(List<Long> evidenceIds) {
		this.evidenceIds = evidenceIds;
	}

	/**
	 * @return the isDeleted
	 */
	public boolean isDeleted() {
		return isDeleted;
	}

	/**
	 * @param isDeleted the isDeleted to set
	 */
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	/**
	 * @return the evidenceStatus
	 */
	public String getEvidenceStatus() {
		return evidenceStatus;
	}

	/**
	 * @param evidenceStatus the evidenceStatus to set
	 */
	public void setEvidenceStatus(String evidenceStatus) {
		this.evidenceStatus = evidenceStatus;
	}

	/**
	 * @return the evidenceType
	 */
	public String getEvidenceType() {
		return evidenceType;
	}

	/**
	 * @param evidenceType the evidenceType to set
	 */
	public void setEvidenceType(String evidenceType) {
		this.evidenceType = evidenceType;
	}

	public long getIdInventario() {
		return idInventario;
	}

	public void setIdInventario(long idInventario) {
		this.idInventario = idInventario;
	}

	
	
}
