package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Movie;
import DTO.User;
@WebServlet("/userlogin")
public class UserLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("user-email");
		String password = req.getParameter("user-password");
		
		Dao dao =new Dao();
		
		try {
			User user=dao.FindByEmailUser(email);
			if (user!=null) {
				if (password.equals(user.getPassword())) {
					HttpSession session=req.getSession();
					session.setAttribute("user", user);
					List<Movie> movies =dao.getAllMovies();
					req.setAttribute("movies", movies);
					RequestDispatcher dispatcher =req.getRequestDispatcher("userhome.jsp");
					dispatcher.include(req, resp);
				}
				else {
					req.setAttribute("message", "* password is wrong");
					RequestDispatcher dispatcher =req.getRequestDispatcher("userlogin.jsp");
					dispatcher.include(req, resp);
				}
			}
			else {
				req.setAttribute("message", "* Email is wrong");
				RequestDispatcher dispatcher =req.getRequestDispatcher("userlogin.jsp");
				dispatcher.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
