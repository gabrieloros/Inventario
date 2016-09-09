/*
 * Decompiled with CFR 0_114.
 * 
 * Could not load the following classes:
 *  com.brujula.locpic.core.boEntities.BOUser
 *  com.brujula.locpic.core.impl.Filter
 *  com.brujula.locpic.core.impl.LBSFacade
 *  com.brujula.locpic.core.impl.LBSResponse
 *  com.brujula.locpic.persistence.exception.DaoException
 *  com.brujula.locpic.service.service.UserService
 *  com.google.gson.Gson
 *  javax.servlet.RequestDispatcher
 *  javax.servlet.ServletException
 *  javax.servlet.ServletRequest
 *  javax.servlet.ServletResponse
 *  javax.servlet.http.HttpServlet
 *  javax.servlet.http.HttpServletRequest
 *  javax.servlet.http.HttpServletResponse
 */
package com.brujula.locpic.viewer.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.boEntities.BOEvidenceDataValue;
import com.brujula.locpic.core.boEntities.BOInventario;
import com.brujula.locpic.core.boEntities.BOUser;
import com.brujula.locpic.core.enums.EvidenceDataValueTypeEnum;
import com.brujula.locpic.core.enums.EvidenceStatusEnum;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.core.impl.LBSFacade;
import com.brujula.locpic.core.impl.LBSResponse;
import com.brujula.locpic.persistence.exception.DaoException;
import com.brujula.locpic.service.service.InventaryService;
import com.brujula.locpic.service.service.UserService;
import com.google.gson.Gson;

