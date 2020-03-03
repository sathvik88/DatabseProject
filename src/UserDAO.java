//==============================================================================================	
//-CSC 4710 - Database
//-By:
//------Sathvik Konuganti
//------Santhosh Abraham
//==============================================================================================
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class Connect
 */
@WebServlet("/UserDAO")
public class UserDAO {     
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	public UserDAO() {
    }
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
//==============================================================================================	
//									Connecting to DB
//==============================================================================================	
    protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://127.0.0.1:3306/comediandb?" // change schema name to match also on line 
  			          + "user=root&password=pass1234");
            System.out.println(connect);
        }
    }
    
    protected void disconnect() throws SQLException {
        if (connect != null && !connect.isClosed()) {
        	connect.close();
        }
    }
            
    public boolean insert(User user) throws SQLException {
    	connect_func();         
		String sql = "insert into  users(username, password, firstName, lastName, age, gender) values (?, ?, ?, ?, ?, ?)";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.setString(1, user.username);
		preparedStatement.setString(2, user.password);
		preparedStatement.setString(3, user.firstName);
		preparedStatement.setString(4, user.lastName);
		preparedStatement.setInt(5, user.age);
		preparedStatement.setString(6, user.gender);
//		preparedStatement.executeUpdate();
		
        boolean rowInserted = preparedStatement.executeUpdate() > 0;
        preparedStatement.close();
//        disconnect();
        return rowInserted;
    }

	public static User login(String username, String password) {
		System.out.println("Login");
		Connection connect = null;
		User user = null;
		try {	 
            connect = (Connection) DriverManager
                    .getConnection("jdbc:mysql://127.0.0.1:3306/comediandb?" + "user=root&password=pass1234"); // change schema name to match
			
            System.out.println("everything fine before query");
            PreparedStatement sql = connect.prepareStatement("select * from comediandb.users where username =? and password=?"); // change schema name to match       
            sql.setString(1, username);
            sql.setString(2, password);
            ResultSet rs = sql.executeQuery();
            System.out.println("here after query");          
            if (rs.next()) {
            	int id = rs.getInt(1);
            	String Username = rs.getString(2);
            	String passWORD = rs.getString(3);        	
            	String Fname = rs.getString(4);          	
            	String Lname = rs.getString(5);           	
            	int Age = rs.getInt(6);   
            	String Gender = rs.getString(7);
            	user = new User(id, Username,passWORD,Fname,Lname,Age, Gender);
            }                  
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		return user;
	}        
}
