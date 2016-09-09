package com.brujula.locpic.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.brujula.locpic.core.boEntities.BOEvidence;
import com.brujula.locpic.core.enums.EvidenceStatusEnum;
import com.brujula.locpic.core.impl.Filter;
import com.brujula.locpic.core.impl.LBSFacade;
import com.brujula.locpic.core.impl.LBSResponse;
import com.brujula.locpic.dto.EvidenceARest;
import com.brujula.locpic.dto.ResponseDTO;
import com.brujula.locpic.persistence.exception.DaoException;
import com.brujula.locpic.service.service.EvidenceService;
import com.google.gson.Gson;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.BodyPartEntity;
import com.sun.jersey.multipart.FormDataParam;
import com.sun.jersey.multipart.MultiPart;

@Path("/files")
public class EvidenceController {

	private static final String SERVER_UPLOAD_LOCATION_FOLDER = "C://TEST_WIO/";
	private static Gson gson = new Gson();

	@PUT
	@Consumes({MediaType.APPLICATION_JSON})
	@Path("/relocate")
	public Response relocate(String eviRelocate) {

		//String eviRelocate ="";
		System.out.println("Data Received: " + eviRelocate);
		ResponseDTO responseDTO = new ResponseDTO();
		responseDTO.setResult(true);

		JSONArray jsonArray = new JSONArray(eviRelocate);

		for (int x = 0; x < jsonArray.length(); x++) {
			JSONObject evidence = jsonArray.getJSONObject(x);
			updatePosition((int) evidence.get("id"), (double) evidence.get("lat"), (double) evidence.get("lon"));

		}

		responseDTO.setResult(true);
		String output = gson.toJson(responseDTO);
		//return Response.status(200).entity(output).build();
		return Response.status(200).build();
	}

