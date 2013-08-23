package com.ict249project.dao;

import java.sql.Connection;

import com.ict249project.dao.impl.DaoException;

public interface DbManager {
	public Connection getConnection() throws DaoException;
}
