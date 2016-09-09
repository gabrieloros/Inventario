package com.brujula.locpic.persistence.utils;

public class GeoPosition {
	private double lat;
	private double lon;
	
	public GeoPosition(double latitude, double longitude){
		this.lat = latitude;
		this.lon = longitude;
	}

	public double getLat() {
		return lat;
	}

	public double getLon() {
		return lon;
	}
	
	
}
