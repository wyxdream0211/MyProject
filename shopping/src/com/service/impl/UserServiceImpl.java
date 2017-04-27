package com.service.impl;

import java.util.List;

import com.beans.User;
import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao dao = new UserDaoImpl();
	
	public boolean addUser(User user) {
		boolean flag = true;
		try {
			flag = dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User queryByUserName(String username){
		User user = null;
		try {
			user = dao.queryByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean isExistByUserName(String username) {
		boolean flag = true;
		try {
			flag = dao.isExistByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int deleteByUserId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> queryAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public User queryByUserId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateUser(User user) {
		boolean flag = true;
		try {
			flag = dao.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}



}
