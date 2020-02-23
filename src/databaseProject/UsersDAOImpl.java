package databaseProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsersDAOImpl implements UsersDAO {

	static Connection con;
	static PreparedStatement ps;
	@Override
	public int insertUsers(Users u) {
		int status = 0;
		try {
			con = MyConnectionProvider.getCon();
			ps = con.prepareStatement("inset into user values(?,?)");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getfirstName());
			ps.setString(4, u.getlastName());
			status = ps.executeUpdate();
			con.close();		
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public Users getUsers(String userName, String password) {
		Users u = new Users();
		try {
			con=MyConnectionProvider.getCon();
			ps = con.prepareStatement("select * from user where userid=? and password=?");
			ps.setString(1, userName);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u.setUsername(rs.getString(1));
				u.setPassword(rs.getString(2));				
				u.setfirstName(rs.getString(3));
				u.setlastName(rs.getString(4));
			}

		}catch(Exception e) {
			System.out.println(e);
		}
		
		return u;
	}

}
