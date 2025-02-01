

<%@ page import="java.sql.*,java.io.*,java.util.*" %> 


<%@ page trimDirectiveWhitespaces="true" %>
<%
String path=request.getParameter("style3");

if(path!=null && !path.equals("")){
	File f=new File(path);
			
	InputStream readImg=new FileInputStream(f);
	int len=readImg.available();
	
	byte [] rb = new byte[len];			
	
	
	int index=readImg.read(rb, 0, len);  
	System.out.println("(rb.length="+len);
	
	response.reset();
	response.setContentType("image/jpg");
	response.setHeader("Content-disposition","attachment; filename=" );
	response.getOutputStream().write(rb,0,len); 
	response.getOutputStream().flush();  	
}
%>