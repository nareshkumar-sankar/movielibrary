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
import DTO.Admin;
import DTO.Movie;
@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String email =req.getParameter("user-email");
    	String password =req.getParameter("user-password");
    	
    	Dao dao =new Dao();
    	try {
			Admin admin = dao.findByEmail(email);
			
			if (admin!=null) {
				if (admin.getAdminpassword().equals(password)) {
					HttpSession session=req.getSession();
					session.setAttribute("adminname",admin.getAdminname());
					
					List<Movie> movies = dao.getAllMovies();
					req.setAttribute("movies",movies);
					RequestDispatcher dispatcher = req.getRequestDispatcher("adminhome.jsp");
					dispatcher.include(req, resp);
				}
				else {
					req.setAttribute("message","*password is wrong");
					RequestDispatcher dispatcher = req.getRequestDispatcher("adminlogin.jsp");
					dispatcher.include(req, resp);
				}
			}
			else {
				req.setAttribute("message","*email is wrong");
				RequestDispatcher dispatcher = req.getRequestDispatcher("adminlogin.jsp");
				dispatcher.include(req, resp);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
