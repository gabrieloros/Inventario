package com.brujula.locpic.persistence.exception;

// TODO: Auto-generated Javadoc
/**
 * The Class DaoException.
 */
public class DaoException extends Exception
{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Instantiates a new dao exception.
	 * 
	 * @param idEntity
	 *            the id entity
	 * @param cause
	 *            the cause
	 */
	public DaoException(final int idEntity, final Throwable cause)
	{
		super("DAO: " + idEntity, cause);
	}

	/**
	 * Instantiates a new dao exception.
	 * 
	 * @param cause
	 *            the cause
	 */
	public DaoException(final Throwable cause)
	{
		super("DAO: " + cause.getMessage(), cause);
	}

	/**
	 * Instantiates a new dao exception.
	 * 
	 * @param cause
	 *            the cause
	 */
	public DaoException(final String cause)
	{
		super("DAO: " + cause);
	}

	/**
	 * Instantiates a new dao exception.
	 * 
	 * @param msg
	 *            the msg
	 * @param cause
	 *            the cause
	 */
	public DaoException(final String msg, Throwable cause)
	{
		super("DAO: " + msg, cause);
	}
}
