/**
 * Class FKContraintViolationException
 */
package com.brujula.locpic.persistence.exception;

/**
 * @author Mangel
 *
 */
public class FKContraintViolationException extends DaoException
{

	// Constant serialVersionUID.
	private static final long serialVersionUID = -1175671679601252451L;

	public FKContraintViolationException(final String msg, Throwable cause)
	{
		super(msg, cause);
	}

}
