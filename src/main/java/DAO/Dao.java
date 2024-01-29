package DAO;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import DTO.Admin;
import DTO.Movie;
import DTO.User;

public class Dao {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/db2", "root", "root");
	}

	public int saveAdmin(Admin admin) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("insert into admin values(?,?,?,?,?)");

		pst.setInt(1, admin.getAdminid());
		pst.setString(2, admin.getAdminname());
		pst.setLong(3, admin.getAdmincontact());
		pst.setString(4, admin.getAdminemail());
		pst.setString(5, admin.getAdminpassword());

		return pst.executeUpdate();

	}

	public Admin findByEmail(String adminemail) throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();
		PreparedStatement pst = connection.prepareStatement("select * from admin where adminemail = ?");

		pst.setString(1, adminemail);

		ResultSet rs = pst.executeQuery();
		Admin a = new Admin();
		if (rs.next()) {

			a.setAdminid(rs.getInt(1));
			a.setAdminname(rs.getString(2));
			a.setAdmincontact(rs.getLong(3));
			a.setAdminemail(rs.getString(4));
			a.setAdminpassword(rs.getString(5));

			return a;
		} else {
			return null;
		}
	}

	public int saveMovie(Movie movie) throws SQLException, ClassNotFoundException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("insert into movie values(?,?,?,?,?,?,?)");

		pst.setInt(1, movie.getMovieid());
		pst.setString(2, movie.getMoviename());
		pst.setDouble(3, movie.getMovieprice());
		pst.setDouble(4, movie.getMovieratings());
		pst.setString(5, movie.getMoviegenre());
		pst.setString(6, movie.getMovielanguage());
		Blob imageblob = new SerialBlob(movie.getMovieimage());
		pst.setBlob(7, imageblob);

		return pst.executeUpdate();

	}

	public List<Movie> getAllMovies() throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select * from movie");
		ResultSet rs = pst.executeQuery();

		List<Movie> moviesList = new ArrayList<Movie>();

		while (rs.next()) {
			Movie movie = new Movie();
			movie.setMovieid(rs.getInt(1));
			movie.setMoviename(rs.getString(2));
			movie.setMovieprice(rs.getDouble(3));
			movie.setMovieratings(rs.getDouble(4));
			movie.setMoviegenre(rs.getString(5));
			movie.setMovielanguage(rs.getString(6));
			Blob b = rs.getBlob(7);
			byte[] img = b.getBytes(1, (int) b.length());
			movie.setMovieimage(img);
			moviesList.add(movie);
		}
		return moviesList;

	}

	public int deleteMovies(int id) throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("delete from movie where movieid = ?");

		pst.setInt(1, id);
		return pst.executeUpdate();
	}

	public Movie FindMoviesById(int id) throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select * from movie where movieid = ?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Movie m = new Movie();
		m.setMovieid(rs.getInt(1));
		m.setMoviename(rs.getString(2));
		m.setMovieprice(rs.getDouble(3));
		m.setMovieratings(rs.getDouble(4));
		m.setMoviegenre(rs.getString(5));
		m.setMovielanguage(rs.getString(6));
		Blob b = rs.getBlob(7);
		byte[] img = b.getBytes(1, (int) b.length());
		m.setMovieimage(img);
		return m;

	}

	public int updateMovie(Movie movie) throws SQLException, ClassNotFoundException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement(
				"update movie set moviename=?, movieprice=?,movieratings=?,moviegenre=?,movielanguage=?,movieimage=? where movieid=?");

		pst.setInt(7, movie.getMovieid());
		pst.setString(1, movie.getMoviename());
		pst.setDouble(2, movie.getMovieprice());
		pst.setDouble(3, movie.getMovieratings());
		pst.setString(4, movie.getMoviegenre());
		pst.setString(5, movie.getMovielanguage());
		Blob imageBlob = new SerialBlob(movie.getMovieimage());
		pst.setBlob(6, imageBlob);

		return pst.executeUpdate();
	}

	public int saveUser(User user) throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("insert into user values(?,?,?,?,?)");

		pst.setInt(1, user.getId());
		pst.setString(2, user.getName());
		pst.setLong(3, user.getContact());
		pst.setString(4, user.getEmail());
		pst.setString(5, user.getPassword());

		return pst.executeUpdate();
	}

	public User FindByEmailUser(String useremail) throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select * from user where useremail=?");

		pst.setString(1, useremail);
		ResultSet rs = pst.executeQuery();

		User user = new User();
		if (rs.next()) {
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setContact(rs.getLong(3));
			user.setEmail(rs.getString(4));
			user.setPassword(rs.getString(5));
			return user;
		} else {
			return null;
		}
	}
	
	public int saveUserAndMovieId(int user ,int movie) throws ClassNotFoundException, SQLException {
		Connection conn=getConnection();
		PreparedStatement pst =conn.prepareStatement("insert into usermovies values(?,?)");
		pst.setInt(1, user);
		pst.setInt(2, movie);
		
		return pst.executeUpdate();
	}
	public boolean checkUserAndMovie(int user,int movie) throws ClassNotFoundException, SQLException {
		Connection conn=getConnection();
		PreparedStatement pst =conn.prepareStatement("select * from usermovies where userid=? and movieid=?");
		pst.setInt(1, user);
		pst.setInt(2, movie);
		ResultSet rs = pst.executeQuery();
		
		if (rs.next()) {
			return false;
		}
		else {
			return true;
		}
		
	}
}