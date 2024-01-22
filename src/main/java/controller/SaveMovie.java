package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.w3c.dom.stylesheets.LinkStyle;

import DAO.Dao;
import DTO.Movie;
@WebServlet("/savemovie")
@MultipartConfig(maxFileSize = 5*1024*1024)
public class SaveMovie extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	int id =Integer.parseInt(req.getParameter("user-id"));
    	String name =req.getParameter("user-name");
    	double price =Double.parseDouble(req.getParameter("user-price"));
    	double ratings =Double.parseDouble(req.getParameter("user-ratings"));
    	String genre =req.getParameter("user-genre");
    	String language =req.getParameter("user-language");
    	Part imagepart =req.getPart("user-image");
    	
    	Movie movie =new Movie();
    	
    	movie.setMovieid(id);
    	movie.setMoviename(name);
    	movie.setMovieprice(price);
    	movie.setMovieratings(ratings);
    	movie.setMoviegenre(genre);
    	movie.setMovielanguage(language);
    	movie.setMovieimage(imagepart.getInputStream().readAllBytes());
    	
    	Dao dao =new Dao();
    	
    	try {
    		HttpSession session =req.getSession();
    		String adminName =(String) session.getAttribute("adminname");
			if (adminName!=null) {
				
				dao.saveMovie(movie);
				List<Movie> movies =dao.getAllMovies();
				req.setAttribute("movies", movies);
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
