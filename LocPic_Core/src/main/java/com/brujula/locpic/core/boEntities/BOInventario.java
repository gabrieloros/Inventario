/**
 * 
 */
package com.brujula.locpic.core.boEntities;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.brujula.locpic.core.enums.EvidenceDataValueTypeEnum;
import com.brujula.locpic.persistence.dao.interfaces.DaoInterface;
import com.brujula.locpic.persistence.dao.interfaces.InventarioDaoInterface;
import com.brujula.locpic.persistence.entities.AbstractBasicEntity;
import com.brujula.locpic.persistence.entities.EvidenceDataValue;
import com.brujula.locpic.persistence.entities.Inventario;

/**
 * @author adolfo.lopez
 * 
 */
public class BOInventario extends Inventario {

	private static final long serialVersionUID = 1L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(BOInventario.class);

	protected static InventarioDaoInterface dao;
	protected static DaoInterface<AbstractBasicEntity> basicDao;

	public BOInventario() {
	}

	public BOInventario(Inventario inventario) {
		if (inventario != null) {
			this.setId(inventario.getId());
			this.setName(inventario.getName());
			this.setIconfunction(inventario.getIconfunction());
			this.setPagina(inventario.getPagina());
			this.setInfo(inventario.getInfo());
			this.setDataValue(inventario.getDataValue());
			
		}
	}

	public List<BOEvidenceDataValue> getDataValuesByField(EvidenceDataValueTypeEnum type) {
		List<BOEvidenceDataValue> response = new ArrayList<BOEvidenceDataValue>();

		if (this.getDataValue() != null) {
			for (EvidenceDataValue dataValue : this.getDataValue()) {
				if (dataValue.getField() == type.getCode()) {
					BOEvidenceDataValue boDataValue = new BOEvidenceDataValue(dataValue);
					response.add(boDataValue);
				}
			}
		}
		return response;
	}

	public BOEvidenceDataValue getDataValuesByValue(String value, EvidenceDataValueTypeEnum type) {
		BOEvidenceDataValue boDataValue = null;

		if (this.getDataValue() != null) {
			for (EvidenceDataValue dataValue : this.getDataValue()) {
				if (dataValue.getValue().equals(value) && dataValue.getField() == type.getCode()) {
					boDataValue = new BOEvidenceDataValue(dataValue);
					break;
				}
			}
		}
		return boDataValue;
	}
	
	public BOEvidenceDataValue getDataValuesByCode(String code, EvidenceDataValueTypeEnum type) {
		BOEvidenceDataValue boDataValue = null;

		if (this.getDataValue() != null) {
			for (EvidenceDataValue dataValue : this.getDataValue()) {
				if (dataValue.getCode().equals(code) && dataValue.getField() == type.getCode()) {
					boDataValue = new BOEvidenceDataValue(dataValue);
					break;
				}
			}
		}
		return boDataValue;
	}
	
	public String getValue (String code, EvidenceDataValueTypeEnum type){
		
		
		String value = code;
		
		
		if (this.getDataValue() != null) {
			for (EvidenceDataValue dataValue : this.getDataValue()) {
				if (dataValue.getCode().equals(code) && dataValue.getField() == type.getCode()) {
					value = dataValue.getValue();
					break;
				}
			}
		}
		return value;
		
	}
	
	


}
