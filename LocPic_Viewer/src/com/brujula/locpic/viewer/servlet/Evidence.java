package com.brujula.locpic.viewer.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.core.impl.LBSFacade;
import com.brujula.locpic.core.impl.LBSResponse;

public class Evidence
extends HttpServlet {
    private final String folder = "/WEB-INF";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("Request recibida...");
        String action = request.getServletPath();
        if (action.equals("evidencePreview*")) {
        	LBSFacade picService = new LBSFacade();
        	Filter filter = new Filter();
        	String evidenceId = request.getParameter("evidenceId");
        	if(evidenceId != null)
        	{
            	List<Long> evidenceIds = new ArrayList<Long>();
            	evidenceIds.add(new Long(evidenceId));
            	filter.setEvidenceIds(evidenceIds);
            	LBSResponse lbsEvidences = picService.GetPics(filter);
        		if(lbsEvidences!= null && lbsEvidences.getResult()!=null)
        		{
        			List<BOEvidence> evidences  = (List<BOEvidence>)lbsEvidences.getResult();
        			if (evidences.size()>0)
        			{
        	            request.setAttribute("evidence", evidences.get(0));
        			}
        		}
        	}
            request.getRequestDispatcher("/WEB-INF/evidencePreview.jsp").forward((ServletRequest)request, (ServletResponse)response);

        } else if (action.equals("save")) {

        	request.getRequestDispatcher("/WEB-INF/mapviewer.jsp").forward((ServletRequest)request, (ServletResponse)response);
        	
        } else {
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward((ServletRequest)request, (ServletResponse)response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }
}