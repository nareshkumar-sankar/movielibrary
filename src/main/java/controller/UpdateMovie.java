package controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.Dao;
import DTO.Movie;
@WebServlet("/updatemovie")
@MultipartConfig(maxFileSize = 5*1024*1024)
public class UpdateMovie extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int movieid= Integer.parseInt(req.getParameter("user-id"));
		String moviename = req.getParameter("user-name");
		double movieprice = Double.parseDouble(req.getParameter("user-price"));
		double movierating =  Double.parseDouble(req.getParameter("user-ratings"));
		String moviegenre = req.getParameter("user-genre");
		String movielanguage = req.getParameter("user-language");
		Part imagepart  = req.getPart("user-image");
		String link =req.getParameter("user-link");
		String description =req.getParameter("user-description");
		
		Dao dao = new Dao();
		
		Movie movie = new Movie();
		movie.setMovieid(movieid);
		movie.setMoviegenre(moviegenre);
		movie.setMovielanguage(movielanguage);
		movie.setMovieprice(movieprice);
		movie.setMovieratings(movierating);
		movie.setMoviename(moviename);
		movie.setMovielink(link);
		movie.setMoviedescription(description);;
		
		
		try {
		     if (imagepart.getSize()>0) {
		    		movie.setMovieimage(imagepart.getInputStream().readAllBytes());
					dao.updateMovie(movie);
					
					req.setAttribute("movies", dao.getAllMovies());
					RequestDispatcher dispatcher = req.getRequestDispatcher("adminhome.jsp");
					dispatcher.include(req, resp);
			}
		     else {
		    	 Movie dbmovie = dao.FindMoviesById(movieid);
					movie.setMovieimage(dbmovie.getMovieimage());
					dao.updateMovie(movie);

					req.setAttribute("movies", dao.getAllMovies());
					RequestDispatcher dispatcher = req.getRequestDispatcher("adminhome.jsp");
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