public class Controlador extends HttpServlet {
	private final String folder = "/WEB-INF";
	private LBSFacade picService = new LBSFacade();

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("Request recibida...");
		String action = request.getServletPath();
		if (action.equals("/index.htm")) {
			request.setAttribute("saludo", (Object) "Bienvenido a JSP.");
			request.getRequestDispatcher("/WEB-INF/index.jsp").forward((ServletRequest) request,
					(ServletResponse) response);
		} else if (action.equals("/prepareUser.htm")) {
			// Alta de usuario a una DB.

			int valida = 0;

			String imei = request.getParameter("imei");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			String rol = request.getParameter("rol");

			if (imei == null || imei.equals("")) {
				request.setAttribute("errorImei", (Object) "Campo obligatorio");
				++valida;
			}
			if (name == null || name.equals("")) {
				request.setAttribute("errorName", (Object) "Campo obligatorio");
				++valida;
			}
			if (username == null || username.equals("")) {
				request.setAttribute("errorUserName", (Object) "Campo obligatorio");
				++valida;
			}
			if (pass == null || pass.equals("")) {
				request.setAttribute("errorPass", (Object) "Campo obligatorio");
				++valida;
			}
			if (rol == null || rol.equals("")) {
				
				++valida;
			}
			

			if (valida == 0) {

				BOUser registro = new BOUser();

				registro.setImei(imei);
				registro.setName(name);
				registro.setUsername(username);
				registro.setPass(pass);
				registro.setRol(rol);
				try {
					UserService.RegistrarBD(registro);

				} catch (Exception e) {

					// request.getRequestDispatcher("/WEB-INF/error.jsp").forward((ServletRequest)
					// request,
					// (ServletResponse) response);
				}
			}
			request.getRequestDispatcher("/WEB-INF/index.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		}else if (action.equals("/crearInventario.htm")) {
			

			int valida = 0;

			String name = request.getParameter("name");
			String iconfunction = request.getParameter("iconfunction");
			String pagina = request.getParameter("pagina");
			String info = request.getParameter("info");
			

			if (name == null || name.equals("")) {
				
				++valida;
			}
			if (iconfunction == null || iconfunction.equals("")) {
				
				++valida;
			}
			if (pagina == null || pagina.equals("")) {
				
				++valida;
			}
			if (info == null || info.equals("")) {
				
				++valida;
			}
			

			if (valida == 0) {

				BOInventario registroInventario = new BOInventario();

				registroInventario.setName(name);
				registroInventario.setIconfunction(iconfunction);
				registroInventario.setPagina(pagina);
				registroInventario.setInfo(info);
				try {
					InventaryService.CrearInventarioBD(registroInventario);

				} catch (Exception e) {

					// request.getRequestDispatcher("/WEB-INF/error.jsp").forward((ServletRequest)
					// request,
					// (ServletResponse) response);
				}
			}
			request.getRequestDispatcher("/inventario.htm").forward((ServletRequest) request,
					(ServletResponse) response);

		}
        else if (action.equals("/eliminarInventario.htm")) {
			

			int valida = 0;

			String name = request.getParameter("name");

			

			if (valida == 0) {

				BOInventario eliminarInventario = new BOInventario();

				eliminarInventario.setName(name);
				
				try {
					InventaryService.EliminarInventarioBD(eliminarInventario);

				} catch (Exception e) {

					// request.getRequestDispatcher("/WEB-INF/error.jsp").forward((ServletRequest)
					// request,
					// (ServletResponse) response);
				}
			}
			request.getRequestDispatcher("/inventario.htm").forward((ServletRequest) request,
					(ServletResponse) response);

		}
		else if (action.equals("/evidencePreview.htm")) {
			LBSFacade picService = new LBSFacade();
			Filter filter = new Filter();
			String evidenceId = request.getParameter("evidenceId");
			if (evidenceId != null) {
				List<Long> evidenceIds = new ArrayList<Long>();
				evidenceIds.add(new Long(evidenceId));
				filter.setEvidenceIds(evidenceIds);
				LBSResponse lbsEvidences = picService.GetPics(filter);
				if (lbsEvidences != null && lbsEvidences.getResult() != null) {
					List<BOEvidence> evidences = (List<BOEvidence>) lbsEvidences.getResult();
					if (evidences.size() > 0) {
						request.setAttribute("evidence", evidences.get(0));
					}
				}
			}
			request.getRequestDispatcher("/WEB-INF/evidencePreview.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		} else if (action.equals("/evidencePreviewSave.htm")) {
			LBSFacade picService = new LBSFacade();
			Filter filter = new Filter();
			String evidenceId = request.getParameter("evidenceId");
			if (evidenceId != null) {
				List<Long> evidenceIds = new ArrayList<Long>();
				evidenceIds.add(new Long(evidenceId));
				filter.setEvidenceIds(evidenceIds);
				LBSResponse lbsEvidences = picService.GetPics(filter);
				if (lbsEvidences != null && lbsEvidences.getResult() != null) {
					List<BOEvidence> evidences = (List<BOEvidence>) lbsEvidences.getResult();
					if (evidences.size() > 0) {
						BOEvidence boEvi = evidences.get(0);
						boEvi.setCount(Integer.parseInt(request.getParameter("eviCount")));
						picService.UpdateEvidence(boEvi);
					}
				}
			}
			request.getRequestDispatcher("mapviewer.htm").forward((ServletRequest) request, (ServletResponse) response);

		} else if (action.equals("/mapviewer.htm")) {
			System.out.print("mapviewer.");
			// ArrayList users = new ArrayList();

			BOUser userSession = (BOUser) request.getSession().getAttribute("userSession");
			if (userSession == null) {
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward((ServletRequest) request,
						(ServletResponse) response);
				return;
			}

			LBSResponse lbsUsers = picService.GetUsers();
			List<BOUser> eviUsers = (List<BOUser>) lbsUsers.getResult();
			ArrayList<String> userNames = new ArrayList<String>();
			for (Object boUser : eviUsers) {
				userNames.add(((BOUser) (boUser)).getName().trim());
			}

			Gson gson = new Gson();
			request.setAttribute("users", (Object) gson.toJson(userNames));

			List<String> eviTypes = new ArrayList<String>();

			// metodo nuevo con estados desde base de datos
			BOInventario boInventory = getSelectedInventory(request);
			for(BOEvidenceDataValue dataValue : boInventory.getDataValuesByField(EvidenceDataValueTypeEnum.TITLE)){
				eviTypes.add(dataValue.getValue());
			}
			request.setAttribute("types", (Object) gson.toJson(eviTypes));

			List<String> eviStatus = new ArrayList<String>();
			for(BOEvidenceDataValue dataValue : boInventory.getDataValuesByField(EvidenceDataValueTypeEnum.COMMENT)){
				eviStatus.add(dataValue.getValue());
			}
			request.setAttribute("status", (Object) gson.toJson(eviStatus));

			Filter filter = getFilterFromView(request, response);

			if (filter == null) {
				List<BOInventario> listInventario = userSession.getUserInventories();
				request.setAttribute("inventarios", listInventario);
				request.getRequestDispatcher("/WEB-INF/login1.jsp").forward((ServletRequest) request,
						(ServletResponse) response);
				return;

			}

			LBSResponse pics = picService.GetPics(filter);

			List<BOEvidence> evidences = (List<BOEvidence>) pics.getResult();

			request.setAttribute("evidences", evidences);

			boolean editParam = false;

			if (request.getParameter("isModify") != null) {
				editParam = true;
			}
			request.setAttribute("isModify", editParam);

			// --------------------------------------------
			BOInventario redireccionar = (BOInventario) request.getAttribute("inventario");
			String pagina = redireccionar.getPagina().trim();
			String info = redireccionar.getInfo().trim();
			// --------------------------------------------

			String campo = request.getParameter("campo");

			if (campo != null && !campo.isEmpty()) {

				request.getRequestDispatcher(info).forward((ServletRequest) request, (ServletResponse) response);
			} else {

				request.getRequestDispatcher(pagina).forward((ServletRequest) request, (ServletResponse) response);
				// request.getRequestDispatcher("/WEB-INF/mapviewer.jsp").forward((ServletRequest)
				// request,
				// (ServletResponse) response);
			}

		} else if (action.equals("/mapTabla.htm")) {

			Filter filter = getFilterFromView(request, response);

			LBSResponse pics = picService.GetPics(filter);

			List<BOEvidence> evidences = (List<BOEvidence>) pics.getResult();

			request.setAttribute("evidences", evidences);

			request.getRequestDispatcher("/WEB-INF/mapTabla.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		} else if (action.equals("/infoVialidad.htm")) {

			Filter filter = getFilterFromView(request, response);

			LBSResponse pics = picService.GetPics(filter);

			List<BOEvidence> evidences = (List<BOEvidence>) pics.getResult();

			request.setAttribute("evidences", evidences);

			request.getRequestDispatcher("/WEB-INF/infoVialidad.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		} else if (action.equals("/mapTablaLuminaria.htm")) {

			Filter filter = getFilterFromView(request, response);

			LBSResponse pics = picService.GetPics(filter);

			List<BOEvidence> evidences = (List<BOEvidence>) pics.getResult();

			request.setAttribute("evidences", evidences);

			request.getRequestDispatcher("/WEB-INF/mapTablaLuminaria.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		} else if (action.equals("/formulario.htm")) {

			LBSFacade picService = new LBSFacade();
			Filter filter = new Filter();
			String evidenceId = request.getParameter("evidenceId");
			if (evidenceId != null) {
				List<Long> evidenceIds = new ArrayList<Long>();
				evidenceIds.add(new Long(evidenceId));
				filter.setEvidenceIds(evidenceIds);
				LBSResponse lbsEvidences = picService.GetPics(filter);
				if (lbsEvidences != null && lbsEvidences.getResult() != null) {
					List<BOEvidence> evidences = (List<BOEvidence>) lbsEvidences.getResult();
					if (evidences.size() > 0) {
						request.setAttribute("evidence", evidences.get(0));
					}
				}
			}

			request.getRequestDispatcher("/WEB-INF/formulario.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		} else if (action.equals("/incident.htm")) {

			System.out.print("incident.");
			// ArrayList users = new ArrayList();
			LBSResponse lbsUsers = picService.GetUsers();
			List<BOUser> eviUsers = (List<BOUser>) lbsUsers.getResult();
			ArrayList<String> userNames = new ArrayList<String>();
			for (Object boUser : eviUsers) {
				userNames.add(((BOUser) (boUser)).getName().trim());
			}

			Gson gson = new Gson();
			request.setAttribute("users", (Object) gson.toJson(userNames));

			Filter filter = new Filter();
			String userName = request.getParameter("userName");
			if (userName != null && !userName.isEmpty()) {
				BOUser boUser2 = null;
				try {
					boUser2 = UserService.GetUserByName((String) userName);
				} catch (DaoException e) {
					e.printStackTrace();
				}
				if (boUser2 != null) {
					filter.setUser(boUser2);
				}
				request.setAttribute("userName", (Object) userName);
			}
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String dTimeFrom = request.getParameter("dTimeFrom");
			if (dTimeFrom == null || dTimeFrom.isEmpty()) {
				dTimeFrom = sdf.format(Calendar.getInstance().getTime());
			}
			try {
				request.setAttribute("dTimeFrom", (Object) dTimeFrom);
				filter.setdTimefrom(new Timestamp(sdf.parse(dTimeFrom).getTime()));
			} catch (ParseException e) {
				e.printStackTrace();
				request.setAttribute("errorFrom", (Object) "Fecha incorrecta.");
			}
			String dTimeTo = request.getParameter("dTimeTo");
			if (dTimeTo != null && !dTimeTo.isEmpty()) {
				try {
					request.setAttribute("dTimeTo", (Object) dTimeTo);
					filter.setdTimeto(new Timestamp(sdf.parse(dTimeTo).getTime()));
				} catch (ParseException e) {
					e.printStackTrace();
					request.setAttribute("errorTo", (Object) "Fecha incorrecta.");
				}
			}

			/*
			 * Agregamos tipos List<String> status = new ArrayList<String>();
			 * status.add("2"); status.add("3"); //filter.setStatus(status);
			 */
			LBSResponse pics = picService.GetPics(filter);
			request.setAttribute("evidences", pics.getResult());
			request.getRequestDispatcher("/WEB-INF/incident.jsp").forward((ServletRequest) request,
					(ServletResponse) response);
			
			
		} else if (action.equals("/login.htm")) {
			int valida = 0;

			HttpSession sesion = request.getSession();

			String user = request.getParameter("user");
			String pass = request.getParameter("pass");

			if (user == null || user.equals("")) {
				request.setAttribute("errorUser", (Object) "Campo requerido");
				++valida;
			}
			if (pass == null || pass.equals("")) {
				request.setAttribute("errorPass", (Object) "Campo requerido");
				++valida;
			}
			if (valida == 0) {

				BOUser boUser = null;
				try {
					boUser = UserService.ValidateUser(user, pass);
				} catch (DaoException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (boUser != null) {
					request.setAttribute("boUser", boUser);
					// SESSION
					sesion.setAttribute("user", user);
					sesion.setAttribute("userSession", boUser);
					List<BOInventario> listInventario = boUser.getUserInventories();
					request.setAttribute("inventarios", listInventario);
					
					BOInventario boInventory = getSelectedInventory(request);
					request.setAttribute("inventario", boInventory);
				

					request.getRequestDispatcher("/WEB-INF/login1.jsp").forward((ServletRequest) request,
							(ServletResponse) response);
				} else {
					request.setAttribute("user", (Object) user);
					request.setAttribute("pass", (Object) pass);
					request.getRequestDispatcher("/WEB-INF/errorUsuario.jsp").forward((ServletRequest) request,
							(ServletResponse) response);
				}

			} else {
				request.setAttribute("user", (Object) user);
				request.setAttribute("pass", (Object) pass);
				request.getRequestDispatcher("/WEB-INF/errorUsuario.jsp").forward((ServletRequest) request,
						(ServletResponse) response);
			}
		} else if (action.equals("/inventario.htm")) {

			// if(sesion.getAttribute("user") == null){

			// request.getRequestDispatcher("/WEB-INF/errorUsuario.jsp").forward((ServletRequest)
			// request,
			// (ServletResponse) response);

			BOUser userSession = (BOUser) request.getSession().getAttribute("userSession");
			if (userSession == null) {
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward((ServletRequest) request,
						(ServletResponse) response);
				return;
			}

			List<BOInventario> listInventario = userSession.getUserInventories();
			request.setAttribute("inventarios", listInventario);
	
			
			request.getRequestDispatcher("/WEB-INF/login1.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

			// }
		} else

		if (action.equals("/out.htm")) {

			HttpSession sesion = request.getSession();
			sesion.invalidate();
			request.getRequestDispatcher("/WEB-INF/index.jsp").forward((ServletRequest) request,
					(ServletResponse) response);

		}
	}

	private BOInventario getSelectedInventory(HttpServletRequest request) {
		BOInventario inventarioSeleccionado = null;
		BOUser userSession = (BOUser) request.getSession().getAttribute("userSession");

		String inventario = request.getParameter("id_inventario");
		List<BOInventario> listInventario = userSession.getUserInventories();
		if (inventario == null || inventario.equals("")) {

			return null;
		} else {
			for (BOInventario boInventario : listInventario) {
				if (boInventario.getId() == Integer.parseInt(inventario)) {
					try {
						inventarioSeleccionado = InventaryService.GetInventoryById(boInventario.getId());
					} catch (DaoException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}
			request.setAttribute("id_inventario", inventario);
			request.setAttribute("inventario", inventarioSeleccionado);
		}

		return inventarioSeleccionado;
	}

	private Filter getFilterFromView(HttpServletRequest request, HttpServletResponse response) {
		Filter filter = new Filter();

		BOInventario inventarioSeleccionado = getSelectedInventory(request);

		if (inventarioSeleccionado != null) {

			filter.setIdInventario(inventarioSeleccionado.getId());
		}

		String userName = request.getParameter("userName");
		if (userName != null && !userName.isEmpty()) {
			BOUser boUser2 = null;
			try {
				boUser2 = UserService.GetUserByName((String) userName);
			} catch (DaoException e) {
				e.printStackTrace();
			}
			if (boUser2 != null) {
				filter.setUser(boUser2);
			}
			request.setAttribute("userName", (Object) userName);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		String dTimeFrom = request.getParameter("dTimeFrom");
		if (dTimeFrom == null || dTimeFrom.isEmpty()) {
			dTimeFrom = sdf.format(Calendar.getInstance().getTime());
		}
		try {
			request.setAttribute("dTimeFrom", (Object) dTimeFrom);
			filter.setdTimefrom(new Timestamp(sdf.parse(dTimeFrom).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
			request.setAttribute("errorFrom", (Object) "Fecha incorrecta.");
		}
		String dTimeTo = request.getParameter("dTimeTo");
		if (dTimeTo != null && !dTimeTo.isEmpty()) {
			try {
				request.setAttribute("dTimeTo", (Object) dTimeTo);
				filter.setdTimeto(new Timestamp(sdf.parse(dTimeTo).getTime()));
			} catch (ParseException e) {
				e.printStackTrace();
				request.setAttribute("errorTo", (Object) "Fecha incorrecta.");
			}
		}

		String evidenceTypeSelected = request.getParameter("type");
		if (evidenceTypeSelected != null && !evidenceTypeSelected.isEmpty()) {
			BOEvidenceDataValue dataValue = inventarioSeleccionado.getDataValuesByValue(evidenceTypeSelected, EvidenceDataValueTypeEnum.TITLE);
			
			try {
				request.setAttribute("filterType", (Object) evidenceTypeSelected);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorType", (Object) "Tipo de artefacto incorrecta.");
			}
			if (dataValue != null) {
				filter.setEvidenceType(dataValue.getCode());
			}else{
				filter.setEvidenceType(evidenceTypeSelected);
			}
		}

		String evidenceStatusSelected = request.getParameter("status");
		if (evidenceStatusSelected != null && !evidenceStatusSelected.isEmpty()) {
			BOEvidenceDataValue dataValue = inventarioSeleccionado.getDataValuesByValue(evidenceStatusSelected, EvidenceDataValueTypeEnum.COMMENT);
			
			try {
				request.setAttribute("filterStatus", (Object) evidenceStatusSelected);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorStatus", (Object) "Tipo de artefacto incorrecta.");
			}
			if (dataValue != null) {
				filter.setEvidenceStatus(dataValue.getCode());
			}else{ 
				filter.setEvidenceStatus(evidenceStatusSelected);
			}
		}
	

		return filter;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.processRequest(request, response);
	}

	public String getServletInfo() {
		return "Short description";
	}
}