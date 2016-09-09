package com.cvtarg.persistence.entities;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;

import com.brujula.locpic.persistence.dao.impl.DaoFactory;
import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.exception.DaoException;

public class BasicEntityTest
{

	protected static DaoInterface<AbstractBasicEntity> basicDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception
	{
		basicDao = DaoFactory.getDao();
	}

	@Before
	public void setUpBefore() throws Exception
	{
		basicDao.beginTransaction();
	}

	@After
	public void setUpAfter() throws Exception
	{
		basicDao.rollbackTransaction();
	}

	@AfterClass
	public static void closeEntityManager() throws DaoException
	{
		basicDao.close();
	}
}
