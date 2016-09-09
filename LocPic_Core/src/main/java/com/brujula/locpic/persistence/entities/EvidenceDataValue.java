package com.brujula.locpic.persistence.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * The persistent class for the Evidence field database table.
 * 
 */
@Entity
@Cacheable(false)
public class EvidenceDataValue extends AbstractBasicEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "evidencedatavalue_seq")
	@SequenceGenerator(name = "evidencedatavalue_seq", sequenceName = "evidencedatavalue_seq", allocationSize = 1)
	private long id;
	
	private String code;
	
	private String value;
	
	private int field;
	
	private long idinventario;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idinventario", insertable=false, updatable=false)
	private Inventario inventario;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}



	

	public int getField() {
		return field;
	}

	public void setField(int field) {
		this.field = field;
	}

	public long getIdinventario() {
		return idinventario;
	}

	public void setIdinventario(long idinventario) {
		this.idinventario = idinventario;
	}

	public Inventario getInventario() {
		return inventario;
	}

	public void setInventario(Inventario inventario) {
		this.inventario = inventario;
	}
	
}
	
	