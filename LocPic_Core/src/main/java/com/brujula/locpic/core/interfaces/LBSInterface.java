package com.brujula.locpic.core.interfaces;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.impl.LBSResponse;

/**
 * @author adolfo.lopez
 * @version 1.0
 * @created 02-08-2013 12:30
 */

public interface LBSInterface
{
	public LBSResponse AddEvidence(BOEvidence evidence);
}
