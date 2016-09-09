package com.brujula.locpic.persistence.dao.interfaces;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.exception.*;

/**
 * The Interface DaoInterface.
 * 
 * @param <T>
 *            the generic type
 * @author jose.aroca
 */
public interface DaoInterface<T extends AbstractBasicEntity> extends TransactionalJPA2DaoInterface<T>
{

	/**
	 * Save.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean save(final T entity) throws DaoException;

	/**
	 * Save.
	 * 
	 * @param entites
	 *            the entites
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean save(final List<? extends AbstractBasicEntity> entites) throws DaoException;

	/**
	 * Update.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean update(final T entity) throws DaoException;

	/**
	 * Update.
	 * 
	 * @param entites
	 *            the entites
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean update(final List<? extends AbstractBasicEntity> entites) throws DaoException;

	/**
	 * Delete.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean delete(final T entity) throws DaoException;

	/**
	 * Delete.
	 * 
	 * @param entites
	 *            the entites
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	boolean delete(final List<? extends AbstractBasicEntity> entites) throws DaoException;

	/**
	 * Find.
	 * 
	 * @param <E>
	 *            the element type
	 * @param entity
	 *            the entity
	 * @param entityId
	 *            the entity id
	 * @return the e
	 * @throws DaoException
	 *             the dao exception
	 */
	<E extends AbstractBasicEntity> E find(final Class<E> entity, final Object entityId) throws DaoException;

	/**
	 * Find all.
	 * 
	 * @param <E>
	 *            the element type
	 * @param entity
	 *            the entity
	 * @return the List
	 * @throws DaoException
	 *             the dao exception
	 */
	<E extends AbstractBasicEntity> List<E> findAll(final Class<E> entity) throws DaoException;

	/**
	 * Find all Abstract elements of class entity with field = value.
	 * 
	 * @param <E>
	 *            the element type
	 * @param entity
	 *            the entity
	 * @param field
	 *            the field
	 * @param value
	 *            the value
	 * @return the List
	 * @throws DaoException
	 *             the dao exception
	 */
	<E extends AbstractBasicEntity> List<E> findByParameter(final Class<E> entity, final String field,
			final Object value) throws DaoException;
	
	
	/**
	 * Find all Abstract elements of class entity with field in (values).
	 * 
	 * @param entity
	 * @param field
	 * @param values
	 * @return
	 * @throws DaoException
	 */
	<E extends AbstractBasicEntity> List<E> findByParameterList(final Class<E> entity, final String field,
			final List<? extends Object> values) throws DaoException;
	/**
	 * Find all Abstract elements of class entity for map with field = value.
	 * 
	 * @param <E>
	 *            the element type
	 * @param entity
	 *            the entity
	 * @param parameters
	 *            the parameters
	 * @return the List
	 * @throws DaoException
	 *             the dao exception
	 */
	<E extends AbstractBasicEntity> List<E> findByParameters(final Class<E> entity, final Map<String, Object> parameters)
			throws DaoException;

	/**
	 * Execute query.
	 * 
	 * @param <E>
	 *            the element type
	 * @param query
	 *            the query
	 * @param entity
	 *            the entity
	 * @return the list
	 * @throws DaoException
	 *             the dao exception
	 */
	<E extends AbstractBasicEntity> List<E> executeTypedQuery(final String query, final Class<E> entity)
			throws DaoException;

	/**
	 * Execute query.
	 * 
	 * @param <E>
	 *            the element type
	 * @param query
	 *            the query
	 * @param entity
	 *            the entity
	 * @param parameters
	 *            List of parameters
	 * @return the list
	 * @throws DaoException
	 *             the dao exception
	 */
	public <E extends AbstractBasicEntity> List<E> executeTypedQuery(final String query, final Class<E> entity,
			Map<String, Object> parameters) throws DaoException;

	public void setEntityManager(final EntityManager entityManager);

	Object executeSingleResultQuery(String query) throws DaoException;

	Object executeSingleResultNativeQuery(String query) throws DaoException;

}
