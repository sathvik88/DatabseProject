//==============================================================================================	
//-CSC 4710 - Database
//-By:
//------Sathvik Konuganti
//------Santhosh Abraham
//==============================================================================================
public class User {
	
	protected int id;
    protected int age;
    protected String username;
    protected String password;
    protected String firstName;
    protected String lastName;
    protected String gender;
 
    public User() {
    }
 
    public User(int id) {
        this.id = id;
    }
 
    public User(int id, String username, String password, String firstName, String lastName, int age, String gender) {
        this(username, password, firstName, lastName, age, gender);
        this.id = id;
    }
     
    public User(String username, String password, String firstName, String lastName, int age, String gender) {
        this.username = username;
    	this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.gender = gender;
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getName() {
        return username;
    }
 
    public void setName(String username) {
        this.username = username;
    }
 
    public String getAddress() {
        return password;
    }
 
    public void setAddress(String password) {
        this.password = password;
    }
 
    public String getStatus() {
        return firstName;
    }
 
    public void setStatus(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
 
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}