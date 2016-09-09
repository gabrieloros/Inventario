package com;

import com.brujula.locpic.core.impl.CoreService;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.core.impl.LBSResponse;
import com.brujula.locpic.persistence.dao.impl.DaoFactory;
import com.brujula.locpic.persistence.dao.interfaces.EvidenceDaoInterface;

public class test {

	public static void main(String[] args) {
		EvidenceDaoInterface dao;
		dao = DaoFactory.getEvidenceDao();

		CoreService picService = new CoreService();
		Filter filter = new Filter();
		LBSResponse pics = picService.GetPics(filter);
		
	}

}
