package com.brujula.locpic.persistence.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityExistsException;
import javax.persistence.LockTimeoutException;
import javax.persistence.PersistenceException;
import javax.persistence.PessimisticLockException;
import javax.persistence.Query;
import javax.persistence.QueryTimeoutException;
import javax.persistence.RollbackException;
import javax.persistence.TransactionRequiredException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.exception.DaoException;
import com.brujula.locpic.persistence.exception.FKContraintViolationException;

/**
 * The Class DaoImpl.
 * 
 * @param <E>
 *            Generic extends BasicEntity
 * @author jose.aroca
 */
public class JPA2DaoImpl<T extends AbstractBasicEntity> extends TransactionalJPA2DaoImpl<T> implements DaoInterface<T>
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(JPA2DaoImpl.class);

	/**
	 * Update. merge entity form object to BD.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean update(final T entity) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			entityManager.merge(entity);
			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException(" IllegalStateException: Error updating entity. ", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException(" Transaction required exception updating entity", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Exception general error updating entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
			entityManager.close();
		}

		return success;
	}

	/**
	 * Save. save entity form object to BD.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean save(final T entity) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			entityManager.persist(entity);
			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (EntityExistsException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Entity exist exception persisting an entity!", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException, object is not entity. Persisting an entity", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required!", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error persisting an entity. Persisting an entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
		}

		return success;
	}

	/**
	 * Delete. delete entity form object to BD.
	 * 
	 * @param entity
	 *            the entity
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean delete(final T entity) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			entityManager.remove(entity);
			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException, object is not entity. Persisting an entity", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required!", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error persisting an entity. Persisting an entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
		}

		return success;
	}

	/**
	 * Save. save a list of entities form object to BD.
	 * 
	 * @param entities
	 *            the entities
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean save(final List<? extends AbstractBasicEntity> entities) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			for (AbstractBasicEntity e : entities)
			{
				entityManager.persist(e);
			}

			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (EntityExistsException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Entity exist exception persisting an entity!", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException, object is not entity. Persisting an entity", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required!", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error persisting an entity. Persisting an entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
		}

		return success;
	}

	/**
	 * Update. update a list of entities form object to BD.
	 * 
	 * @param entities
	 *            the entities
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean update(final List<? extends AbstractBasicEntity> entities) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			for (AbstractBasicEntity e : entities)
			{
				entityManager.merge(e);
			}
			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException(" IllegalStateException: Error updating entity. ", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException(" Transaction required exception updating entity", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Exception general error updating entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
		}

		return success;
	}

	/**
	 * Delete. delete a list of entities form object to BD.
	 * 
	 * @param entities
	 *            the entities
	 * @return true, if successful
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public boolean delete(final List<? extends AbstractBasicEntity> entities) throws DaoException
	{
		boolean success = false;
		boolean ownsTheTransaction = false;
		try
		{
			ownsTheTransaction = this.checkTransactionIsStarted();
			for (AbstractBasicEntity e : entities)
			{
				entityManager.remove(e);
			}
			ownsTheTransaction = this.checkTransactionIsClosed(ownsTheTransaction);
			success = true;

		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException, object is not entity. Deleting an entity", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required!", e);
		} catch (RollbackException e)
		{
			LOGGER.error(e.getMessage());
			throw new FKContraintViolationException("Can not delete entity cause by foreign key violation", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error persisting an entity. Deleting an entity", e);
		} finally
		{
			this.doATransactionRollback(ownsTheTransaction);
		}

		return success;
	}

	/**
	 * Find. find one entity by id.
	 * 
	 * @param entity
	 *            the entity
	 * @param entityId
	 *            the entity id
	 * @return the e
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	public <E extends AbstractBasicEntity> E find(final Class<E> entity, final Object entityId) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: find object: " + entityId);
		try
		{
			final E resultEntity = entityManager.find(entity, entityId);
			return resultEntity;
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException object is not a entity or entityId is not id", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General error find entities", e);
		}

	}

	/**
	 * Find all. find all entities from bd.
	 * 
	 * @param entity
	 *            the entity
	 * @return the List
	 * @throws DaoException
	 *             the dao exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public <E extends AbstractBasicEntity> List<E> findAll(final Class<E> entity) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: findAll entity: " + entity.getSimpleName());

		try
		{
			final CriteriaBuilder cBuilder = entityManager.getCriteriaBuilder();

			final CriteriaQuery<? extends AbstractBasicEntity> criteriaQuery = cBuilder.createQuery(entity);

			criteriaQuery.from(entity);

			final Query query = entityManager.createQuery(criteriaQuery);
			final List<E> list = query.getResultList();

			return list;
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing findAll", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing findAll", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing findAll", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing findAll", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing findAll", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing findAll", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing findAll", e);
		}
	}

	/**
	 * Find all. find all entities by field.
	 * 
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
	@Override
	@SuppressWarnings("unchecked")
	public <E extends AbstractBasicEntity> List<E> findByParameter(final Class<E> entity, final String field,
			final Object value) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: findByParameter field: " + field + " value: " + value);

		try
		{
			final CriteriaBuilder cBuilder = entityManager.getCriteriaBuilder();

			final CriteriaQuery<? extends AbstractBasicEntity> criteriaQuery = cBuilder.createQuery(entity);

			final Root<? extends AbstractBasicEntity> root = criteriaQuery.from(entity);
			criteriaQuery.where(cBuilder.equal(root.get(field), value));

			final Query query = entityManager.createQuery(criteriaQuery);
			final List<E> list = query.getResultList();

			return list;

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing findByParameter", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing findByParameter", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing findByParameter", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing findByParameter", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing findByParameter", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing findByParameter", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing findByParameter", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing findByParameter", e);
		}
	}

	/**
	 * Find all. find all entities by field.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public <E extends AbstractBasicEntity> List<E> findByParameters(final Class<E> entity,
			final Map<String, Object> parameters) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: findByParameters");

		try
		{

			final CriteriaBuilder cBuilder = entityManager.getCriteriaBuilder();

			final CriteriaQuery<? extends AbstractBasicEntity> criteriaQuery = cBuilder.createQuery(entity);

			final Root<? extends AbstractBasicEntity> root = criteriaQuery.from(entity);

			Iterator<String> iterator = parameters.keySet().iterator();

			Predicate predicate = null;
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			while (iterator.hasNext())
			{

				String field = iterator.next();
				Object value = parameters.get(field);

				Predicate predicateAux = cBuilder.equal(root.get(field), value);

				if (predicate == null)
				{
					// Para la primera vez.
					predicate = predicateAux;
				} else
				{
					predicate = criteriaBuilder.and(predicate, predicateAux);
				}
			}

			criteriaQuery.where(predicate);

			final Query query = entityManager.createQuery(criteriaQuery);
			final List<E> list = query.getResultList();

			return list;

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing findByParameters", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing findByParameters", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing findByParameters", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing findByParameters", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing findByParameters", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing findByParameters", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing findByParameters", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing findByParameters", e);
		}
	}

	@Override
	public <E extends AbstractBasicEntity> List<E> executeTypedQuery(final String query, final Class<E> entity)
			throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: executeTypedQuery query: " + query);

		List<E> resultList = null;
		try
		{
			final TypedQuery<E> typedQuery = this.entityManager.createQuery(query, entity);
			resultList = typedQuery.getResultList();

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing executeTypedQuery", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing executeTypedQuery", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing executeTypedQuery", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing executeTypedQuery", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing executeTypedQuery", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing executeTypedQuery", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing executeTypedQuery", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing executeTypedQuery", e);
		}
		return resultList;
	}

	@Override
	public <E extends AbstractBasicEntity> List<E> executeTypedQuery(final String query, final Class<E> entity,
			Map<String, Object> parameters) throws DaoException
	{
		LOGGER.debug("*** PERSISTENCE: executeTypedQuery query: " + query);

		List<E> resultList = null;
		try
		{
			final TypedQuery<E> typedQuery = this.entityManager.createQuery(query, entity);
			if (parameters != null)
			{
				for (String key : parameters.keySet())
				{
					typedQuery.setParameter(key, parameters.get(key));
				}
			}
			resultList = typedQuery.getResultList();

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing executeTypedQuery", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing executeTypedQuery", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing executeTypedQuery", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing executeTypedQuery", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing executeTypedQuery", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing executeTypedQuery", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing executeTypedQuery", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing executeTypedQuery", e);
		}
		return resultList;
	}

	@Override
	public Object executeSingleResultNativeQuery(final String query) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: executeSingleResultQuery query: " + query);
		Object result = null;

		try
		{
			result = this.entityManager.createNativeQuery(query).getSingleResult();

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing executeTypedQuery", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing executeTypedQuery", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing executeTypedQuery", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing executeTypedQuery", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing executeTypedQuery", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing executeTypedQuery", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing executeTypedQuery", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing executeTypedQuery", e);
		}
		return result;
	}

	@Override
	public Object executeSingleResultQuery(final String query) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: executeSingleResultQuery query: " + query);
		Object result = null;

		try
		{
			result = this.entityManager.createQuery(query).getSingleResult();

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing executeTypedQuery", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing executeTypedQuery", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing executeTypedQuery", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing executeTypedQuery", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing executeTypedQuery", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing executeTypedQuery", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing executeTypedQuery", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing executeTypedQuery", e);
		}
		return result;
	}

	/**
	 * Find all. find all entities by field.
	 * 
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
	@Override
	@SuppressWarnings("unchecked")
	public <E extends AbstractBasicEntity> List<E> findByParameterList(final Class<E> entity, final String field,
			final List<? extends Object> values) throws DaoException
	{
		LOGGER.debug("*** PRSISTENCE: findByParameter field: " + field + " values: " + values);

		try
		{
			final CriteriaBuilder cBuilder = entityManager.getCriteriaBuilder();

			final CriteriaQuery<? extends AbstractBasicEntity> criteriaQuery = cBuilder.createQuery(entity);

			final Root<? extends AbstractBasicEntity> root = criteriaQuery.from(entity);
			Expression<String> exp = root.get(field);
			Predicate predicate = exp.in(values);
			criteriaQuery.where(predicate);
			
			final Query query = entityManager.createQuery(criteriaQuery);
			final List<E> list = query.getResultList();

			return list;

		} catch (IllegalArgumentException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalArgumentException executing findByParameter", e);
		} catch (IllegalStateException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("IllegalStateException executing findByParameter", e);
		} catch (QueryTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("QueryTimeoutException executing findByParameter", e);
		} catch (TransactionRequiredException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("Transaction required exception executing findByParameter", e);
		} catch (PessimisticLockException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PessimisticLockException executing findByParameter", e);
		} catch (LockTimeoutException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("LockTimeoutException executing findByParameter", e);
		} catch (PersistenceException e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("PersistenceException executing findByParameter", e);
		} catch (Exception e)
		{
			LOGGER.error(e.getMessage());
			throw new DaoException("General exception executing findByParameter", e);
		}
	}
	
	/**
	 * Check if there is an active transaction. If there is not, begin a new
	 * one.
	 * 
	 * @return
	 */
	private boolean checkTransactionIsStarted()
	{
		final boolean begin = (!entityManager.getTransaction().isActive());
		if (!entityManager.getTransaction().isActive())
		{
			entityManager.getTransaction().begin();
		}
		return begin;
	}

	/**
	 * If the service owns the transaction, commit it.
	 * 
	 * @param ownsTheTransaction
	 * @return
	 */
	private boolean checkTransactionIsClosed(final boolean ownsTheTransaction)
	{
		boolean begin = ownsTheTransaction;
		if (ownsTheTransaction)
		{
			entityManager.getTransaction().commit();
			begin = false;
		}
		return begin;
	}

	/**
	 * If the service owns the transaction, do a rollback on it.
	 * 
	 * @param ownsTheTransaction
	 * @throws DaoException
	 */
	private void doATransactionRollback(final boolean ownsTheTransaction) throws DaoException
	{
		if (ownsTheTransaction)
		{
			try
			{
				if (entityManager.getTransaction().isActive())
				{
				entityManager.getTransaction().rollback();
				}
			} catch (Exception e)
			{
				throw new DaoException("Error performing rollback operation!", e);
			}
		}
	}
}
