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
public class EvidenceFieldValue extends AbstractBasicEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "evidencefield_idseq")
	@SequenceGenerator(name = "evidencefield_idseq", sequenceName = "evidencefield_idseq", allocationSize = 1)
	private long id;

	private long idEvidence;
	
	private long idInventoryField;
	
	private String value;
	

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idevidence", insertable=false, updatable=false)
	private Evidence evidence;

	//@ManyToOne(fetch=FetchType.EAGER)
	//@JoinColumn(name="idinventoryfield", insertable=false, updatable=false)
	//private InventoryField inventoryfield;
	
	
	

	public EvidenceFieldValue() {
		
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getIdEvidence() {
		return idEvidence;
	}

	public void setIdEvidence(long idEvidence) {
		this.idEvidence = idEvidence;
	}

	public long getIdInventoryField() {
		return idInventoryField;
	}

	public void setIdInventoryField(long idInventoryField) {
		this.idInventoryField = idInventoryField;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Evidence getEvidence() {
		return evidence;
	}

	public void setEvidence(Evidence evidence) {
		this.evidence = evidence;
	}

//	public InventoryField getInventoryfiel() {
//		return inventoryfield;
//	}
//
//	public void setInventoryfiel(InventoryField inventoryfiel) {
//		this.inventoryfield = inventoryfiel;
//	}
//
//	public InventoryField getInventoryfield() {
//		return inventoryfield;
//	}
//
//	public void setInventoryfield(InventoryField inventoryfield) {
//		this.inventoryfield = inventoryfield;
//	}
//	
	
	
	
	
}