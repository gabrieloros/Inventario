package com.brujula.locpic.persistence.entities;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

/**
 * The persistent class for the Claim database table.
 * 
 */
@Entity
@Cacheable(false)
public class Evidence extends AbstractBasicEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "evidence_id_seq")
	@SequenceGenerator(name = "evidence_id_seq", sequenceName = "evidence_id_seq", allocationSize = 1)
	private long id;

	private String imei;

	private String title;

	private String comment;

	private double latitude;

	private double longitude;

	private Timestamp captureDTime;

	private String fileName;

	private int logicalDel;

	private int count;

	private String address;

	private String city;

	private long idInventario;
	
	private int haspic;

	// bi-directional one-to-one association to user
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "imei", referencedColumnName = "imei", insertable = false, updatable = false)
	private User user;
	
	@OneToMany(mappedBy = "evidence", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	//@JoinColumn(name="idevidence")
	private List<Photos> photos;

	@OneToMany(mappedBy = "evidence", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	private List<EvidenceField> fields;
	
	
	@OneToMany(mappedBy = "evidence", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	private List<EvidenceFieldValue> fieldsValue;
	
	public Evidence() {
	}

	public Evidence(long id, String imei) {
		super();
		this.id = id;
		this.imei = imei;
	}

	public Evidence(long id, String imei, String title, String comment, double latitude, double longitude, int count,
			String address, long idInventario, int haspic) { // ,
		// Timestamp captureDTime, String fileName) {
		super();
		this.id = id;
		this.imei = imei;
		this.title = title;
		this.comment = comment;
		this.latitude = latitude;
		this.longitude = longitude;
		this.count = count;
		this.address = address;
		this.idInventario = idInventario;
		this.haspic = haspic;
		// this.captureDTime = captureDTime;
		// this.fileName = fileName;
	}

	/**
	 * @return the photos
	 */
	public List<Photos> getPhotos() {
		return photos;
	}

	/**
	 * @param photos
	 *            the photos to set
	 */
	public void setPhotos(List<Photos> photos) {
		this.photos = photos;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName
	 *            the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the imei
	 */
	public String getImei() {
		return imei;
	}

	/**
	 * @param imei
	 *            the imei to set
	 */
	public void setImei(String imei) {
		this.imei = imei;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count
	 *            the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment
	 *            the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * @return the latitude
	 */
	public double getLatitude() {
		return latitude;
	}

	/**
	 * @param latitude
	 *            the latitude to set
	 */
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	/**
	 * @return the longitude
	 */
	public double getLongitude() {
		return longitude;
	}

	/**
	 * @param longitude
	 *            the longitude to set
	 */
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	/**
	 * @return the captureDTime
	 */
	public Timestamp getCaptureDTime() {
		return captureDTime;
	}

	/**
	 * @param captureDTime
	 *            the captureDTime to set
	 */
	public void setCaptureDTime(Timestamp captureDTime) {
		this.captureDTime = captureDTime;
	}

	/**
	 * @return the logicalDel
	 */
	public int getLogicalDel() {
		return logicalDel;
	}

	/**
	 * @param logicalDel
	 *            the logicalDel to set
	 */
	public void setLogicalDel(int logicalDel) {
		this.logicalDel = logicalDel;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	public long getIdInventario() {
		return idInventario;
	}

	public void setIdInventario(long idInventario) {
		this.idInventario = idInventario;
	}

	public byte[] getFile() {
		byte[] response = null;

		if (this.photos != null && this.photos.size() > 0) {
			response = this.photos.get(0).getFile();
		}
		return response;
	}

	/**
	 * @return the fields
	 */
	public List<EvidenceField> getFields() {
		return fields;
	}

	/**
	 * @param fields the fields to set
	 */
	public void setFields(List<EvidenceField> fields) {
		this.fields = fields;
	}

	public int getHaspic() {
		return haspic;
	}

	public void setHaspic(int haspic) {
		this.haspic = haspic;
	}

	public List<EvidenceFieldValue> getFieldsValue() {
		return fieldsValue;
	}

	public void setFieldsValue(List<EvidenceFieldValue> fieldsValue) {
		this.fieldsValue = fieldsValue;
	}
	
	
	

}