package com.brujula.locpic.dto;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class EvidenceDTO {

	@XmlElement public Integer id;
	
	@XmlElement public String lat;
	
	@XmlElement public String lon;
	
	

	public EvidenceDTO() {
		
	}
	

	public EvidenceDTO(Integer id, String lat, String lon) {
		super();
		this.id = id;
		this.lat = lat;
		this.lon = lon;
	}



	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the lat
	 */
	public String getLat() {
		return lat;
	}

	/**
	 * @param lat the lat to set
	 */
	public void setLat(String lat) {
		this.lat = lat;
	}

	/**
	 * @return the lon
	 */
	public String getLon() {
		return lon;
	}

	/**
	 * @param lon the lon to set
	 */
	public void setLon(String lon) {
		this.lon = lon;
	}
	
	
	
	
}
