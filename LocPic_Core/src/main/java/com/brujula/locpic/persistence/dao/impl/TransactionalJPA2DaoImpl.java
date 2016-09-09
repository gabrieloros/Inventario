package com.brujula.locpic.persistence.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import javax.persistence.RollbackException;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.dao.interfaces.TransactionalJPA2DaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.exception.DaoException;

/**
 * The Class DaoImpl.
 * 
 * @param <E>
 *            Generic extends BasicEntity
 * @author jose.aroca
 */
public class TransactionalJPA2DaoImpl<E extends AbstractBasicEntity> implements TransactionalJPA2DaoInterface<E>
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(TransactionalJPA2DaoImpl.class);

	/**
	 * The entity manager, initialized one time for request.
	 * */
	protected EntityManager entityManager;

	/**
	 * Begin transaction.
	 * 
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public void beginTransaction() throws DaoException
	{
		try
		{
			LOGGER.debug("*** PRESISNTENCE: beginTransaction on EntityManager objectId: " + entityManager.hashCode());
			entityManager.getTransaction().begin();

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException(" Transaction yet active.", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction begin general error.", e);
		}

	}

	@Override
	public boolean isActive() throws DaoException
	{
		try
		{
			return entityManager.getTransaction().isActive();

		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Problem call isActive Transaction", e);
		}
	}

	/**
	 * Commit transaction.
	 * 
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public void commitTransaction() throws DaoException
	{
		try
		{
			LOGGER.debug("*** PRESISNTENCE: commitTransaction on EntityManager objectId: " + entityManager.hashCode());
			entityManager.getTransaction().commit();

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction is not active.", e);
		} catch (RollbackException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Commit fail.", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error on commit.", e);
		}
	}

	/**
	 * Rollback transaction.
	 * 
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public void rollbackTransaction() throws DaoException
	{
		try
		{
			LOGGER.debug("*** PRESISNTENCE: rollbackTransaction on EntityManager objectId: " + entityManager.hashCode());
			entityManager.getTransaction().rollback();

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction is not active.", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Rollback fail unexpected error.", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error on rollback.", e);
		}
	}

	public void setEntityManager(final EntityManager entityManager)
	{
		LOGGER.debug("**** PERSISTENCE: setEntityManager objectId: " + entityManager.hashCode());
		this.entityManager = entityManager;
	}

	@Override
	public void close() throws DaoException {
		try {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new DaoException("Error closing entityManager.", e);
		}
	}

}