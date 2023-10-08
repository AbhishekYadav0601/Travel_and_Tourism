
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
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
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
			 String qr="insert into user values(?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(qr);
			 ps.setString(1,name);
			 ps.setString(2,password);
			 ps.setString(3,email);
			 ps.setString(4,phone);
			 int i= ps.executeUpdate();
			 if(i>0)
			 {
				 //session.setAttribute("msg", "Upload Sucess");
					response.sendRedirect("userlogin.jsp");
			 }
			 else {
				System.out.println("not upload");
				
				 response.sendRedirect("signup.jsp");
			 }
			 
		 
			 con.close();
		 
		 }
		 catch(Exception e){
			//System.out.println("exception error");
			e.printStackTrace();
		 }
		
	}

}
