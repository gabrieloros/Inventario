package com.brujula.locpic.service.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.persistence.dao.impl.DaoFactory;
import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.EvidenceDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.Evidence;
import com.brujula.locpic.persistence.exception.DaoException;

/**
 * @author adolfo.lopez
 * 
 */
public class EvidenceService
{

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(EvidenceService.class);

	protected static EvidenceDaoInterface dao = DaoFactory.getEvidenceDao();
	protected static DaoInterface<AbstractBasicEntity> basicDao;

	public static void AddEvidence(BOEvidence boEvidence) throws DaoException
	{
		LOGGER.info("AddEvidence. Starting...");

		Evidence evidence = new Evidence();
		// evidence.setId(boEvidence.getId());
		evidence.setImei(boEvidence.getImei());
		evidence.setTitle(boEvidence.getTitle());
		evidence.setComment(boEvidence.getComment());
		evidence.setLatitude(boEvidence.getLatitude());
		evidence.setLongitude(boEvidence.getLongitude());
		evidence.setCaptureDTime(boEvidence.getCaptureDTime());
		evidence.setFileName(boEvidence.getFileName());
		evidence.setPhotos(boEvidence.getPhotos());
		evidence.setIdInventario(boEvidence.getIdInventario());
		evidence.setHaspic(boEvidence.getHaspic());

		//dao = DaoFactory.getEvidenceDao();
		dao.save(evidence);
	}

	public static void Save(BOEvidence boEvidence) throws DaoException
	{
		LOGGER.info("AddEvidence. Starting...");
		//dao = DaoFactory.getEvidenceDao();
		
		Evidence evidence = dao.find(Evidence.class, boEvidence.getId());
		// evidence.setId(boEvidence.getId());
		evidence.setImei(boEvidence.getImei());
		evidence.setTitle(boEvidence.getTitle());
		evidence.setComment(boEvidence.getComment());
		evidence.setLatitude(boEvidence.getLatitude());
		evidence.setLongitude(boEvidence.getLongitude());
		evidence.setCaptureDTime(boEvidence.getCaptureDTime());
		evidence.setFileName(boEvidence.getFileName());
		evidence.setPhotos(boEvidence.getPhotos());
		evidence.setCount(boEvidence.getCount());
		evidence.setAddress(boEvidence.getAddress());
		evidence.setCity(boEvidence.getCity());
		evidence.setIdInventario(boEvidence.getIdInventario());
		evidence.setHaspic(boEvidence.getHaspic());
		
		dao.save(evidence);
	}
	
	public static BOEvidence GetEvidence(long id) throws DaoException
	{
		LOGGER.info("GetPics. Starting...");
		BOEvidence boEvidence = null;
		
		Evidence evidence = dao.find(Evidence.class, id);

		if (evidence != null)
		{
			boEvidence = new BOEvidence(evidence);
		}

		return boEvidence;
	}

	public static List<BOEvidence> GetEvidences(Filter filter) throws DaoException
	{
		LOGGER.info("GetPics. Starting...");

		//dao = DaoFactory.getEvidenceDao();
		List<BOEvidence> boEvidences = new ArrayList<BOEvidence>();

		List<Evidence> evidences = new ArrayList<Evidence>();

		if (filter == null)
		{
			evidences = dao.findAll(Evidence.class); 
		} else if(filter.getEvidenceIds() != null && filter.getEvidenceIds().size() > 0){
			
			final String theQuery = "FROM Evidence entity WHERE ";
			String where = " entity.id in :inclList" ;
			
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("inclList", filter.getEvidenceIds());
			
			evidences = (List<Evidence>)dao.executeTypedQuery(theQuery.concat(where), Evidence.class, parameters);

		}else{
			String where = " 1=1 ";
			//final String theQuery = " SELECT entity.id, entity.imei, entity.title, entity.comment, entity.latitude, entity.longitude FROM Evidence entity WHERE "; 
			//final String theQuery = " SELECT new Evidence(entity.id, entity.imei, entity.title, entity.comment, entity.latitude, entity.longitude, entity.captureDTime, entity.fileName) FROM Evidence entity WHERE "; 
			final String theQuery = " SELECT new Evidence(entity.id, entity.imei, entity.title, entity.comment, entity.latitude, entity.longitude, entity.count, entity.address,entity.idInventario,entity.haspic) FROM Evidence entity WHERE "; 
			//final String theQuery = "FROM Evidence entity WHERE ";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			if (filter.getUser() != null)
			{
				parameters.put("imei", filter.getUser().getImei());
				where = where.concat(" and entity.imei = :imei ");
			}

			if (filter.getdTimefrom() != null)
			{
				parameters.put("dtimeFrom", filter.getdTimefrom());
				where = where.concat(" and entity.captureDTime > :dtimeFrom ");
			}

			if (filter.getdTimeto() != null)
			{
				parameters.put("dtimeTo", filter.getdTimeto());
				where = where.concat(" and entity.captureDTime < :dtimeTo ");
			}
			
			if (filter.isDeleted())
			{
				where = where.concat(" and entity.logicalDel = 1 ");
			}else{
				where = where.concat(" and entity.logicalDel = 0 ");
			}

			if (filter.getEvidenceType()!= null && filter.getEvidenceType().trim().length()>0)
			{
				HashMap<String, Object> type = new HashMap<String, Object>();
				parameters.put("type", filter.getEvidenceType());
				where = where.concat(" and entity.title in :type ");
			}
			
			if (filter.getEvidenceStatus()!= null && filter.getEvidenceStatus().trim().length()>0)
			{
				HashMap<String, Object> status = new HashMap<String, Object>();
				parameters.put("status", filter.getEvidenceStatus());
				where = where.concat(" and entity.comment in :status ");
			}
			
			if (filter.getIdInventario() > 0){
				
				parameters.put("idInventario", filter.getIdInventario());
				where = where.concat(" and entity.idInventario = :idInventario ");
				
				
			}
				
			
			evidences = (List<Evidence>)dao.executeTypedQuery(theQuery.concat(where), Evidence.class, parameters);

		}

		for (Evidence evidence : evidences)
		{
			BOEvidence boEvi = new BOEvidence(evidence);
			boEvidences.add(boEvi);
		}

		return boEvidences;
	}
}
