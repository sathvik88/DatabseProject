package databaseProject;

public interface UsersDAO {
	
	public int insertUsers(Users u);
	public Users getUsers(String userName, String password);
}
