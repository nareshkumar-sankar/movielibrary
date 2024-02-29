package DTO;

import java.util.Arrays;

public class Movie {
	private int movieid;
	private String moviename;
	private double movieprice;
	private double movieratings;
	private String moviegenre;
	private String movielanguage;
	private byte[] movieimage;
	private String movielink;
	private String moviedescription;
	
	
	public String getMoviedescription() {
		return moviedescription;
	}
	public void setMoviedescription(String moviedescription) {
		this.moviedescription = moviedescription;
	}
	public int getMovieid() {
		return movieid;
	}
	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}
	public String getMovielink() {
		return movielink;
	}
	public void setMovielink(String movielink) {
		this.movielink = movielink;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public double getMovieprice() {
		return movieprice;
	}
	public void setMovieprice(double movieprice) {
		this.movieprice = movieprice;
	}
	public double getMovieratings() {
		return movieratings;
	}
	public void setMovieratings(double movieratings) {
		this.movieratings = movieratings;
	}
	public String getMoviegenre() {
		return moviegenre;
	}
	public void setMoviegenre(String moviegenre) {
		this.moviegenre = moviegenre;
	}
	public String getMovielanguage() {
		return movielanguage;
	}
	public void setMovielanguage(String movielanguage) {
		this.movielanguage = movielanguage;
	}
	public byte[] getMovieimage() {
		return movieimage;
	}
	public void setMovieimage(byte[] movieimage) {
		this.movieimage = movieimage;
	}
	@Override
	public String toString() {
		return "Movie [movieid=" + movieid + ", moviename=" + moviename + ", movieprice=" + movieprice
				+ ", movieratings=" + movieratings + ", moviegenre=" + moviegenre + ", movielanguage=" + movielanguage
				+ ", movieimage=" + Arrays.toString(movieimage) + "]";
	}
	
}
