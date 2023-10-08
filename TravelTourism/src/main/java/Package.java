import java.sql.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

/**
 * Servlet implementation class Package
 */
@WebServlet("/Package")
public class Package extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest session;
	private HttpServletRequest req;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Package() {
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
		String place= request.getParameter("place");
		 String city= request.getParameter("city");
		 String price= request.getParameter("price");
		 String day= request.getParameter("day");
		String dis=request.getParameter("dis");
		 Part p=request.getPart("file");
			
		 String fileName = p.getSubmittedFileName();
		 HttpSession session = request.getSession();
		 
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
			 String qr="insert into pakage values(?,?,?,?,?,?)";
			 PreparedStatement ps=con.prepareStatement(qr);
			 ps.setString(1,place);
			 ps.setString(2,city);
			 ps.setString(3,price);
			 ps.setString(4,day);
			ps.setString(5,fileName);
			 ps.setString(6, dis);
			 int i= ps.executeUpdate();
			 if(i>0)
			 {
				 String path = getServletContext().getRealPath("" )+"img";

					File file = new File(path);
                      System.out.print(path);
					p.write(path + File.separator + fileName);

					session.setAttribute("msg", "Upload Sucess");

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


