package com.ict249project.dao.impl;


import java.sql.SQLException;

public class DaoException extends Exception {

	public DaoException(String string, SQLException e) {
		// TODO Auto-generated constructor stub
	}

	public DaoException(String message, ClassNotFoundException e) {
		// TODO Auto-generated constructor stub
	}

	public DaoException(String message, Exception e) {
		// TODO Auto-generated constructor stub
	}

	public DaoException(ClassNotFoundException e) {
		// TODO Auto-generated constructor stub
	}



}
