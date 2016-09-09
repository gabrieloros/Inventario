package com.brujula.locpic.persistence.entities;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;

/**
 * The Class BasicEntity.
 * 
 * @author jose.aroca
 */
@MappedSuperclass
public abstract class AbstractBasicEntity implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// public abstract String toString();
}
