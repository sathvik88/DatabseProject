package databaseProject;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import com.mysql.jdbc.Driver;

import javax.servlet.http.HttpServlet;

public class UsersDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////	
//	Connect	
///////////////////////////////////////////////////////////////////////////////////////////////////////////		
	protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/comediandb?"
  			          + "user=root&password=pass1234");
            System.out.println(connect);
        }
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////	
//  Disconnect	
///////////////////////////////////////////////////////////////////////////////////////////////////////////		
	protected void disconnect() throws SQLException {
        if (connect != null && !connect.isClosed()) {
        	connect.close();
        }
    }
	
	public static Users login(String username, String password) {
		System.out.println("Login");
		Connection connect = null;
		Users user = null;
		
		try {
//        	Class.forName("com.mysql.jdbc.Driver");
//			Class.forName("com.mysql.jdbc.Driver");
			
            connect = DriverManager
                    .getConnection("jdbc:mysql://127.0.0.1:3306/comediandb?" + "user=root&password=pass1234");
			
            
            PreparedStatement sql = connect.prepareStatement("select * from users where username =? and user_pswrd=?");
             
            sql.setString(1, username);
            sql.setString(2, password);
            ResultSet rs = sql.executeQuery();
            
            if (rs.next()) {
            	
//            	int userID = rs.getInt(1);
//            	int age = rs.getInt(2);
//            	String USERNAME = rs.getString(3);
//            	String gender = rs.getString(4);
//            	String email = rs.getString(5);
//            	
//            	
//            	String firstName = rs.getString(6);
//            	String lasttName = rs.getString(7);
//            	
//            	  	
//            	String PASSWORD = rs.getString(8);
//            	
//            	 
//            	user = new Users(userID,firstName, lasttName, age, email, USERNAME,PASSWORD,gender);
            	//return user;
            	
            	String Username = rs.getString(1);
            	
            	String passWORD = rs.getString(2);
            	
            	String Fname = rs.getString(3);
            	
            	String Lname = rs.getString(4);
            	
            	int Age = rs.getInt(5);
            	
            	user = new Users(Username,passWORD,Fname,Lname,Age);
            }
                      
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
		return user;
	}
	
	
}

