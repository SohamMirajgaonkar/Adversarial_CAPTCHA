
<%@page import="com.connection.DBConnection"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 


<%@ page trimDirectiveWhitespaces="true" %>
<%
int shapid = Integer.parseInt(request.getParameter("shapeId"));
int capid = Integer.parseInt(request.getParameter("capId"));
		String sql = "SELECT captchafile FROM tblshape where id=? and captchaid=?";
		PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
		pstmt.setInt(1, shapid);
		pstmt.setInt(2, capid);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			InputStream is = rs.getBinaryStream(1);
			
			byte[] profilePic = null;
		   	byte[] buffer = new byte[1024*1024*50];
			int bytesRead;		
			if(is!=null){
				while ((bytesRead =is.read(buffer)) != -1)
				{
				   	response.reset();
					response.setContentType("image/jpg");
					response.setHeader("Content-disposition","attachment; filename=" );
			    	response.getOutputStream().write(buffer, 0, bytesRead);
			    	response.getOutputStream().flush(); 
			 	}
			}		
	
		}	
		%>