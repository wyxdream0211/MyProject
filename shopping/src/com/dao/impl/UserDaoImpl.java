package com.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.beans.User;
import com.dao.UserDao;
import com.util.JdbcUtil;

public class UserDaoImpl implements UserDao {

	public boolean addUser(User user) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("insert into users(userid,username,password,street1,street2,city,zip,email,homephone,cellphone,officephone) ");
		buffer.append(" values(user_id.nextval,?,?,?,?,?,?,?,?,?,?)");
		List<Object> params = new ArrayList<Object>();
		params.add(user.getUsername());
		params.add(user.getPassword());
		params.add(user.getStreet1());
		params.add(user.getStreet2());
		params.add(user.getCity());
		params.add(user.getZip());
		params.add(user.getEmail());
		params.add(user.getHomephone());
		params.add(user.getCellphone());
		params.add(user.getOfficephone());
		
		boolean flag = util.updateByPrearedStatement(buffer.toString(), params);
		util.close();
		return flag;
	}

	public User queryByUserName(String username) throws Exception {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		String sql = "select userid,password,street1,street2,city,zip,email,homephone,cellphone,officephone from users where username=?";
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		ResultSet rs = util.queryByPreparedStatement(sql, params);
		User user = null;
		if(rs.next()){
			user = new User();
			user.setUserid(rs.getInt("userid"));
			user.setUsername(username);
			user.setPassword(rs.getString("password"));
			user.setStreet1(rs.getString("street1"));
			user.setStreet2(rs.getString("street2"));
			user.setCity(rs.getString("city"));
			user.setZip(rs.getString("zip"));
			user.setEmail(rs.getString("email"));
			user.setHomephone(rs.getString("homephone"));
			user.setCellphone(rs.getString("cellphone"));
			user.setOfficephone(rs.getString("officephone"));
		}
		return user;
	}
	public boolean isExistByUserName(String username) throws Exception {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		String sql = "select username from users where username=?";
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		ResultSet rs = util.queryByPreparedStatement(sql, params);
		boolean flag = true;
		if(rs.next()){
			flag = false;
		}
		util.close();
		return flag;
	}
	public int deleteByUserId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> queryAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public User queryByUserId(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateUser(User user) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
			String sql="update users set password=?,street1=?,street2=?,city=?,zip=?,email=?,homephone=?,officephone=?,cellphone=? where username=?";
			List<Object> params=new ArrayList<Object>();
			params.add(user.getPassword());
			params.add(user.getStreet1());
			params.add(user.getStreet2());
			params.add(user.getCity());
			params.add(user.getZip());
			params.add(user.getEmail());
			params.add(user.getHomephone());
			params.add(user.getOfficephone());
			params.add(user.getCellphone());
			params.add(user.getUsername());
			boolean flag = util.updateByPrearedStatement(sql, params);
			util.close();
			return flag;
	}

}
