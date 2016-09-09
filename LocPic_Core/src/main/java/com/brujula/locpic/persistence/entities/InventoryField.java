package com.brujula.locpic.persistence.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * The persistent class for the Evidence field database table.
 * 
 */
@Entity
@Cacheable(false)
public class InventoryField extends AbstractBasicEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "inventoryfield_id_seq")
	@SequenceGenerator(name = "inventoryfield_id_seq", sequenceName = "inventoryfield_id_seq", allocationSize = 1)
	private long id;

	private long idInventario;

	@ManyToOne(fetch=FetchType.EAGER)
	private Inventario inventario;
	
	
	//@JoinColumn(name="idevidence", insertable=false, updatable=false)

	private String nombreCampo;
	
//	@OneToMany(mappedBy = "inventoryfield")
//	private List<EvidenceFieldValue> fieldValues;
	
	

	public InventoryField() {
		
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getIdInventario() {
		return idInventario;
	}

	public void setIdInventario(long idInventario) {
		this.idInventario = idInventario;
	}

	public Inventario getInventario() {
		return inventario;
	}

	public void setInventario(Inventario inventario) {
		this.inventario = inventario;
	}

	public String getNombreCampo() {
		return nombreCampo;
	}

	public void setNombreCampo(String nombreCampo) {
		this.nombreCampo = nombreCampo;
	}

//	public List<EvidenceFieldValue> getFieldValues() {
//		return fieldValues;
//	}
//
//	public void setFieldValues(List<EvidenceFieldValue> fieldValues) {
//		this.fieldValues = fieldValues;
//	}
//	
	
	

	
	
}