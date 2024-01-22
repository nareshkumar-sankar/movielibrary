package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Dao;
import DTO.Movie;

@WebServlet("/editmovie")
public class EditMovie extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		int id = Integer.parseInt(req.getParameter("id"));
		Dao dao = new Dao();
		try {
			HttpSession session =req.getSession();
			String adminname =(String) session.getAttribute("adminname");
			
			if (adminname!=null) {
				Movie m = dao.FindMoviesById(id);
				req.setAttribute("movie", m);
				RequestDispatcher dispatcher = req.getRequestDispatcher("editmovie.jsp");
				dispatcher.include(req, resp);
			}
			else {
				req.setAttribute("message","Sorry access denied, Login required please...");
				RequestDispatcher dispatcher=req.getRequestDispatcher("adminlogin.jsp");
				dispatcher.include(req, resp);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}