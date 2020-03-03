//==============================================================================================	
//-CSC 4710 - Database
//-By:
//------Sathvik Konuganti
//------Santhosh Abraham
//==============================================================================================

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

//==============================================================================================	
//								Servlet implementation class Connect
//==============================================================================================
@WebServlet("/Initializer")
public class Initializer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private PreparedStatement preparedStatement = null;
	private Initializer Initializer = null;
//==============================================================================================	
//										Connecting to DB
//==============================================================================================	
	protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://127.0.0.1:3306/comediandb?" // Change to match DB
  			          + "user=root&password=pass1234");
            System.out.println(connect);
        }
	}
//==============================================================================================	
//										Dropping Table
//==============================================================================================	
	public void addToUsersTable(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		String drop = "DROP table if exists users;";
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(drop);
		preparedStatement.executeUpdate();
		// Creates Table
		String sql = "CREATE TABLE users (\r\n" + 
				"	  id INT NOT NULL auto_increment,\r\n" + 
				"	  username VARCHAR(50) NOT NULL , \r\n" + 
				"	  password VARCHAR(45) NOT NULL,\r\n" + 
				"	  firstName VARCHAR(45), \r\n" + 
				"	  lastName VARCHAR(45),\r\n" + 
				"	  age INT,\r\n" + 
				"	  gender VARCHAR(45),\r\n" + 
				"	  PRIMARY KEY(id)\r\n" + 
				");\r\n" + 
				"";	
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
//==============================================================================================	
//						 		Inserting 10 Default Queries into DB
//==============================================================================================
		String sql2 = "INSERT INTO users(username, password , firstName, lastName, age, gender)  \r\n" +
				"VALUES ('root', 'pass1234', 'Root', 'Patel', '69', 'M'),\r\n" +
				"('jason@gmail.com', 'jason123', 'Jason', 'Matt', '21', 'M'),\r\n" + 
				"('drake@gmail.com', 'ovo123', 'Drake', 'Grahm', '21', 'M'),\r\n" + 
				"('travis@gmail.com', 'jackboys', 'Travis', 'Scott', '21', 'F'),\r\n" + 
				"('don@gmail.com', 'don123', 'Don', 'Toliver', '21', 'M'),\r\n" + 
				"('nav@gmail.com', 'perc', 'Nav', 'Raj', '21', 'M'),\r\n" + 
				"('levi@gmail.com', 'yesirski', 'Levi', 'Bentlee', '21', 'M'),\r\n" + 
				"('kai@gmail.com', 'boba', 'Kai', 'Bentlee', '21', 'M'),\r\n" + 
				"('zak@gmail.com', 'longo123', 'Zak', 'Jack', '21', 'M'),\r\n" + 
				"('jet@gmail.com', 'blue', 'Jet', 'Bentlee', '21', 'M')\r\n" + 
				";";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Users created succesfully.");
		connect.close();
//==============================================================================================	
// 						Refreshes the home page showing initialized table 
//==============================================================================================		
		response.sendRedirect("Home.jsp"); 
	}
//==============================================================================================	
//										Get Request
//==============================================================================================
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Initializer = new Initializer();
		try {
			addToUsersTable(request, response);
		}catch (Exception e) {
			System.out.println(e);
		}
	}
}

