/**
 * 
 */
package com.brujula.locpic.core.boEntities;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.UserDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.Inventario;
import com.brujula.locpic.persistence.entities.User;

/**
 * @author adolfo.lopez
 * 
 */
public class BOUser extends User
{

	private static final long serialVersionUID = 1L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(BOUser.class);

	protected static UserDaoInterface dao;
	protected static DaoInterface<AbstractBasicEntity> basicDao;

	public BOUser()
	{
	}

	public BOUser(User user)
	{
		if (user != null)
		{
			this.setId(user.getId());
			this.setImei(user.getImei());
			this.setName(user.getName());
			this.setInventories(user.getInventario());
			this.setRol(user.getRol());
		}
	}
	
	public List<BOInventario> getUserInventories(){
		List<BOInventario> response = new ArrayList<BOInventario>();
		if (this.getInventario()!=null){
			for (Inventario inventario : this.getInventario()) {
				BOInventario boInv = new BOInventario(inventario);
			
				response.add(boInv);
			}
		}
		return response;
	}
	

}
