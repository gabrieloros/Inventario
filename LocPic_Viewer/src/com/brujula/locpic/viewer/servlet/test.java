package com.brujula.locpic.viewer.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

public class test {

	public static void main(String[] args) {
		HttpClient httpclient = new DefaultHttpClient();  
		String temp = "http://adtouch.cloudfoundry.com/rest/ad/barcode/529a927973654526a309a77986062566/image";
		HttpGet request = new HttpGet(temp);
		try {
			HttpResponse response = httpclient.execute(request);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
