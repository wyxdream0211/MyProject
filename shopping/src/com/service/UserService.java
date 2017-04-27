package com.service;

import java.util.List;

import com.beans.User;

public interface UserService {

	//1������������ѯ
	public User queryByUserId(String id);
	//2����ѯ�����û���Ϣ
	public List<User> queryAll();
	//3�������û���Ϣ
	public boolean addUser(User user);
	//4�������û���Ϣ
	public boolean updateUser(User user);
	//5��ɾ���û���Ϣ
	public int deleteByUserId();
	//6�������û�����ѯ
	public User queryByUserName(String username);
	//7������û����Ƿ���ע��
	public boolean isExistByUserName(String username);
}
