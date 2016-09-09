package com.brujula.locpic.persistence.utils;

import java.util.ArrayList;
import java.util.List;

public class GeoTool {
	private static final Double ONE_DEGREE_TO_KM = 111.12;

	public static boolean nearTo(GeoPosition point1, GeoPosition point2,
			int distance) {
		boolean response = false;

		double between;
		if (point1 != null && point2 != null) {
			between = getDistance(point1, point2);
			response = (between >= 0 && distance > between);
		}

		return response;
	}

	public static boolean PointinPolygon(GeoPosition[] points, GeoPosition p) {
		boolean result = false;

		for (int i = 0; i < points.length - 1; i++) {
			if ((((points[i + 1].getLon() <= p.getLon()) && (p.getLon() < points[i]
					.getLon())) || ((points[i].getLon() <= p.getLon()) && (p
					.getLon() < points[i + 1].getLon())))
					&& (p.getLat() < (points[i].getLat() - points[i + 1]
							.getLat())
							* (p.getLon() - points[i + 1].getLon())
							/ (points[i].getLon() - points[i + 1].getLon())
							+ points[i + 1].getLat())) {
				result = !result;
			}
		}
		return result;
	}

	public static double getDistance(GeoPosition point1, GeoPosition point2) {
		double response = -1;
		double ax, ay, bx, by;

		if (point1 != null && point2 != null) {

			response = GeoTool.distance(point1.getLat(), point1.getLon(),
					point2.getLat(), point2.getLon(), 'K');

		}

		return response * 1000;
	}

	/*
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ::
	 */
	/* :: : */
	/* :: This routine calculates the distance between two points (given the : */
	/* :: latitude/longitude of those points). : */
	/* :: : */
	/* :: Definitions: : */
	/* :: South latitudes are negative, east longitudes are positive : */
	/* :: : */
	/* :: Passed to function: : */
	/* :: lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees) : */
	/* :: lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees) : */
	/* :: unit = the unit you desire for results : */
	/* :: where: 'M' is statute miles : */
	/* :: 'K' is kilometers (default) : */
	/* :: 'N' is nautical miles : */
	/* :: : */
	/*
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ::
	 */

	public static double distance(double lat1, double lon1, double lat2,
			double lon2, char unit) {
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
				* Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		if (unit == 'K') {
			dist = dist * 1.609344;
		} else if (unit == 'N') {
			dist = dist * 0.8684;
		}
		return (dist);
	}

	/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
	/* :: This function converts decimal degrees to radians : */
	/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
	/* :: This function converts radians to decimal degrees : */
	/* ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

	/**
	 * Calcula el corrimiento de una coordenada segun un radio
	 * 
	 * @param latitude
	 *            latitud de origen en decimales
	 * @param longitude
	 *            longitud de origen en decimales
	 * @param radio
	 *            radio de desplazamiento en metros
	 * */
	public static List<GeoPosition> calculate_limits(double latitude, double longitude,
			double radio) {

		List<GeoPosition> response = new ArrayList<GeoPosition>();
//		System.out.println("latitud original: " + latitude
//				+ " longitud original :" + longitude);
		radio = mtsToKm(radio);
//		System.out.println(radio);
		double radioDegree = radio / ONE_DEGREE_TO_KM;

		// redondeando a 4 decimales
		radioDegree = Math.rint(radioDegree * 10000) / 10000;

		// ------------------- calculando deplazamiento hacia el norte
		// -------------------

		double newLongitudeN = longitude + radioDegree;
		newLongitudeN = Math.rint(newLongitudeN * 100000000) / 100000000;
//		System.out.println("desplazamiento hacia el norte");
//		System.out.println("latitud: " + latitude + " longitud: "
//				+ newLongitudeN);
		response.add(new GeoPosition(latitude, newLongitudeN));
		// ------------------- calculando desplazamiento hacia el sur
		// ---------------------

		double newLongitudeS = longitude - radioDegree;
		newLongitudeS = Math.rint(newLongitudeS * 100000000) / 100000000;
//		System.out.println("desplazamiento hacia el sur");
//		System.out.println("latitud: " + latitude + " longitud: "
//				+ newLongitudeS);
		response.add(new GeoPosition(latitude, newLongitudeS));
		
		// ---------------- calculando desplazamiento hacia el este
		// ----------------------

		double newLatitudeE = latitude + radioDegree;
		newLatitudeE = Math.rint(newLatitudeE * 100000000) / 100000000;
//		System.out.println("desplazamiento hacia el este");
//		System.out.println("latitud: " + newLatitudeE + " longitud: "
//				+ longitude);
		response.add(new GeoPosition(newLatitudeE, longitude));
		
		// ------------------- calculando desplazamiento hacia el oeste
		// ------------------

		double newLatitudeO = latitude - radioDegree;
		newLatitudeO = Math.rint(newLatitudeO * 100000000) / 100000000;
		//System.out.println("desplazamiento hacia el oeste");
		//System.out.println("latitud: " + newLatitudeO + " longitud: "
		//		+ longitude);
		response.add(new GeoPosition(newLatitudeO, longitude));

		// ----------------------------------------------------------------------------------------------
		return response;
	}

	/**
	 * Convierte metros a kilómetros
	 * 
	 * @param mts
	 *            metros a convertir
	 * @return equivalente en kilómetros
	 * */
	private static double mtsToKm(double mts) {

		final int MTS_KM = 1000;

		return (mts / MTS_KM);
	}

}
