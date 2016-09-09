package com.brujula.locpic.core.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PushMessageDTO {

	List<String> registration_ids;
	HashMap<String, Object> data;

	public List<String> getRegistration_ids() {
		return registration_ids;
	}

	public void setRegistration_ids(List<String> registration_ids) {
		this.registration_ids = registration_ids;
	}

	public HashMap<String, Object> getData() {
		return data;
	}

	public void setData(HashMap<String, Object> data) {
		this.data = data;
	}

	public void addRegistrationId(String regId) {
		if (registration_ids == null) {
			registration_ids = new ArrayList<String>();
		}
		registration_ids.add(regId);
	}

}
