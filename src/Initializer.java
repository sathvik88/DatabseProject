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
		response.sendRedirect("Initial.jsp"); 
	}
	public void addToVideosTable(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
		String drop = "DROP table if exists posts;";
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(drop);
		preparedStatement.executeUpdate();
		// Creates Table
		String sql = "CREATE TABLE posts (\r\n" + 
				"	  id INT NOT NULL auto_increment,\r\n" + 
				"	  comedian VARCHAR(60), \r\n" +
				"	  url VARCHAR(500), \r\n" + 
				"	  title VARCHAR(150),\r\n" + 
				"	  description VARCHAR(150), \r\n" + 
				"	  tags VARCHAR(45),\r\n" + 
				"	  score VARCHAR(45),\r\n" + 
				"	  comment VARCHAR(500),\r\n" + 
				"	  PRIMARY KEY(id)\r\n" + 
				");\r\n" + 
				"";	
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		System.out.println("created table succesfully.");
//==============================================================================================	
//						 		Inserting 10 Default Queries into DB
//==============================================================================================
		String sql2 = "INSERT INTO `comedian`.`posts` (`comedian`, `url`, `title`, `description`, `tags`, `score`, `comment`) " // Change comedian to match your db name 
				+ "VALUES ('Kevin Hart', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/byVefTTeKww\" frameborder=\"0\" "
				+ "allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', "
				+ "'Kevin Hart House Got Robbed', 'Kevin Hart bought 9 guns and hid them in gun compartments', 'Funny', 'Excellent', 'So funny'), "
				+ "('Gabriel Iglesias', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ux8GZAtCN-M\" frameborder=\"0\" allow=\"accelerometer; "
				+ "autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', "
				+ "'Fluffy goes to India', 'Happy throwback Thursday from 2014!', 'Comedy', 'Good','Love this guy!'), "
				+ "('Russell Peters', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/goMsCPQYhlQ\" frameborder=\"0\" allow=\"accelerometer; "
				+ "autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', "
				+ "'Louis Vuitton', 'Do not try to sell a Louis Vuitton bag to an Indian!', 'Russell, Funny', 'Excellent', 'Awesome'), "
				+ "('Amy Schumer','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WggRodqiaGU\" frameborder=\"0\" allow=\"accelerometer; autoplay; "
				+ "encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','STAND UP Live at Apollo 2019','Amy Schumer Women Who Kill','Cool, Nice','Poor','Boring'); \r\n" +
				";";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Posts created succesfully.");
		connect.close();
//==============================================================================================	
// 						Refreshes the home page showing initialized table 
//==============================================================================================		
		//response.sendRedirect("Initial.jsp"); 
	}
//==============================================================================================	
//										Get Request
//==============================================================================================
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Initializer = new Initializer();
		try {
			addToUsersTable(request, response);
			addToVideosTable(request, response);
		}catch (Exception e) {
			System.out.println(e);
		}
	}
}

