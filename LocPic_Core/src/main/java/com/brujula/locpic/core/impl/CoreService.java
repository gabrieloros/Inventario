package com.brujula.locpic.core.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.boEntities.BOUser;
import com.brujula.locpic.core.enums.ResponseCode;
import com.brujula.locpic.persistence.exception.DaoException;
import com.brujula.locpic.service.service.EvidenceService;
import com.brujula.locpic.service.service.UserService;

public class CoreService {

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(CoreService.class);
	private static final String GCM_URL = "https://android.googleapis.com/gcm/send";
	final String API_KEY = "AIzaSyDvp92vbB0wlfMcWriMceKtcEVqms1ugCg";

	public static final int MINUTE_WITHOUT_COVER = 3;

	public LBSResponse AddEvidence(BOEvidence evidence) {
		LBSResponse response = new LBSResponse();
		response.setResponseCode(ResponseCode.KO);

		try {
			if (evidence != null) {

				EvidenceService.AddEvidence(evidence);

				response.setResponseCode(ResponseCode.OK);
				response.setResponseMsg("Evidence Added.");

			} else {
				response.setResponseMsg("Missed parameters. ");
			}
		} catch (DaoException e) {
			LOGGER.debug("Error al guardar la evidencia - " + e.getMessage());
			response.setResponseMsg(e.getMessage());
		}
		return response;
	}

	public LBSResponse GetPics(Filter filter) {
		LBSResponse response = new LBSResponse();
		response.setResponseCode(ResponseCode.KO);

		try {
			List<BOEvidence> serviceResponse = EvidenceService.GetEvidences(filter);
			response.setResult(serviceResponse);
			response.setResponseCode(ResponseCode.OK);
			response.setResponseMsg("Return " + serviceResponse.size() + " pics.");

		} catch (DaoException e) {
			LOGGER.debug("Error al guardar la evidencia - " + e.getMessage());
			response.setResponseMsg(e.getMessage());
		}
		return response;
	}

	public LBSResponse UpdateEvidence(BOEvidence evidence)
	{
		LBSResponse response = new LBSResponse();
		response.setResponseCode(ResponseCode.KO);

		try
		{
			if(evidence != null && evidence.getId()>0){
				EvidenceService.Save(evidence);
	
				response.setResponseCode(ResponseCode.OK);
				response.setResponseMsg("Evidence Updated.");

			} else
			{
				response.setResponseMsg("Missed parameters. ");
			}
		} catch (DaoException e)
		{
			LOGGER.debug("Error al actualizar la evidencia - " + e.getMessage());
			response.setResponseMsg(e.getMessage());
		}
		return response;
	}

	public LBSResponse GetUsers() {
		LBSResponse response = new LBSResponse();
		response.setResponseCode(ResponseCode.KO);

		try {
			List<BOUser> serviceResponse = UserService.GetUsers();
			response.setResult(serviceResponse);
			response.setResponseCode(ResponseCode.OK);
			response.setResponseMsg("Return " + serviceResponse.size() + " users.");

		} catch (DaoException e) {
			LOGGER.debug("Error al guardar la evidencia - " + e.getMessage());
			response.setResponseMsg(e.getMessage());
		}
		return response;
	}
	
	/*public LBSResponse GetEvidenceTypes() {
		LBSResponse response = new LBSResponse();
		response.setResponseCode(ResponseCode.KO);

		try {
			List<String> serviceResponse = EvidenceService.GetEvidence();
			response.setResult(serviceResponse);
			response.setResponseCode(ResponseCode.OK);
			response.setResponseMsg("Return " + serviceResponse.size() + " types.");

		} catch (DaoException e) {
			LOGGER.debug("Error al obtener estados de evidencia - " + e.getMessage());
			response.setResponseMsg(e.getMessage());
		}
		return response;
	}
	*/
	
	

}
