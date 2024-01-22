package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;
import DTO.User;
@WebServlet("/usersigup")
public class SaveUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("user-id"));
		String name =req.getParameter("user-name");
		long contact =Long.parseLong(req.getParameter("user-contact"));
		String email = req.getParameter("user-email");
		String password =req.getParameter("user-password");
		
		User user =new User();
		user.setId(id);
		user.setName(name);
		user.setContact(contact);
		user.setEmail(email);
		user.setPassword(password);
		
		Dao dao =new Dao();
		try {
			((Dao) dao).saveUser(user);
			RequestDispatcher dispatcher =req.getRequestDispatcher("user.jsp");
			dispatcher.include(req, resp);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
