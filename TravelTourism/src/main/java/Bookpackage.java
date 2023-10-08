

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
 * Servlet implementation class Bookpackage
 */
@WebServlet("/Bookpackage")
public class Bookpackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookpackage() {
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
		String placename=request.getParameter("placename");
		String customername=request.getParameter("customername");
		String packageprice=request.getParameter("packageprice");
		String person=request.getParameter("person");
		String date=request.getParameter("date");
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
			 String qr="insert into bookpackage values(?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(qr);
			 ps.setString(1,placename);
			 ps.setString(2,customername);
			 ps.setString(3,packageprice);
			 ps.setString(4,person);
			 ps.setString(5,date);
			 int i= ps.executeUpdate();
			 if(i>0)
			 {
				
					response.sendRedirect("homepage.jsp");
			 }
			 else {
				System.out.println("not upload");
				
				 response.sendRedirect("homepage.jsp");
			 }
			 
		 
			 con.close();
		 
		 }
		 catch(Exception e){
			//System.out.println("exception error");
			e.printStackTrace();
		 }
		
	}

}
