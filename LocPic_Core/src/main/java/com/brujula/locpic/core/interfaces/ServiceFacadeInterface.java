/**
 * 
 */
package com.brujula.locpic.core.interfaces;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.core.impl.LBSResponse;

/**
 * @author adolfo.lopez
 *
 */
public interface ServiceFacadeInterface
{
	public LBSResponse GetUsers();

	public LBSResponse AddEvidence(BOEvidence evidence);

	public LBSResponse GetPics(Filter filter);

	public LBSResponse UpdateEvidence(BOEvidence evidence);
}
