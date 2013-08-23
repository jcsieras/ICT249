package com.ict249project.dao;

import com.ict249project.dao.impl.DaoException;
import com.ict249project.model.User;

public interface StudentDao {
	public User getUser(String username, String password) throws DaoException;
}
