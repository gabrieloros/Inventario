package com.brujula.locpic.service.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.boEntities.BOUser;
import com.brujula.locpic.persistence.dao.impl.DaoFactory;
import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.InventarioDaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.UserDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.User;
import com.brujula.locpic.persistence.exception.DaoException;

/**
 * @author adolfo.lopez
 * 
 */
public class UserService
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(UserService.class);

	protected static UserDaoInterface dao = DaoFactory.getUserDao();
	protected static InventarioDaoInterface daoInvent = DaoFactory.getInventoryDao();
	protected static DaoInterface<AbstractBasicEntity> basicDao;

	public static List<BOUser> GetUsers() throws DaoException
	{
		LOGGER.info("GetUsers. Starting...");

		List<BOUser> boUsers = new ArrayList<BOUser>();

		List<User> users = dao.findAll(User.class);

		for (User user : users)
		{
			BOUser boUser = new BOUser(user);
			boUsers.add(boUser);
		}

		return boUsers;
	}

	public static BOUser GetUserByName(String userName) throws DaoException
	{
		LOGGER.info("GetUserByName. Starting...");

		BOUser boUser = null;

		List<User> users = dao.findByParameter(User.class, "name", userName);

		if (users != null && users.size() > 0)
		{
			boUser = new BOUser(users.get(0));
		}

		return boUser;
	}
	
	public static BOUser ValidateUser(String userName, String pass) throws DaoException
	{
		LOGGER.info("ValidateUser. Starting...");

		BOUser boUser = null;

		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("username", userName);
		parameters.put("pass", pass);
		
		List<User> users = dao.findByParameters(User.class, parameters);

		if (users != null && users.size() > 0)
		{
			boUser = new BOUser(users.get(0));
		}
		
		
		return boUser;
	}
	
	public static void RegistrarBD(BOUser registro)throws DaoException{
		
		LOGGER.info("RegistrarDB. Starting...");
		
		User user = new User ();
		
		user.setImei(registro.getImei());
		user.setName(registro.getName());
		user.setUsername(registro.getUsername());
		user.setPass(registro.getPass());
		user.setRol(registro.getRol());
		
		dao.save(user);
		
	}
	
//	public static List<BOInventario> GetInventario() throws DaoException
//	{
//		LOGGER.info("GetInventario. Starting...");
//
//		List<BOUser> boUsers = new ArrayList<BOUser>();
//
//		List<User> users = daoInvent.findByParameter(Inventario.class, "", value)All(User.class);
//
//		for (User user : users)
//		{
//			BOUser boUser = new BOUser(user);
//			boUsers.add(boUser);
//		}
//
//		return boUsers;
//	}
}
