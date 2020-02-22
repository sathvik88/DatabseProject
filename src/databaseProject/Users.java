package databaseProject;

public class Users {
	protected String username;
    protected String password;
    protected String firstName;
    protected String lastName;
    protected int age;
    
    public Users(){	
	}
    
    public Users(String username) {
    	this.username = username;
    }
    
    public Users(int age, String username, String password, String firstName, String lastName) {
        this(password, firstName, lastName, age);
        this.username = username;
    }
    
    public Users(String password, String firstName, String lastName, int age) {
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
    }
    
    public String getUsername(){
    	return username;
    }
    
    public void setUsername(String username){
    	this.username = username;
    }
    
    public String getPassowrd(){
    	return password;
    }
    
    public void setPassword(String password){
    	this.password = password;
    }
    
    public String getfirstName(){
    	return firstName;
    }
    
    public void setfirstName(String firstName){
    	this.firstName = firstName;
    }
    
    public String getlastName(){
    	return lastName;
    }
    
    public void setlastName(String lastName){
    	this.lastName = lastName;
    }
    
    public int getAge(){
    	return age;
    }
    
    public void setAge(int age){
    	this.age = age;
    }
    
}
	
