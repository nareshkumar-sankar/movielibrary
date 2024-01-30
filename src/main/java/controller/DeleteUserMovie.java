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
import DTO.User;
@WebServlet("/deleteusermovie")
public class DeleteUserMovie extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("id"));
		
		Dao dao =new Dao();
		
		try {
			HttpSession session =req.getSession();
			String userName =(String) session.getAttribute("username");
			User user =(User) session.getAttribute("user");
			if (userName!=null) {
				dao.deleteUserMovies(id);
				req.setAttribute("usermovie", dao.getUserMovies(user.getId()));
				RequestDispatcher dispatcher =req.getRequestDispatcher("usermovies.jsp");
				dispatcher.include(req, resp);
			}
			else {
				req.setAttribute("message","Sorry access denied, Login required please...");
				RequestDispatcher dispatcher=req.getRequestDispatcher("userlogin.jsp");
				dispatcher.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
