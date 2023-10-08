

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
 * Servlet implementation class Bookhotel
 */
@WebServlet("/Bookhotel")
public class Bookhotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookhotel() {
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
		String hotelname=request.getParameter("hotelname");
		String customername=request.getParameter("customername");
		String hotelprice=request.getParameter("hotelprice");
		String person=request.getParameter("person");
		String date=request.getParameter("date");
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
			 String qr="insert into bookhotel values(?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(qr);
			 ps.setString(1,hotelname);
			 ps.setString(2,customername);
			 ps.setString(3,hotelprice);
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
