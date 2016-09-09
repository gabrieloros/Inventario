package com.brujula.locpic.dto;

public class EvidenceARest
{
	private String imei;
	private double lat;
	private double lon;
	private long locTime;
	private String title;
	private String comment;
	private String userName;
	private int count;

	private byte[] pic;

	/**
	 * @return the imei
	 */
	public String getImei()
	{
		return imei;
	}

	/**
	 * @param imei
	 *            the imei to set
	 */
	public void setImei(String imei)
	{
		this.imei = imei;
	}

	/**
	 * @return the title
	 */
	public String getTitle()
	{
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title)
	{
		this.title = title;
	}

	/**
	 * @return the comment
	 */
	public String getComment()
	{
		return comment;
	}

	/**
	 * @param comment
	 *            the comment to set
	 */
	public void setComment(String comment)
	{
		this.comment = comment;
	}

	/**
	 * @return the lat
	 */
	public double getLat()
	{
		return lat;
	}

	/**
	 * @param lat
	 *            the lat to set
	 */
	public void setLat(double lat)
	{
		this.lat = lat;
	}

	/**
	 * @return the lon
	 */
	public double getLon()
	{
		return lon;
	}

	/**
	 * @param lon
	 *            the lon to set
	 */
	public void setLon(double lon)
	{
		this.lon = lon;
	}

	/**
	 * @return the locTime
	 */
	public long getLocTime()
	{
		return locTime;
	}

	/**
	 * @param locTime
	 *            the locTime to set
	 */
	public void setLocTime(long locTime)
	{
		this.locTime = locTime;
	}

	/**
	 * @return the pic
	 */
	public byte[] getPic()
	{
		return pic;
	}

	/**
	 * @param pic
	 *            the pic to set
	 */
	public void setPic(byte[] pic)
	{
		this.pic = pic;
	}

	/**
	 * @return the userName
	 */
	public String getUserName()
	{
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}
	
}
