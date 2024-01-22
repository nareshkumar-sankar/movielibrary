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
import DTO.Admin;
@WebServlet("/adminsignup")
public class SaveAdmin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.valueOf(req.getParameter("user-id"));
		String name = req.getParameter("user-name");
		long contact = Long.valueOf(req.getParameter("user-contact"));
		String email = req.getParameter("user-email");
		String password = req.getParameter("user-password");
		
		Admin admin =new Admin();
		admin.setAdminid(id);
		admin.setAdminname(name);
		admin.setAdmincontact(contact);
		admin.setAdminemail(email);
		admin.setAdminpassword(password);
		
		Dao dao=new Dao();
		
		try {
			
			int res = dao.saveAdmin(admin);
			
			if (res>0) {
				RequestDispatcher dispatcher =req.getRequestDispatcher("admin.jsp");
				dispatcher.include(req, resp);
			}else {
				RequestDispatcher dispatcher =req.getRequestDispatcher("adminsignup.jsp");
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
