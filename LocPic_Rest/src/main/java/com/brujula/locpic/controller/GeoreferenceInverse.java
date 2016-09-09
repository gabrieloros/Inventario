package com.brujula.locpic.controller;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.persistence.exception.DaoException;
import com.brujula.locpic.service.service.EvidenceService;

public class GeoreferenceInverse extends Thread {

	private BOEvidence evi;
	private int counter;
	
	public GeoreferenceInverse(final BOEvidence evi, int counter)
	{
		this.evi = evi;
		this.counter = counter;
	}
	
	public void run()
	{
		counter++;
		JSONObject jsonObject = getLocationInfo(evi.getLatitude(), evi.getLongitude());

		JSONObject location;
		String location_string, location_city;
		try {
			// Get JSON Array called "results" and then get the 0th
			// complete object as JSON
			location = jsonObject.getJSONArray("results").getJSONObject(0);
			// Get the value of the attribute whose name is
			// "formatted_string"
			location_string = location.getString("formatted_address");
			location_city = "Capital";

			evi.setAddress(location_string);
			evi.setCity(location_city);

			System.out.println("formattted address:" + location_string);
			
			EvidenceService.Save(evi);

			
		} catch (JSONException | DaoException e1) {
			e1.printStackTrace();

		}
		counter--;
	}
	
	private JSONObject getLocationInfo(double lat, double lng) {

		HttpGet httpGet = new HttpGet(
				"http://maps.google.com/maps/api/geocode/json?latlng=" + lat + "," + lng + "&sensor=false");
		HttpClient client = new DefaultHttpClient();
		HttpResponse response;
		StringBuilder stringBuilder = new StringBuilder();
		String jsonText = "";
		try {
			response = client.execute(httpGet);
			HttpEntity entity = response.getEntity();

			jsonText = EntityUtils.toString(entity, HTTP.UTF_8);

			/*
			 * InputStream stream = entity.getContent(); int b; while ((b =
			 * stream.read()) != -1) { stringBuilder.append((char) b); }
			 */
		} catch (ClientProtocolException e) {
		} catch (IOException e) {
		}

		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject = new JSONObject(jsonText);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
}
