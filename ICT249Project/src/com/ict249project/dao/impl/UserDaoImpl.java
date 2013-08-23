package com.ict249project.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ict249project.dao.DbManager;
import com.ict249project.dao.UserDao;
import com.ict249project.model.User;

public class UserDaoImpl implements UserDao {

	private C3p0DbManager manager=null;

	public UserDaoImpl() {
		super();
		this.manager = manager;
	}
	
	@Override
	public User getUser(String username, String password) throws DaoException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs=null;
		User user=null;
		String sql = "SELECT key_user,fld_username,fld_password,tbl_role.fld_role_type from tbl_user, tbl_role where tbl_user.fld_username='"+username+"' and tbl_user.fld_password='"+password+"' and tbl_user.key_role=tbl_role.key_role";
		try {
			if(manager==null){
				manager = (C3p0DbManager) C3p0DbManager.getInstance();	
			}
			System.out.println(sql);
			conn = manager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("key_user");
				String uname = rs.getString("fld_username");
				String pword = rs.getString("fld_password");
				user = new User(id,uname,pword);	
			}	
		} catch (SQLException e) {
			throw new DaoException(e.getMessage(),e);
		}	
		return user;
	}

}
