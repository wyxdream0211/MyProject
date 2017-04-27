package com.service;

import java.util.List;

import com.beans.User;

public interface UserService {

	//1：根据主键查询
	public User queryByUserId(String id);
	//2：查询所有用户信息
	public List<User> queryAll();
	//3：新增用户信息
	public boolean addUser(User user);
	//4：更新用户信息
	public boolean updateUser(User user);
	//5：删除用户信息
	public int deleteByUserId();
	//6：根据用户名查询
	public User queryByUserName(String username);
	//7：检测用户名是否已注册
	public boolean isExistByUserName(String username);
}
