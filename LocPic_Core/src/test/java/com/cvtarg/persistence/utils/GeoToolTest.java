package com.cvtarg.persistence.utils;

import junit.framework.Assert;

import org.junit.Test;

import com.brujula.locpic.persistence.utils.GeoPosition;
import com.brujula.locpic.persistence.utils.GeoTool;

public class GeoToolTest {
	@Test
	public void PointinPolygon_test() {
		GeoPosition[] points = { 
				new GeoPosition(-32.892454,-68.847998),
				new GeoPosition(-32.894112,-68.848405),
				new GeoPosition(-32.894445,-68.845895),
				new GeoPosition(-32.892905,-68.845412) 
				};
	
		
		GeoPosition point = new GeoPosition(-32.893381000000 , -68.847234000000);

		boolean result = GeoTool.PointinPolygon(points, point);
		Assert.assertTrue("Point should be inside polygon.", result);

	}
	
	@Test
	public void nearPosition(){
		
		GeoPosition point1 = new GeoPosition(-32.889660, -68.844484);
		GeoPosition point2 = new GeoPosition(-32.890795, -68.844806);
		int distance = 130;
		
		boolean result = GeoTool.nearTo(point1, point2, distance);
		
		Assert.assertTrue("Points should be close to.", result);
		
	}

	@Test
	public void farPosition(){
		
		GeoPosition point1 = new GeoPosition(-32.893679340000, -68.847027880000);
		GeoPosition point2 = new GeoPosition(-32.893752 , -68.846983);
		int distance = 130;
		
		boolean result = GeoTool.nearTo(point1, point2, distance);
		
		Assert.assertTrue("Points should be close to.", result);
		
	}
	
}
