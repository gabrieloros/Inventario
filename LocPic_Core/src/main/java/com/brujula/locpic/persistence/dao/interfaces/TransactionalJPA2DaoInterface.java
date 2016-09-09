package com.brujula.locpic.persistence.dao.interfaces;

import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.exception.DaoException;

/**
 * The Interface DaoInterface.
 * 
 * @param <E>
 *            Generic extends BasicEntity
 * @author jose.aroca
 */
public interface TransactionalJPA2DaoInterface<E extends AbstractBasicEntity>
{

	/**
	 * Begin transaction.
	 * 
	 * @return
	 */
	void beginTransaction() throws DaoException;

	/**
	 * Commit transaction.
	 */
	void commitTransaction() throws DaoException;

	/**
	 * Rollback transaction.
	 */
	void rollbackTransaction() throws DaoException;

	/**
	 * is Active transaction.
	 */
	boolean isActive() throws DaoException;
	
	/**
	 * Close entity manager related to a dao.
	 */
	void close() throws DaoException;;

}
