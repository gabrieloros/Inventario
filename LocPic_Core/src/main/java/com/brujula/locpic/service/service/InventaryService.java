package com.brujula.locpic.service.service;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.boEntities.BOInventario;
import com.brujula.locpic.persistence.dao.impl.DaoFactory;
import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.InventarioDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.Inventario;
import com.brujula.locpic.persistence.entities.User;
import com.brujula.locpic.persistence.exception.DaoException;

/**
 * @author adolfo.lopez
 * 
 */
public class InventaryService
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(InventaryService.class);

	
	protected static InventarioDaoInterface daoInvent = DaoFactory.getInventoryDao();
	protected static DaoInterface<AbstractBasicEntity> basicDao;



	public static BOInventario GetInventoryById(long id) throws DaoException
	{
		LOGGER.info("GetInventoryById. Starting...");

		BOInventario boInventario = null;

		
		Inventario inventario = daoInvent.find(Inventario.class, id);

		if (inventario != null)
		{
			boInventario = new BOInventario(inventario);
		}

		return boInventario;
	}
	
	public static void CrearInventarioBD(BOInventario registroInventario)throws DaoException{
		
		LOGGER.info("RegistrarDB. Starting...");
		
		Inventario invent = new Inventario();
		
		invent.setName(registroInventario.getName());
		invent.setIconfunction(registroInventario.getIconfunction());
		invent.setPagina(registroInventario.getPagina());
		invent.setInfo(registroInventario.getInfo());
//		invent.setUsers(registroInventario.getUsers());
		daoInvent.save(invent);
	}
	public static void ModificarInventarioBD(BOInventario modificarInventario)throws DaoException{
		
		LOGGER.info("RegistrarDB. Starting...");
		
		Inventario invent = new Inventario();
		
		invent.setName(modificarInventario.getName());
		invent.setIconfunction(modificarInventario.getIconfunction());
		invent.setPagina(modificarInventario.getPagina());
		invent.setInfo(modificarInventario.getInfo());
//		invent.setUsers(registroInventario.getUsers());
		daoInvent.update(invent);
	}
	
	public static void EliminarInventarioBD(BOInventario eliminarInventario)throws DaoException{
		
		LOGGER.info("RegistrarDB. Starting...");
		
		Inventario invent = new Inventario();
		
		invent.setName(eliminarInventario.getName());
		invent.setIconfunction(eliminarInventario.getIconfunction());
		invent.setPagina(eliminarInventario.getPagina());
		invent.setInfo(eliminarInventario.getInfo());
//		invent.setUsers(registroInventario.getUsers());
		daoInvent.delete(invent);
	}
	
}
	