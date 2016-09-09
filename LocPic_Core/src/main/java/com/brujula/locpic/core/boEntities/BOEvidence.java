/**
 * 
 */
package com.brujula.locpic.core.boEntities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.EvidenceDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.Evidence;
import com.brujula.locpic.persistence.entities.EvidenceField;
import com.brujula.locpic.persistence.entities.Photos;

/**
 * @author adolfo.lopez
 * 
 */
public class BOEvidence extends Evidence
{

	private static final long serialVersionUID = 1L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(BOEvidence.class);

	protected static EvidenceDaoInterface dao;
	protected static DaoInterface<AbstractBasicEntity> basicDao;

	public BOEvidence()
	{
	}

	public BOEvidence(Evidence evidence)
	{
		if (evidence != null)
		{
			this.setId(evidence.getId());
			this.setTitle(evidence.getTitle());
			this.setComment(evidence.getComment());
			this.setImei(evidence.getImei());
			this.setFileName(evidence.getFileName());
			this.setPhotos(evidence.getPhotos());
			this.setCaptureDTime(evidence.getCaptureDTime());
			this.setLatitude(evidence.getLatitude());
			this.setLongitude(evidence.getLongitude());
			this.setUser(evidence.getUser());
			this.setCount(evidence.getCount());
			this.setAddress(evidence.getAddress());
			this.setCity(evidence.getCity());
			this.setIdInventario(evidence.getIdInventario());
			this.setFields(evidence.getFields());
			//this.setFieldsValue(evidence.getFieldsValue());
			this.setHaspic(evidence.getHaspic());
		}
	}

	
	public String getFieldValue(String param){
		String response = "NO HAY DATO";
		if(param != null && getFields() != null)
		{
			for (EvidenceField field : getFields()) {
				if (field.getFieldName().trim().equals(param.trim())){
					response = field.getValue();
 
				}
			}		
			
		}
		return response;
	}
	
	
	
	
	/**
	 * @param captureDTime
	 *            the captureDTime to set
	 */
	public void setCaptureDTime(long timeInMilli)
	{
		this.setCaptureDTime(new Timestamp(timeInMilli));
	}
	
	public String getCaptureDTimeInString()
	{
		String response = "Sin fecha de captura";

		if (getCaptureDTime()!=null){
		SimpleDateFormat sdFecha = new SimpleDateFormat("dd/MM/yy HH:mm");
		response = sdFecha.format(getCaptureDTime());
		}
		return response;
	}
	
	public String getType()
	{
		String response;
		
		int type = 99; 

		if (getTitle()!=null)
		{
			try{
				type = Integer.parseInt(getTitle().trim());
			}catch(Exception e)
			{
				
			}
		}
		switch (type) {
		case 0:
			response = "Luminaria";
			break;
		case 1:
			response = "Brazo";
			break;
		case 2:
			response = "Reflector";
			break;
		case 3:
			response = "Farola";
			break;
		case 4:
			response = "Torre";
			break;
		case 5:
			response = "Colgante";
			break;
	
			
		default:
			response = "Sin clasificar";
			break;
		}	
		
		return response;
	}
	
	public String getStatus()
	{
		String response;;
		int status = 99; 

		if (getComment()!=null)
		{
			try{
				status = Integer.parseInt(getComment());
			}catch(Exception e)
			{
				
			}
		}
		switch (status) {
		case 1:
			response = "Ok";
			break;
		case 2:
			response = "Rota";
			break;
		case 3:
			response = "Falta";
			break;
		case 4:
			response = "Poda";
			break;

		default:
			response = "Sin clasificar";
			break;
		}
		
		return response;
	}
	
	public String getTypePrensa()
	{
		String response;
		
		int type = 99; 

		if (getTitle()!=null)
		{
			try{
				type = Integer.parseInt(getTitle().trim());
			}catch(Exception e)
			{
				
			}
		}
		switch (type) {
		case 1:
			response = "Cartel de calle";
			break;
		case 2:
			response = "Semáforos rectos";
			break;
		case 3:
			response = "Semáforos con brazo";
			break;
		case 4:
			response = "Semáforos para peatones";
			break;
		case 5:
			response = "Semáforos para peatones ciegos";
			break;
		case 6:
			response = "Rampa discapacitados";
			break;
		case 7:
			response = "Senda Peatonal";
			break;
		case 8:
			response = "Observaciones";
			break;
	
		default:
			response = "Sin clasificar";
			break;
		}	
		
		return response;
	}
	
	public String getStatusPrensa()
	{
		String response;;
		int status = 99; 

		if (getComment()!=null)
		{
			try{
				status = Integer.parseInt(getComment());
			}catch(Exception e)
			{
				
			}
		}
		switch (status) {
		case 0:
			response = "Ok";
			break;
		case 1:
			response = "Rota";
			break;
		case 2:
			response = "Falta";
			break;
		default:
			response = "Sin clasificar";
			break;
		}
		
		return response;
	}

	public void setFile(byte[] file) {
		// TODO Auto-generated method stub
		Photos photo = new Photos();
		photo.setFile(file);
		List<Photos> listPhotos = this.getPhotos();
		if (listPhotos==null)
		{
			listPhotos = new ArrayList<Photos>();
		}
		listPhotos.add(photo);
		
		this.setPhotos(listPhotos);

	}
}
