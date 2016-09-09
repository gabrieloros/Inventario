/*
 * Decompiled with CFR 0_114.
 * 
 * Could not load the following classes:
 *  javax.servlet.ServletException
 *  javax.servlet.http.HttpServlet
 *  javax.servlet.http.HttpServletRequest
 *  javax.servlet.http.HttpServletResponse
 */
package com.brujula.locpic.viewer.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileServlet
extends HttpServlet {
    private String filePath;

    public void init() throws ServletException {
        this.filePath = "";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedFile = request.getPathInfo();

        ClassLoader classLoader = FileServlet.class.getClassLoader();
        String basePath = classLoader.getResource("").getPath();
        basePath = basePath.replace("%20", " ");
        File my_file = new File(basePath+this.filePath, URLDecoder.decode(requestedFile, "UTF-8"));

     // This should send the file to browser
        OutputStream out = response.getOutputStream();
        FileInputStream in = new FileInputStream(my_file);
        byte[] buffer = new byte[4096];
        int length;
        while ((length = in.read(buffer)) > 0){
           out.write(buffer, 0, length);
        }
        in.close();
        out.flush();
        
    }
}