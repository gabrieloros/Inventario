package com.brujula.locpic.persistence.entities;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "userInventario")
@Cacheable(false)

public class UserInventario extends AbstractBasicEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "userInventario_id_seq")
	@SequenceGenerator(name = "userInventario_id_seq", sequenceName = "userInventario_id_seq", allocationSize = 1)
	
	private long id;
	
	private long idInventario;
	
	private long idUser;

	private User userTabla;
	
	private Inventario inventarioTabla;
	
	

	public UserInventario() {
	
		userTabla = new User();
		
		inventarioTabla = new Inventario ();
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



	public long getIdUser() {
		return idUser;
	}



	public void setIdUser(long idUser) {
		this.idUser = idUser;
	}



	public User getUser() {
		return userTabla;
	}



	public void setUser(User user) {
		userTabla.setId(user.getId());
		userTabla.setImei(user.getImei());
		userTabla.setName(user.getName());
		userTabla.setPass(user.getPass());
		userTabla.setUsername(user.getUsername());
		
	}
	
	public Inventario getInventarioTabla() {
		return inventarioTabla;
	}



	public void setInventarioTabla(Inventario inventario) {
		inventarioTabla.setId(inventario.getId());
		inventarioTabla.setName(inventario.getName());
		
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
