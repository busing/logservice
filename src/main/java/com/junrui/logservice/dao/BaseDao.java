package com.junrui.logservice.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseDao {
	
	@Autowired
	private JdbcTemplate dbHandle;
	

	public JdbcTemplate getDbHandle() {
		return dbHandle;
	}

	public void setDbHandle(JdbcTemplate dbHandle) {
		this.dbHandle = dbHandle;
	}
	
	
}
