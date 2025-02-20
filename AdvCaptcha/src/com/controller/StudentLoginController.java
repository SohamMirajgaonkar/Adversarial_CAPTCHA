package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.algo.createotp;
import com.bean.StudentBean;
import com.dao.StudentDao;


/**
 * Servlet implementation class StudentLoginController
 */
@WebServlet("/StudentLoginController")
public class StudentLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		StudentDao dao=new StudentDao();
		StudentBean std=dao.CheckStudent(email, password);
		
		if(std == null) {
			out.println("<script type=\"text/javascript\">");
			 out.println("alert('No Such User Present...')");
			 out.println("location='StudentLogin.jsp';");
			 out.println("</script>");
		}
		else if((std.getEmail()!=null && std.getEmail()!="") && (std.getPassword()!=null && std.getPassword()!=""))
		{
			String result=dao.classify();
			System.out.println(result);
			if(result.equalsIgnoreCase("yes"))
			{
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User Login Success!!!');");
				out.println("location='StudentHome.jsp';");
				out.println("</script>");
			
			
			}
			
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('click on captcha...');");
				out.println("location='StudentLogin.jsp';");
				out.println("</script>");
			}}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('click on captcha...');");
				out.println("location='StudentLogin.jsp';");
				out.println("</script>");

			}
	        
		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
