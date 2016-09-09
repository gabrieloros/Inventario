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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * The persistent class for the User database table.
 * 
 */
@Entity
@Table(name = "users")
@Cacheable(false)
public class User extends AbstractBasicEntity implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "user_id_seq")
	@SequenceGenerator(name = "user_id_seq", sequenceName = "user_id_seq", allocationSize = 1)
	private long id;

	private String imei;

	private String name;
	
	private String username;
	
	private String pass;
	
	private String rol;

	// bi-directional one-to-one association to user
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
		      name="users_inventario",
		      joinColumns=@JoinColumn(name="idusuario", referencedColumnName="id"),
		      inverseJoinColumns=@JoinColumn(name="idinventario", referencedColumnName="id"))
	
	private List<Inventario> inventario;
	
	public User()
	
	{
		
	}

	public User(long id, String imei, String name, String username, String pass,String rol) {
		super();
		this.id = id;
		this.imei = imei;
		this.name = name;
		this.username = username;
		this.pass = pass;
		this.rol = rol;
	}

	public List<Inventario> getInventario() {
		return inventario;
	}

	public void setInventories(List<Inventario> inventario) {
		this.inventario = inventario;
	}

	/**
	 * @return the id
	 */
	public long getId()
	{
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id)
	{
		this.id = id;
	}

	/**
	 * @return the imei
	 */
	public String getImei()
	{
		return imei;
	}

	/**
	 * @param imei
	 *            the imei to set
	 */
	public void setImei(String imei)
	{
		this.imei = imei;
	}

	/**
	 * @return the name
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name)
	{
		this.name = name;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPass() {
		return pass;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}
	
	

}