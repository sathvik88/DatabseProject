//==============================================================================================	
//-CSC 4710 - Database
//-By:
//------Sathvik Konuganti
//------Santhosh Abraham
//==============================================================================================
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginRegister() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
		
		String userPassword = request.getParameter("password");
		
		User user = UserDAO.login(userName,userPassword);
		String rootEmail = "root";
		String rootPassword= "pass1234";


		if((userName.equals(rootEmail)) && (userPassword.equals(rootPassword)))
		{
			response.sendRedirect("http://localhost:8080/database/Initial.jsp");
			return;
		}
		
		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			RequestDispatcher dispatch = request.getRequestDispatcher("Home.jsp");
			dispatch.forward(request, response);
		}
		else {
			request.setAttribute("LoginFailed", "Login failed.");
			System.out.println("==================LOGIN FAILED=================="); // Debugging, prints out in terminal 
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
			dispatch.forward(request, response);
		}
	}

}


