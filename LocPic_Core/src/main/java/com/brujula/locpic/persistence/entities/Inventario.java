package com.brujula.locpic.persistence.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "inventario")
@Cacheable(false)


public class Inventario extends AbstractBasicEntity implements Serializable{

	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "inventario_id_seq")
	@SequenceGenerator(name = "inventario_id_seq", sequenceName = "inventario_id_seq", allocationSize = 1)
	
	private long id;
	
	private String name;
	
	private String iconfunction;
	
	private String pagina;
	
	private String info;
	
	@ManyToMany(mappedBy="inventario")
	private List<User> users;
	
	@OneToMany(mappedBy = "inventario")
	private List<InventoryField> inventoryField;
	
	@OneToMany(mappedBy = "inventario")
	private List<EvidenceDataValue> dataValue ;
	
	public Inventario (){
	
	}
	
	

	public Inventario(long id, String name, String iconfunction,String pagina,String info,List<EvidenceDataValue> dataValue) {
		super();
		this.id = id;
		this.name = name;
		this.iconfunction = iconfunction;
		this.pagina = pagina;
		this.info = info;
		this.dataValue = dataValue;
	}



	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	/**
	 * @return the iconfunction
	 */
	public String getIconfunction() {
		return iconfunction;
	}



	/**
	 * @param iconfunction the iconfunction to set
	 */
	public void setIconfunction(String iconfunction) {
		this.iconfunction = iconfunction;
	}



	public String getPagina() {
		return pagina;
	}



	public void setPagina(String pagina) {
		this.pagina = pagina;
	}



	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}



	public List<User> getUsers() {
		return users;
	}



	public void setUsers(List<User> users) {
		this.users = users;
	}



	public List<InventoryField> getInventoryField() {
		return inventoryField;
	}



	public void setInventoryField(List<InventoryField> inventoryField) {
		this.inventoryField = inventoryField;
	}



	public List<EvidenceDataValue> getDataValue() {
		return dataValue;
	}



	public void setDataValue(List<EvidenceDataValue> dataValue) {
		this.dataValue = dataValue;
	}

	
	

}
