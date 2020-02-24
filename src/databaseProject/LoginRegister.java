package databaseProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginRegister
 */
@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginRegister() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
		
		String userPassword = request.getParameter("password");
		
		Users user = UsersDAO.login(userName,userPassword);
		
		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			RequestDispatcher dispatch = request.getRequestDispatcher("home.jsp");
			dispatch.forward(request, response);
		}
		else {
			request.setAttribute("LoginFailed", "Login failed.");
			System.out.println("==================LOGIN FAILED==================");
			RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
			dispatch.forward(request, response);
		}
	}

}
