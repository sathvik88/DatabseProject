package databaseProject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginRegister
 */
@WebServlet("/loginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginRegister() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersDAO ud = new UsersDAOImpl();
		
		String userName=request.getParameter("username");
		String password=request.getParameter("password1");
		String submitType=request.getParameter("submit");
		Users u = ud.getUsers(userName, password);
		if(submitType.equals("login")&& u!=null && u.getfirstName()!=null && u.getlastName()!=null){
			request.setAttribute("message", u.getfirstName()); 
			request.getRequestDispatcher("home.jsp").forward(request,response);
		}else if(submitType.equals("register")){
			u.setfirstName(request.getParameter("firstName"));
			u.setlastName(request.getParameter("lastName"));
			u.setPassword(password);
			u.setPassword(userName);
			ud.insertUsers(u);
			request.setAttribute("successMessage","Registration done, please login!");
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}else {
			request.setAttribute("message","Data Not Found, click on Register!");
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
		
		
	}

}
