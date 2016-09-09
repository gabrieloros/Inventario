/**
 * 
 */
package com.brujula.locpic.core.boEntities;

import org.apache.log4j.Logger;

import com.brujula.locpic.persistence.entities.EvidenceDataValue;

/**
 * @author adolfo.lopez
 * 
 */
public class BOEvidenceDataValue extends EvidenceDataValue {

	private static final long serialVersionUID = 1L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(BOEvidenceDataValue.class);

	
		public BOEvidenceDataValue() {
		}


		public BOEvidenceDataValue(EvidenceDataValue dataValue) {
			
			if(dataValue != null){
				
				this.setId(dataValue.getId());
				this.setCode(dataValue.getCode());
				this.setField(dataValue.getField());
				this.setValue(dataValue.getValue());
				this.setIdinventario(dataValue.getIdinventario());
				
				
				
			}
		}

}
