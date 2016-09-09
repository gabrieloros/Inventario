package com.brujula.locpic.persistence.dao.impl;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.EvidenceDaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.InventarioDaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.UserDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.utils.FileHelper;

// TODO: Auto-generated Javadoc
/**
 * A factory for creating Dao objects.
 * 
 * @param <E>
 *            the element type
 */
public final class DaoFactory
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(DaoFactory.class);

	/**
	 * The entity manager factory. Initialized only one time.
	 * */
	private static EntityManagerFactory emFactory;

	/**
	 * Map content entityManagers. one per request.
	 * */
	private static ConcurrentHashMap<Long, EntityManager> mapRequestEntityManagers;

	static
	{
		try
		{
			LOGGER.info("**** PERSISTENCE: Begin Hibernate configuration only one time per application");

			Map<String, String> properties = FileHelper.getProperties("/persistence.properties");
			String puName = properties.get("persistence.unit.name");
			emFactory = Persistence.createEntityManagerFactory(puName, properties);

			// Inicializamos el map de los entitymanager
			mapRequestEntityManagers = new ConcurrentHashMap<Long, EntityManager>();

			LOGGER.info("**** PERSISTENCE: End Hibernate configuration");

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new ExceptionInInitializerError(e);
		} catch (Exception e)
		{

			LOGGER.error(e.getMessage());
			throw new ExceptionInInitializerError(e);
		}

	}

	/**
	 * Instantiates a new dao factory.
	 */
	private DaoFactory()
	{

	}

	/**
	 * Close entity manager.
	 * 
	 * @return true, if successful
	 */
	public static boolean closeEntityManager()
	{
		LOGGER.debug("PERSISTENCE: BEGIN closeEntityManager.");
		boolean close = false;
		try
		{
			EntityManager entityManager = null;

			Long idThread = Thread.currentThread().getId();

			if (mapRequestEntityManagers != null && mapRequestEntityManagers.containsKey(idThread))
			{ // Exist entityManager for Thread (request)
				entityManager = mapRequestEntityManagers.get(idThread);
				if (entityManager != null && entityManager.isOpen())
				{
					entityManager.close();
					mapRequestEntityManagers.remove(idThread);

					LOGGER.debug("**** PERSISTENCE:Close and remove entitymanager objectId: "
							+ entityManager.hashCode() + " Thread: " + idThread);
					close = true;
				} else
				{
					LOGGER.error("**** PERSISTENCE: ERROR ATEMPT TO CLOSE ENTITYMANAGER WITH THREAD KEY = " + idThread
							+ " AND IT WAS CLOSED BEFORE!");
				}
			} else
			{
				LOGGER.error("**** PERSISTENCE: ERROR ATEMPT TO CLOSE ENTITYMANAGER WITH THREAD KEY = " + idThread
						+ " AND IT DOES NOT EXIST!");
			}

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new ExceptionInInitializerError(e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new ExceptionInInitializerError(e);
		}

		LOGGER.debug("PERSISTENCE: END closeEntityManager.");
		return close;

	}

	/**
	 * Override the default clone method in order to disable this option.
	 * 
	 * @return the object
	 * @throws CloneNotSupportedException
	 *             the clone not supported exception
	 */
	@Override
	public Object clone() throws CloneNotSupportedException
	{
		throw new CloneNotSupportedException();
	}

	/**
	 * Gets the dao.
	 * 
	 * @return the dao
	 */
	public static DaoInterface<AbstractBasicEntity> getDao()
	{
		// CREAMOS LAS INSTANCIAS DE LOS DAOS
		JPA2DaoImpl<AbstractBasicEntity> JPA2DAO = new JPA2DaoImpl<AbstractBasicEntity>();
		try
		{
			// get entityManager for request and setter it into DAO
			EntityManager entityManager = emFactory.createEntityManager();
			JPA2DAO.setEntityManager(entityManager);
			LOGGER.debug("**** PERSISTENCE: setter EntityManager objectId: " + entityManager.hashCode()
					+ " FOR THREAD: " + Thread.currentThread().getId());
		} catch (Exception e)
		{
			LOGGER.error("Error sucess when try to getHeadlineDao.");
			throw new ExceptionInInitializerError(e);
		}
		return JPA2DAO;
	}

	private static EntityManager getEntityManager()
	{
		LOGGER.debug("PERSISTENCE: BEGIN getEntityManager.");
		EntityManager entityManager = null;
		try
		{
			Long idThread = Thread.currentThread().getId();

			if (mapRequestEntityManagers != null && mapRequestEntityManagers.containsKey(idThread))
			{ // Exist entityManager for Thread (request)
				entityManager = mapRequestEntityManagers.get(idThread);

				LOGGER.debug("**** PERSISTENCE: ENCOUNTRED EntityManager objectId: " + entityManager.hashCode()
						+ " For Thread key =" + idThread);
			} else
			{ // No exist entityManager for Thread (request). Create it.
				entityManager = emFactory.createEntityManager();
				mapRequestEntityManagers.put(idThread, entityManager);
				LOGGER.debug("**** PERSISTENCE: CREATE initEntityManager objectId: " + entityManager.hashCode()
						+ " For Thread key =" + idThread);
			}

		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new ExceptionInInitializerError(e);
		}
		LOGGER.debug("PERSISTENCE: END getEntityManager.");
		return entityManager;
	}

	/**
	 * The Evidence dao builder.
	 * 
	 * @return the evidence dao
	 */
	public static EvidenceDaoInterface getEvidenceDao()
	{
		// CREAMOS LAS INSTANCIAS DE LOS DAOS
		EvidenceDaoImpl evidenceDaoImpl = new EvidenceDaoImpl();
		try
		{
			// get entityManager for request and setter it into DAO
			EntityManager entityManager = emFactory.createEntityManager();
			evidenceDaoImpl.setEntityManager(entityManager);
			LOGGER.debug("**** PERSISTENCE: setter EntityManager objectId: " + entityManager.hashCode()
					+ " FOR THREAD: " + Thread.currentThread().getId());
		} catch (Exception e)
		{
			LOGGER.error("Error sucess when try to getClaimDao.");
			throw new ExceptionInInitializerError(e);
		}
		return evidenceDaoImpl;
	}

	/**
	 * The User dao builder.
	 * 
	 * @return the user dao
	 */
	public static UserDaoInterface getUserDao()
	{
		// CREAMOS LAS INSTANCIAS DE LOS DAOS
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		try
		{
			// get entityManager for request and setter it into DAO
			EntityManager entityManager = emFactory.createEntityManager();
			userDaoImpl.setEntityManager(entityManager);
			LOGGER.debug("**** PERSISTENCE: setter EntityManager objectId: " + entityManager.hashCode()
					+ " FOR THREAD: " + Thread.currentThread().getId());
		} catch (Exception e)
		{
			LOGGER.error("Error sucess when try to getClaimDao.");
			throw new ExceptionInInitializerError(e);
		}
		return userDaoImpl;
	}

	/**
	 * The Inventory dao builder.
	 * 
	 * @return the inventory dao
	 */
	public static InventarioDaoInterface getInventoryDao()
	{
		// CREAMOS LAS INSTANCIAS DE LOS DAOS
		InventoryDaoImpl inventoryDaoImpl = new InventoryDaoImpl();
		try
		{
			// get entityManager for request and setter it into DAO
			EntityManager entityManager = emFactory.createEntityManager();
			inventoryDaoImpl.setEntityManager(entityManager);
			LOGGER.debug("**** PERSISTENCE: setter EntityManager objectId: " + entityManager.hashCode()
					+ " FOR THREAD: " + Thread.currentThread().getId());
		} catch (Exception e)
		{
			LOGGER.error("Error sucess when try to getClaimDao.");
			throw new ExceptionInInitializerError(e);
		}
		return inventoryDaoImpl;
	}

}
