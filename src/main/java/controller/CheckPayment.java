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
@WebServlet("/checkpayment")
public class CheckPayment extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		User user = (User) session.getAttribute("user");
		Movie movie = (Movie) session.getAttribute("movie");
		
		double price =Double.parseDouble(req.getParameter("user-price"));
		Dao dao =new Dao();
		if (price==movie.getMovieprice()) {
			try {
				dao.saveUserAndMovieId(user.getId(), movie.getMovieid());
				req.setAttribute("message","*your payment done successfully");
				req.setAttribute("movies", dao.getAllMovies());
				RequestDispatcher dispatcher =req.getRequestDispatcher("userhome.jsp");
				dispatcher.include(req, resp);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			req.setAttribute("message1","*your pay amount is invalid");
			RequestDispatcher dispatcher=req.getRequestDispatcher("buymovie.jsp");
			dispatcher.include(req, resp);
		}
	}
}
