package com.brujula.locpic.persistence.entities;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

/**
 * The persistent class for the Evidence field database table.
 * 
 */
@Entity
@Cacheable(false)
public class EvidenceField extends AbstractBasicEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "evidencefield_id_seq")
	@SequenceGenerator(name = "evidencefield_id_seq", sequenceName = "evidencefield_id_seq", allocationSize = 1)
	private long id;

	private long idEvidence;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idevidence", insertable=false, updatable=false)
	private Evidence evidence;

	private String fieldName;
	
	private String value;
	
	public EvidenceField() {
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the idEvidence
	 */
	public long getIdEvidence() {
		return idEvidence;
	}

	/**
	 * @param idEvidence the idEvidence to set
	 */
	public void setIdEvidence(long idEvidence) {
		this.idEvidence = idEvidence;
	}

	/**
	 * @return the fieldName
	 */
	public String getFieldName() {
		return fieldName;
	}

	/**
	 * @param fieldName the fieldName to set
	 */
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	
}