package com.ict249project.dao.impl;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import com.ict249project.dao.DbManager;

public class C3p0DbManager implements DbManager {
	private String driverName = "com.mysql.jdbc.Driver";
	private String password ="mysql";
	private String url ="jdbc:mysql://localhost:3309/DBAndroid";
	private String userName= "root";
	private Map properties;
	
	private DataSource pooledDataSource;

	private volatile static DbManager INSTANCE =null;

	public static DbManager getInstance() throws DaoException{
		if(INSTANCE==null){
			synchronized(DbManager.class){
				if(INSTANCE==null){
					INSTANCE= new C3p0DbManager();
				}
			}
		}
	return INSTANCE;
	}
	
	private C3p0DbManager() throws DaoException {
		try {
			Class.forName(driverName);
			// connection = DriverManager.getConnection();
			DataSource unpooledDataSource = DataSources.unpooledDataSource(url,userName, password);
			properties = new HashMap();
			properties.put("maxPoolSize", 60);
			properties.put("minPoolSize", 5);
			pooledDataSource = DataSources.pooledDataSource(unpooledDataSource, properties);
		} catch (ClassNotFoundException e) {
			throw new DaoException(e.getMessage(),e);
		} catch (SQLException e) {
			throw new DaoException("error getting connection "
					+ "url: "+url
					+"userName: "+userName
					+"driverName: "+driverName,e);
		}
	}

	@Override
	public Connection getConnection() throws DaoException {
		Connection conn=null;
		try {
			conn= pooledDataSource.getConnection();
		} catch (SQLException e) {
			throw new DaoException("Error creating a connection" +
					"url:"+url+
					"driverName:"+driverName+
					"userName: "+userName, e);
		}
		return conn;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Map getProperties() {
		return properties;
	}

	public void setProperties(Map properties) {
		this.properties = properties;
	}
}
