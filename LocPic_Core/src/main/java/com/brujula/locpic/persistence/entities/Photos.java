package com.brujula.locpic.persistence.entities;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "photos")
@Cacheable(false)
public class Photos extends AbstractBasicEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "photos_id_seq")
	@SequenceGenerator(name = "photos_id_seq", sequenceName = "photos_id_seq", allocationSize = 1)
	private long id;
	
	private long idEvidence ;
	
	private byte[] file;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idevidence")
	private Evidence evidence;
	
	public Photos(){
	
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	

	/**
	 * @return the idEvidence
	 */
	public long getIdEvidence() {
		return idEvidence;
	}

	/**
	 * @param idEvidence the idEvidence to set
	 */
	public void setIdEvidence(long idEvidence) {
		this.idEvidence = idEvidence;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	

}
