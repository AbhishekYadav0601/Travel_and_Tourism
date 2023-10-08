import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Alogin
 */
@WebServlet("/Alogin")
public class Alogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 PrintWriter out=response.getWriter();
		 response.setContentType("text/html");
		 String password= request.getParameter("password");
		 String email= request.getParameter("email");
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
			 String qr= "select * from signup where password=? and email=?";
			 PreparedStatement ps=con.prepareStatement(qr);
			 ps.setString(1,password);
			 ps.setString(2,email);
			 ResultSet rs=ps.executeQuery(); 
			  if(rs.next()){  
				 
				//  HttpSession session=request.getSession();
				 request.setAttribute("email", email);
			  response.sendRedirect("adminpage.jsp");
			    }  
			    else{ 
			    	     response.sendRedirect("adminlogin.jsp");
			       } 
			  con.close();
		 }
		 catch(Exception e){
			 out.print(e);
		 }
	}

}
