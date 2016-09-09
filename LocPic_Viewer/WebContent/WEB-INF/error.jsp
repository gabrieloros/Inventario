<%-- 
    Document   : error
    Created on : 30-may-2013, 20:15:15
    Author     : juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ERROR</h1>
        
        <%
            if(exception != null){
                out.println(exception.getMessage());
                StackTraceElement[] sts = exception.getStackTrace();
                for(StackTraceElement st : sts){
                    out.println(st);
                }
            }
        %>
        
    </body>
</html>