	private boolean updatePosition(int id, double latitude, double longitude) {
		boolean response = false;
		try {
			BOEvidence boEvidence = EvidenceService.GetEvidence(id);
			boEvidence.setLatitude(latitude);
			boEvidence.setLongitude(longitude);
			EvidenceService.Save(boEvidence);
			response = true;
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;
	}

	@GET
	@Consumes(MediaType.TEXT_PLAIN)
	@Path("/evidence/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getEvidence(@PathParam("id") long evidenceId) {

		ResponseDTO responseDTO = new ResponseDTO();
		responseDTO.setResult(true);

		BOEvidence boEvidence = null;
		try {
			boEvidence = EvidenceService.GetEvidence(evidenceId);
		} catch (DaoException e) {
			e.printStackTrace();
		}
		

		EvidenceARest evidence = null;
		if (boEvidence != null) {
			evidence = new EvidenceARest();
			evidence.setTitle(boEvidence.getTitle());
			evidence.setComment(boEvidence.getComment());
			evidence.setLat(boEvidence.getLatitude());
			evidence.setLon(boEvidence.getLongitude());
			evidence.setPic(boEvidence.getFile());
			evidence.setCount(boEvidence.getCount());
			evidence.setUserName(boEvidence.getUser().getName());

			responseDTO.setResult(true);
			responseDTO.setData(evidence);
		}

		String output = gson.toJson(responseDTO);
		return Response.status(200).entity(output).build();
	}

	@GET
	@Path("/evidence/{id}/thumbnail")
	@Produces("image/jpg")
	public Response getEvidenceThumbnail(@PathParam("id") long evidenceId) {
		Gson gson = new Gson();

		BOEvidence boEvidence = null;
		try {
			boEvidence = EvidenceService.GetEvidence(evidenceId);
		} catch (DaoException e) {
			e.printStackTrace();
		}

		File file = new File(evidenceId + ".jpg");
		if (boEvidence != null) {
			try {
				FileOutputStream fileOuputStream = new FileOutputStream(file);
				fileOuputStream.write(boEvidence.getFile());
				fileOuputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		ResponseBuilder response = Response.ok((Object) file);
		response.header("Content-Disposition", "attachment; filename=" + evidenceId + ".jpg");
		return response.build();

	}

	@GET
	@Path("/evidence/geoinversa")
	public Response geoinversa() {

		List<BOEvidence> evidences;
		Filter filter = new Filter();
		filter.setEvidenceStatus(Integer.toString(EvidenceStatusEnum.OK.getCode()));
		try {
			evidences = EvidenceService.GetEvidences(filter);
			int x = 0;
			int y = 0;
			for (BOEvidence evi : evidences) {
				if (y>2000)
				{
					break;
				}
				
				if (evi.getAddress() == null || evi.getAddress().isEmpty()) {
					while(x > 10){
						Thread.sleep(2000);
					}
					
					GeoreferenceInverse geoEvi = new GeoreferenceInverse(evi, x);
					geoEvi.run();
					y++;
				}
			}
		} catch (Exception ex) {

		}
		ResponseBuilder response = Response.ok();
		return response.build();
	}



	@GET
	@Path("/evidence/download")
	public Response getDownload() {
		List<BOEvidence> evidences;
		Filter filter = new Filter();
		filter.setEvidenceStatus(Integer.toString(EvidenceStatusEnum.ROTA.getCode()));
		try {
			evidences = EvidenceService.GetEvidences(filter);
			int x = 0;
			for (BOEvidence evi : evidences) {
				if (evi != null) {

					try {
						File file = new File(
								"c:\\Fito\\Desarrollo\\LOUREDO\\LocPic archivos\\Fotos\\ROTA\\" + evi.getId() + ".jpg");

						if (!file.exists()) {
							File file2 = new File("c:\\Fito\\Desarrollo\\LOUREDO\\LocPic archivos\\Fotos\\COMPLETO\\"
									+ evi.getId() + ".jpg");
							if (file2.exists()) {
								copyFile(file2, file);
							} else {
								x++;
								if (x > 50) {
									x = 0;
									// Thread.sleep(60000);
								}
								evi = EvidenceService.GetEvidence(evi.getId());
								FileOutputStream fileOuputStream = new FileOutputStream(file);
								fileOuputStream.write(evi.getFile());
								fileOuputStream.close();
							}
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

			}

		} catch (DaoException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ResponseBuilder response = Response.ok();
		response.header("Content-Disposition", "attachment; filename=1.jpg");
		return response.build();

	}

	private void copyFile(File sourceFile, File destFile) throws IOException {
		if (!sourceFile.exists()) {
			return;
		}
		if (!destFile.exists()) {
			destFile.createNewFile();
		}
		FileChannel source = null;
		FileChannel destination = null;
		source = new FileInputStream(sourceFile).getChannel();
		destination = new FileOutputStream(destFile).getChannel();
		if (destination != null && source != null) {
			destination.transferFrom(source, 0, source.size());
		}
		if (source != null) {
			source.close();
		}
		if (destination != null) {
			destination.close();
		}

	}

	/**
	 * Upload a File
	 */

	@POST
	@Path("/upload")
	@Consumes({ MediaType.MULTIPART_FORM_DATA, MediaType.APPLICATION_JSON })
	public Response uploadFile(@FormDataParam("file") InputStream fileInputStream,
			@FormDataParam("file") FormDataContentDisposition contentDispositionHeader,
			@FormDataParam("evidence") String jsonEvidence)

	{
		// String filePath = SERVER_UPLOAD_LOCATION_FOLDER +
		// contentDispositionHeader.getFileName();
		ResponseDTO responseDTO = new ResponseDTO();

		Gson gson = new Gson();
		try {

			EvidenceARest evidence = gson.fromJson(URLDecoder.decode(jsonEvidence), EvidenceARest.class);

			LBSFacade lbsService = new LBSFacade();
			BOEvidence boEvidence = new BOEvidence();

			boEvidence.setImei(evidence.getImei());
			boEvidence.setTitle(evidence.getTitle().trim());

			boEvidence.setComment(evidence.getComment().trim());
			boEvidence.setLatitude(evidence.getLat());
			boEvidence.setLongitude(evidence.getLon());
			boEvidence.setFileName(contentDispositionHeader.getFileName());
			boEvidence.setCaptureDTime(evidence.getLocTime());
			boEvidence.setFile(getFile(fileInputStream));

			LBSResponse coreResponse = lbsService.AddEvidence(boEvidence);
			if (coreResponse != null) {
				responseDTO.setResult(true);
				responseDTO.setData(coreResponse);
			} else {
				responseDTO.setResult(false);
			}

		} catch (Exception e) {
			System.out.print(e.getMessage());
			responseDTO.setResult(false);
			responseDTO.setData(e.getMessage());
		}

		String output = gson.toJson(responseDTO);
		return Response.status(200).entity(output).build();

	}

	private byte[] getFile(InputStream uploadedInputStream) {

		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		byte[] bytes = null;

		try {
			int read = 0;
			bytes = new byte[1024];

			while ((read = uploadedInputStream.read(bytes)) != -1) {
				buffer.write(bytes, 0, read);
			}
			buffer.flush();

		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer.toByteArray();
	}

	// save uploaded file to a defined location on the server
	private void saveFile(InputStream uploadedInputStream, String serverLocation) {

		try {
			OutputStream outpuStream = new FileOutputStream(new File(serverLocation));
			int read = 0;
			byte[] bytes = new byte[1024];

			outpuStream = new FileOutputStream(new File(serverLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				outpuStream.write(bytes, 0, read);
			}
			outpuStream.flush();
			outpuStream.close();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Path("/evidence")
	public Response post(MultiPart multiPart) {
		// First part contains a Project object
		EvidenceARest evidence = multiPart.getBodyParts().get(0).getEntityAs(EvidenceARest.class);
		System.out.println("getImei : " + evidence.getImei());
		System.out.println("getLat : " + evidence.getLat());
		System.out.println("getLon : " + evidence.getLon());
		System.out.println("getLocTime : " + evidence.getLocTime());

		// get the second part which is the project logo
		BodyPartEntity bpe = (BodyPartEntity) multiPart.getBodyParts().get(1).getEntity();
		String id = UUID.randomUUID().toString();
		boolean isProcessed = false;
		String message = null;
		try {
			InputStream source = bpe.getInputStream();
			BufferedImage bi = ImageIO.read(source);

			File file = new File("/received_" + id + ".jpg");
			// storing the image to file system.
			if (file.isDirectory()) {
				ImageIO.write(bi, "jpg", file);
			} else {
				file.mkdirs();
				ImageIO.write(bi, "jpg", file);
			}
			isProcessed = true;

		} catch (Exception e) {
			message = e.getMessage();
		}
		if (isProcessed) {
			return Response.status(Response.Status.ACCEPTED).entity("Attachements processed successfully.")
					.type(MediaType.TEXT_PLAIN).build();
		}

		return Response.status(Response.Status.BAD_REQUEST).entity("Failed to process attachments. Reason : " + message)
				.type(MediaType.TEXT_PLAIN).build();
	}

}