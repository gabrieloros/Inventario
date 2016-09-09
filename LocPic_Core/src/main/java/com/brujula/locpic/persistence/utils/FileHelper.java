/**
 * 
 */
package com.brujula.locpic.persistence.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * The Class FileHelper.
 * 
 * @author jose.aroca
 */

public class FileHelper
{
	/** The Constant LOGGER. */
	private static final Logger LOGGER = Logger.getLogger(FileHelper.class);

	/**
	 * Gets the configuration properties from file config.properties. The
	 * application use it for work. Configuration in identikeyauthwrapper jar IS
	 * NOT USE
	 * 
	 * @param path
	 *            the path
	 * @return the properties
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map<String, String> getProperties(String path)
	{
		LOGGER.debug("Begin getProperties");

		Map<String, String> configPropertiesMap = null;

		try
		{
			InputStream imputFile = FileHelper.class.getResourceAsStream(path);

			if (imputFile != null)
			{
				Properties configProperties = new Properties();
				configProperties.load(imputFile);
				configPropertiesMap = new HashMap<String, String>((Map) configProperties);
			} else
			{
				LOGGER.error("'" + path + "' NOT FOUND! This file is required. ");
			}

		} catch (IOException e)
		{
			LOGGER.error("getProperties: IOException trying to load '" + path + "'");

		}

		LOGGER.debug("End getProperties");

		return configPropertiesMap;
	}

}
