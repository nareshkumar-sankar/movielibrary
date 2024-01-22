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
@WebServlet("/deletemovie")
public class DeleteMovies extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("id"));
		
		Dao dao =new Dao();
		
		try {
			HttpSession session =req.getSession();
			String adminName =(String) session.getAttribute("adminname");
			
			if (adminName!=null) {
				dao.deleteMovies(id);
				req.setAttribute("movies",dao.getAllMovies());
				RequestDispatcher dispatcher =req.getRequestDispatcher("adminhome.jsp");
				dispatcher.include(req, resp);
			}
			else {
				req.setAttribute("message","Sorry access denied, Login required please...");
				RequestDispatcher dispatcher=req.getRequestDispatcher("adminlogin.jsp");
				dispatcher.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
