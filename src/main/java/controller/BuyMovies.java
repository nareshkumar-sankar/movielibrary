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
import DTO.User;
@WebServlet("/buymovie")
public class BuyMovies extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("id"));
		
		Dao dao = new Dao();
		HttpSession session =req.getSession();
		try {
			Movie movie=dao.FindMoviesById(id);
			session.setAttribute("movie", movie);
			User user=(User) session.getAttribute("user");
			if (dao.checkUserAndMovie(user.getId(),movie.getMovieid())) {
				RequestDispatcher dispatcher =req.getRequestDispatcher("buymovie.jsp");
				dispatcher.include(req, resp);
			}
			else {
				req.setAttribute("movies",dao.getAllMovies());
				req.setAttribute("message","you are already buy this movie");
				RequestDispatcher dispatcher =req.getRequestDispatcher("userhome.jsp");
				dispatcher.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
