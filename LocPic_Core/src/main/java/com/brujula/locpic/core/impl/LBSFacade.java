package com.brujula.locpic.core.impl;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.interfaces.ServiceFacadeInterface;

public class LBSFacade implements ServiceFacadeInterface
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(LBSFacade.class);

	private CoreService core;

	public LBSFacade()
	{
		core = new CoreService();
	}

	@Override
	public LBSResponse AddEvidence(BOEvidence evidence)
	{

		LOGGER.info("AddEvidence. Starting process...");
		LBSResponse response = new LBSResponse();

		response = core.AddEvidence(evidence);

		LOGGER.info("AddEvidence. Finished.");
		return response;
	}

	@Override
	public LBSResponse GetPics(Filter filter)
	{

		LOGGER.info("GetPics. Starting process...");
		LBSResponse response = new LBSResponse();

		response = core.GetPics(filter);

		LOGGER.info("AddEvidence. Finished.");
		return response;
	}
	
	@Override
	public LBSResponse UpdateEvidence(BOEvidence evidence)
	{

		LOGGER.info("UpdateEvidence. Starting process...");
		LBSResponse response = new LBSResponse();

		response = core.UpdateEvidence(evidence);

		LOGGER.info("UpdateEvidence. Finished.");
		return response;
	}

	@Override
	public LBSResponse GetUsers()
	{

		LOGGER.info("GetUsers. Starting process...");
		LBSResponse response = new LBSResponse();

		response = core.GetUsers();

		LOGGER.info("GetUsers. Finished.");
		return response;
	}

	/*@Override
	public LBSResponse GetEvidenceTypes()
	{

		LOGGER.info("GetEvidenceTypes. Starting process...");
		LBSResponse response = new LBSResponse();

		response = core.GetUsers();

		LOGGER.info("GetEvidenceTypes. Finished.");
		return response;
	}
	*/
	
}
