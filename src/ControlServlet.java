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
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
 
public class ControlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private PostDAO postDAO;
 
    public void init() {
        userDAO = new UserDAO(); 
        postDAO = new PostDAO();
    
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
            case "/insert":
            	insertUser(request, response);
                break;
            case "/insertPost":
            	insertPost(request,response);
            
            default:          	
            	          	
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    // to insert a user
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
        dispatcher.forward(request, response);
    }
 
//==============================================================================================	
//			after the data inserted, this method will be called to insert into the DB
//==============================================================================================
    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String  lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        String  gender = request.getParameter("gender");
        User newUser = new User(username, password, firstName, lastName, age, gender);
        userDAO.insert(newUser);
        response.sendRedirect("Login.jsp");  // The sendRedirect() method works at client side and sends a new request
    }
    private void insertPost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String url = request.getParameter("url");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String  tags = request.getParameter("tags");
        Post newPost = new Post(url, title, description, tags);
        postDAO.insert(newPost);
        response.sendRedirect("VideoPosts.jsp");
    }
    
    
 
}