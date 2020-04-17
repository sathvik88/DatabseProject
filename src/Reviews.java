

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class Reviews
 */
@WebServlet("/Reviews")
public class Reviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private PreparedStatement preparedStatement = null;
	private Reviews Reviews = null;

	protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://127.0.0.1:3306/comedian?" // Change to match DB also change default youtube db 
  			          + "user=root&password=glamboy99");
            System.out.println(connect);
        }
	}
	
	public void addReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		String drop = "DROP table if exists reviews;";
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(drop);
		preparedStatement.executeUpdate();
		// Creates Table
		String sql = "CREATE TABLE reviews (\r\n" + 
				"	  id INT NOT NULL auto_increment,\r\n" + 
				"	  comedian VARCHAR(60) NOT NULL , \r\n" +  
				"	  score VARCHAR(45),\r\n" + 
				"	  comment VARCHAR(500),\r\n" + 
				"	  PRIMARY KEY(id)\r\n" + 
				");\r\n" + 
				"";	
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		
		String sql2 = "INSERT INTO reviews(comedian, score, comment) SELECT comedian, score, comment FROM posts \r\n" +
				";";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Reviews created succesfully.");
		connect.close();
		response.sendRedirect("VideoPosts.jsp"); 
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reviews = new Reviews();
		try {
			addReview(request, response);
		}catch (Exception e) {
			System.out.println(e);
		}
	}

}
